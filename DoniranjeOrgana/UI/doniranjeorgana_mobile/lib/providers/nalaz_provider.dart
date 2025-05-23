import 'dart:convert';

import 'package:doniranjeorgana_mobile/models/nalaz.dart';
import 'package:doniranjeorgana_mobile/providers/base_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class NalazProvider extends BaseProvider<Nalaz> {
  NalazProvider() : super("Nalaz");

  @override
  Nalaz fromJson(data) {
    return Nalaz.fromJson(data);
  }
}