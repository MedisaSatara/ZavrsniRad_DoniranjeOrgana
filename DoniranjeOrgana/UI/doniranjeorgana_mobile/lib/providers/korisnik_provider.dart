import 'dart:convert';

import 'package:doniranjeorgana_mobile/models/korisnik.dart';
import 'package:doniranjeorgana_mobile/providers/base_provider.dart';

import 'package:http/http.dart' as http;

class KorisnikProvider extends BaseProvider<Korisnik> {
  KorisnikProvider() : super("Korisnik");

  @override
  Korisnik fromJson(data) {
    return Korisnik.fromJson(data);
  }

  Future<Korisnik?> login(String username, String password) async {
    try {
      var url = "$totalUrl/login";
      var uri = Uri.parse(url);

      var headers = createHeaders();
      var body = jsonEncode({'username': username, 'password': password});

      var response = await http.post(uri, headers: headers, body: body);

      if (isValidResponse(response)) {
        var data = jsonDecode(response.body);
        Korisnik user = fromJson(data);
        return user;
      } else {
        print("Invalid credentials");
        return null;
      }
    } catch (e) {
      print("Error during login: $e");
      return null;
    }
  }

  Future<Korisnik> Authenticate({dynamic filter}) async {
    var url = "$totalUrl/Authenticate";

    var uri = Uri.parse(url);

    var headers = createHeaders();
    var response = await http.get(uri, headers: headers);
    if (isValidResponse(response)) {
      var data = jsonDecode(response.body);
      Korisnik user = fromJson(data) as Korisnik;
      return user;
    } else {
      throw Exception("Pogrešno korisničko ime ili lozinka");
    }
  }

  Future<String?> registruj({
    required String ime,
    required String prezime,
    required String korisnickoIme,
    required String email,
    required String lozinka,
  }) async {
    final url = Uri.parse('$totalUrl');
    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "ime": ime,
          "prezime": prezime,
          "korisnickoIme": korisnickoIme,
          "email": email,
          "password": lozinka,
        }),
      );

      if (response.statusCode == 200) {
        return null;
      } else {
        return 'Greška: ${response.body}';
      }
    } catch (e) {
      return 'Došlo je do greške: $e';
    }
  }
}
