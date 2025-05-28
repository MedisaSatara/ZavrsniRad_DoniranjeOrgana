import 'dart:convert';

import 'package:doniranjeorgana_desktop/models/donacija_krvi.dart';
import 'package:doniranjeorgana_desktop/models/donori.dart';
import 'package:doniranjeorgana_desktop/providers/base_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class DonacijaKrviProvider extends BaseProvider<DonacijaKrvi> {
  DonacijaKrviProvider() : super("DonacijaKrvi");

  @override
  DonacijaKrvi fromJson(data) {
    return DonacijaKrvi.fromJson(data);
  }

}
