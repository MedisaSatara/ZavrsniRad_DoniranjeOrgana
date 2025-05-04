import 'dart:convert';

import 'package:doniranjeorgana_desktop/models/osiguranje.dart';
import 'package:doniranjeorgana_desktop/providers/base_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class OsiguranjeProvider extends BaseProvider<Osiguranje> {
  OsiguranjeProvider() : super("Osiguranje");

  @override
  Osiguranje fromJson(data) {
    return Osiguranje.fromJson(data);
  }
}
