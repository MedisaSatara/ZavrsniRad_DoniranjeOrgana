import 'dart:convert';
import 'package:doniranjeorgana_desktop/models/search_result.dart';
import 'package:doniranjeorgana_desktop/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

abstract class BaseProvider<T> with ChangeNotifier {
  static String? _baseUrl;
  String _endpoint;
  String? totalUrl;

  BaseProvider(String endpoint) : _endpoint = endpoint {
    _baseUrl = const String.fromEnvironment("baseUrl",
        defaultValue: "https://localhost:7040/");
    totalUrl = "$_baseUrl$_endpoint";
  }
  Future<SearchResult<T>> get({dynamic filter}) async {
    var url = "$_baseUrl$_endpoint";

    if (filter != null) {
      var queryString = getQueryString(filter);
      url = "$url?$queryString";
    }

    var uri = Uri.parse(url);
    var headers = createHeaders();

    try {
      var response = await http.get(uri, headers: headers);

      if (isValidResponse(response)) {
        var data = jsonDecode(response.body);
        var result = SearchResult<T>();
        result.count = data['count'];
        for (var item in data['result']) {
          result.result.add(fromJson(item));
        }
        return result;
      } else {
        throw Exception("Unknown error");
      }
    } catch (e) {
      print("Error during GET request: $e");
      rethrow;
    }
  }

  T fromJson(dynamic data);

  Future<T> update(int id, [dynamic request]) async {
    var url = "$_baseUrl$_endpoint/$id";
    var uri = Uri.parse(url);
    var headers = createHeaders();

    try {
      var jsonRequest = jsonEncode(request);
      var response = await http.put(uri, headers: headers, body: jsonRequest);

      if (isValidResponse(response)) {
        var data = jsonDecode(response.body);
        return fromJson(data);
      } else {
        throw Exception("Unknown error");
      }
    } catch (e) {
      print("Error during PUT request: $e");
      rethrow;
    }
  }

  Future<T> insert(dynamic request) async {
    var url = "$_baseUrl$_endpoint";
    var uri = Uri.parse(url);
    var headers = createHeaders();

    try {
      var jsonRequest = jsonEncode(request);
      print("Request URL: $url");
      print("Request Headers: $headers");
      print("Request Body: $jsonRequest");

      var response = await http.post(uri, headers: headers, body: jsonRequest);

      print("Response Status Code: ${response.statusCode}");
      print("Response Body: ${response.body}");

      if (isValidResponse(response)) {
        var data = jsonDecode(response.body);
        return fromJson(data);
      } else {
        throw Exception("Error: ${response.statusCode} ${response.body}");
      }
    } catch (e) {
      print("Error during POST request: $e");
      rethrow;
    }
  }

  Future<T> delete(int? id) async {
    var url = "$_baseUrl$_endpoint/$id";
    var uri = Uri.parse(url);
    var headers = createHeaders();

    Response response = await http.delete(uri, headers: headers);

    if (isValidResponse(response)) {
      var data = jsonDecode(response.body);
      notifyListeners();
      return fromJson(data);
    } else {
      throw Exception("Unknown error");
    }
  }

  String getQueryString(Map params,
      {String prefix = '&', bool inRecursion = false}) {
    String query = '';
    params.forEach((key, value) {
      if (inRecursion) {
        key = (key is int) ? '[$key]' : '.$key';
      }
      if (value is String || value is int || value is double || value is bool) {
        var encoded = Uri.encodeComponent(value.toString());
        query += '$prefix$key=$encoded';
      } else if (value is DateTime) {
        query += '$prefix$key=${(value as DateTime).toIso8601String()}';
      } else if (value is List || value is Map) {
        if (value is List) value = value.asMap();
        value.forEach((k, v) {
          query +=
              getQueryString({k: v}, prefix: '$prefix$key', inRecursion: true);
        });
      }
    });
    return query;
  }

  bool isValidResponse(Response response) {
    if (response.statusCode < 300) {
      return true;
    } else if (response.statusCode == 401) {
      throw Exception("Unauthorized");
    } else {
      print(response.body);
      throw Exception("Something bad happened, please try again");
    }
  }

  Map<String, String> createHeaders() {
    String username = Authorization.username ?? "";
    String password = Authorization.password ?? "";

    print("Passed credentials: $username, $password");

    String Basic = "Basic ${base64Encode(utf8.encode('$username:$password'))}";

    return {
      "Content-Type": "application/json",
      "Authorization": Basic,
    };
  }

  Future<bool> provjeriStaruLozinku(int korisnikId, String staraLozinka) async {
    String url = totalUrl ?? "$_baseUrl$_endpoint";

    try {
      var response = await http.post(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "korisnikId": korisnikId,
          "staraLozinka": staraLozinka,
        }),
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body) as bool;
      } else {
        print("Greška: ${response.statusCode}");
        return false;
      }
    } catch (e) {
      print("Greška: $e");
      return false;
    }
  }

  Future<bool> checkOldPassword(int korisnikId, String oldPassword) async {
    final url = totalUrl ?? "$_baseUrl$_endpoint";

    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'korisnikId': korisnikId,
        'staraLozinka': oldPassword,
      }),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['isPasswordCorrect'] ?? false;
    } else {
      throw Exception('Failed to check password');
    }
  }

  Future<T> getById(int? id) async {
    var url = "$_baseUrl$_endpoint/$id";
    var uri = Uri.parse(url);
    var headers = createHeaders();

    Response response = await http.get(uri, headers: headers);
    if (isValidResponse(response)) {
      var data = jsonDecode(response.body);
      return fromJson(data);
    } else {
      throw Exception("Unknown error");
    }
  }

  /*Future<void> posaljiMail(String krvnaGrupa) async {
    final url = Uri.parse(totalUrl ?? "$_baseUrl$_endpoint");
    var headers = createHeaders();
    final response = await http.post(
      url,
      headers: headers,
      body: '"$krvnaGrupa"',
    );

    if (response.statusCode != 200) {
      throw Exception('Greška prilikom slanja emailova: ${response.body}');
    }
  }*/

  Future<String> posaljiMail(String krvnaGrupa) async {
    final url = Uri.parse(totalUrl ?? "$_baseUrl$_endpoint");

    String username = Authorization.username ?? "";
    String password = Authorization.password ?? "";

    String basicAuth =
        "Basic ${base64Encode(utf8.encode('$username:$password'))}";

    final headers = {
      'Content-Type': 'application/json',
      'Authorization': basicAuth,
    };

    final response = await http.post(
      url,
      headers: headers,
      body: jsonEncode(krvnaGrupa),
    );

    if (response.statusCode == 200) {
      return 'Email uspješno poslan donorima.';
    } else {
      throw Exception('Greška: ${response.body}');
    }
  }
}
