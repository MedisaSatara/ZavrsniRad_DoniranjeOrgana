import 'dart:convert';

import 'package:doniranjeorgana_desktop/models/pacijent.dart';
import 'package:doniranjeorgana_desktop/providers/base_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class PacijentProvider extends BaseProvider<Pacijent> {
  PacijentProvider() : super("Pacijent");

  @override
  Pacijent fromJson(data) {
    return Pacijent.fromJson(data);
  }

  authenticate(String username, String password) {}
}
