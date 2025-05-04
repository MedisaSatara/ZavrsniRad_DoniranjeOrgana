import 'dart:convert';

import 'package:doniranjeorgana_desktop/models/korisnik_uloga.dart';
import 'package:doniranjeorgana_desktop/providers/base_provider.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class KorisnikUlogaProvider extends BaseProvider<KorisnikUloga> {
  KorisnikUlogaProvider() : super("KorisnikUloga");

  @override
  KorisnikUloga fromJson(data) {
    return KorisnikUloga.fromJson(data);
  }

  
}
