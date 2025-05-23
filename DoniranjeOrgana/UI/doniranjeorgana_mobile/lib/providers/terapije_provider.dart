import 'dart:convert';

import 'package:doniranjeorgana_mobile/models/terapija.dart';
import 'package:doniranjeorgana_mobile/providers/base_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class TerapijaProvider extends BaseProvider<Terapija> {
  TerapijaProvider() : super("Terapija");

  @override
  Terapija fromJson(data) {
    return Terapija.fromJson(data);
  }
}