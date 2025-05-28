import 'dart:convert';
import 'dart:typed_data';

import 'package:json_annotation/json_annotation.dart';

/// This allows the `User` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'donacija_organa.g.dart';

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.
@JsonSerializable()
class DonacijaOrgana {
  DonacijaOrgana(
    this.donacijaOrganaId,
    this.donoriId,
    this.donorskiFormularId,
    this.statusDonora,
    this.aktivanDonor,
    this.datumAktivacije,
    this.datumSmrti,
  );

  int? donacijaOrganaId;
  int? donoriId;
  int? donorskiFormularId;
  String? statusDonora;
  int? aktivanDonor;
  DateTime? datumAktivacije;
  DateTime? datumSmrti;

  factory DonacijaOrgana.fromJson(Map<String, dynamic> json) =>
      _$DonacijaOrganaFromJson(json);

  Map<String, dynamic> toJson() => _$DonacijaOrganaToJson(this);
}
