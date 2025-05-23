import 'dart:convert';

import 'package:doniranjeorgana_mobile/models/doktor.dart';
import 'package:doniranjeorgana_mobile/providers/base_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class DoktorProvider extends BaseProvider<Doktor> {
  DoktorProvider() : super("Doktor");

  @override
  Doktor fromJson(data) {
    return Doktor.fromJson(data);
  }
}