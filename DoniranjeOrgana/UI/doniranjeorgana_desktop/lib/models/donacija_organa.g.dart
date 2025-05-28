// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'donacija_organa.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DonacijaOrgana _$DonacijaOrganaFromJson(Map<String, dynamic> json) =>
    DonacijaOrgana(
      (json['donacijaOrganaId'] as num?)?.toInt(),
      (json['donoriId'] as num?)?.toInt(),
      (json['donorskiFormularId'] as num?)?.toInt(),
      json['statusDonora'] as String?,
      (json['aktivanDonor'] as num?)?.toInt(),
      json['datumAktivacije'] == null
          ? null
          : DateTime.parse(json['datumAktivacije'] as String),
      json['datumSmrti'] == null
          ? null
          : DateTime.parse(json['datumSmrti'] as String),
    );

Map<String, dynamic> _$DonacijaOrganaToJson(DonacijaOrgana instance) =>
    <String, dynamic>{
      'donacijaOrganaId': instance.donacijaOrganaId,
      'donoriId': instance.donoriId,
      'donorskiFormularId': instance.donorskiFormularId,
      'statusDonora': instance.statusDonora,
      'aktivanDonor': instance.aktivanDonor,
      'datumAktivacije': instance.datumAktivacije?.toIso8601String(),
      'datumSmrti': instance.datumSmrti?.toIso8601String(),
    };
