import 'dart:convert';

import 'package:doniranjeorgana_mobile/models/specijalizacija.dart';
import 'package:doniranjeorgana_mobile/providers/base_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class SpecijalizacijaProvider extends BaseProvider<Specijalizacija> {
  SpecijalizacijaProvider() : super("Specijalizacija");

  @override
  Specijalizacija fromJson(data) {
    return Specijalizacija.fromJson(data);
  }
}