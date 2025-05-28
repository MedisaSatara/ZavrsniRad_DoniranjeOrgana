import 'dart:convert';

import 'package:doniranjeorgana_desktop/models/donori.dart';
import 'package:doniranjeorgana_desktop/providers/base_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class DonoriProvider extends BaseProvider<Donori> {
  DonoriProvider() : super("Donori");

  @override
  Donori fromJson(data) {
    return Donori.fromJson(data);
  }

}
