import 'dart:convert';

import 'package:doniranjeorgana_desktop/models/donacija_organa.dart';
import 'package:doniranjeorgana_desktop/models/donori.dart';
import 'package:doniranjeorgana_desktop/providers/base_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class DonacijaOrganaProvider extends BaseProvider<DonacijaOrgana> {
  DonacijaOrganaProvider() : super("DonacijaOrgana");

  @override
  DonacijaOrgana fromJson(data) {
    return DonacijaOrgana.fromJson(data);
  }
}
