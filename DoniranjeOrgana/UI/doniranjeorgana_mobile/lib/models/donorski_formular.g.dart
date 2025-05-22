// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'donorski_formular.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DonorskiFormular _$DonorskiFormularFromJson(Map<String, dynamic> json) =>
    DonorskiFormular(
      (json['donorskiFormularId'] as num?)?.toInt(),
      json['datumPrijave'] == null
          ? null
          : DateTime.parse(json['datumPrijave'] as String),
      json['organiZaDonaciju'] as String?,
      json['saglasnost'] as int?,
     // json['nacinSaglasnosti'] as String?,
     // json['statusPrijave'] as String?,
      json['napomena'] as String?,
      json['datumAzuriranja'] == null
          ? null
          : DateTime.parse(json['datumAzuriranja'] as String),
      (json['pacijentId'] as num?)?.toInt(),
      json['potpis'] as String?,
    );

Map<String, dynamic> _$DonorskiFormularToJson(DonorskiFormular instance) =>
    <String, dynamic>{
      'donorskiFormularId': instance.donorskiFormularId,
      'datumPrijave': instance.datumPrijave?.toIso8601String(),
      'organiZaDonaciju': instance.organiZaDonaciju,
      'saglasnost': instance.saglasnost,
     // 'nacinSaglasnosti': instance.nacinSaglasnosti,
     // 'statusPrijave': instance.statusPrijave,
      'napomena': instance.napomena,
      'datumAzuriranja': instance.datumAzuriranja?.toIso8601String(),
      'pacijentId': instance.pacijentId,
      'potpis': instance.potpis,
    };
