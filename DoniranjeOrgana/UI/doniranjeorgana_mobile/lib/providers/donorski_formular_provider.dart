import 'dart:convert';

import 'package:doniranjeorgana_mobile/models/donorski_formular.dart';
import 'package:doniranjeorgana_mobile/providers/base_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class DonorskiFormularProvider extends BaseProvider<DonorskiFormular> {
  DonorskiFormularProvider() : super("DonorskiFormular");

  @override
  DonorskiFormular fromJson(data) {
    return DonorskiFormular.fromJson(data);
  }
}