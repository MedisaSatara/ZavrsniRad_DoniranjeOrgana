// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'specijalizacija.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Specijalizacija _$SpecijalizacijaFromJson(Map<String, dynamic> json) =>
    Specijalizacija(
      specijalizacijaId: (json['specijalizacijaId'] as num?)?.toInt(),
      naziv: json['naziv'] as String?,
      telefon: json['telefon'] as String?,
    );

Map<String, dynamic> _$SpecijalizacijaToJson(Specijalizacija instance) =>
    <String, dynamic>{
      'specijalizacijaId': instance.specijalizacijaId,
      'naziv': instance.naziv,
      'telefon': instance.telefon,
    };
