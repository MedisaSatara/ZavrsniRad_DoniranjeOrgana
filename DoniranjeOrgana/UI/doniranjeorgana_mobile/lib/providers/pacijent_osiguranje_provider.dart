import 'dart:convert';

import 'package:doniranjeorgana_mobile/models/pacijent_osiguranje.dart';
import 'package:doniranjeorgana_mobile/providers/base_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class PacijentOsiguranjeProvider extends BaseProvider<PacijentOsiguranje> {
  PacijentOsiguranjeProvider() : super("PacijentOsiguranje");

  @override
  PacijentOsiguranje fromJson(data) {
    return PacijentOsiguranje.fromJson(data);
  }
}