// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'donacija_krvi.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DonacijaKrvi _$DonacijaKrviFromJson(Map<String, dynamic> json) => DonacijaKrvi(
      (json['donacijaKrviId'] as num?)?.toInt(),
      (json['donorId'] as num?)?.toInt(),
      json['datumDonacije'] == null
          ? null
          : DateTime.parse(json['datumDonacije'] as String),
      json['kolicina'] as String?,
      json['lokacija'] as String?,
      json['napomena'] as String?,
      json['status'] as String?,
    );

Map<String, dynamic> _$DonacijaKrviToJson(DonacijaKrvi instance) =>
    <String, dynamic>{
      'donacijaKrviId': instance.donacijaKrviId,
      'donoriId': instance.donorId,
      'datumDonacije': instance.datumDonacije?.toIso8601String(),
      'kolicina': instance.kolicina,
      'lokacija': instance.lokacija,
      'napomena': instance.napomena,
      'status': instance.status,
    };
