// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'donori.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Donori _$DonoriFromJson(Map<String, dynamic> json) => Donori(
      (json['donoriId'] as num?)?.toInt(),
      json['mjestoRodjenja'] as String?,
      json['jmbg'] as String?,
      json['telefon'] as String?,
      json['prebivaliste'] as String?,
      json['krvnaGrupa'] as String?,
      json['rhFaktor'] as String?,
      json['alergija'] as String?,
      json['hronicneBolesti'] as String?,
      (json['korisnikId'] as num?)?.toInt(),
      json['korisnik'] == null
          ? null
          : Korisnik.fromJson(json['korisnik'] as Map<String, dynamic>),
      json['statusDonora'] as String?,
      (json['aktivanDonor'] as num?)?.toInt(),
      json['datumAktivacije'] == null
          ? null
          : DateTime.parse(json['datumAktivacije'] as String),
      json['datumSmrti'] == null
          ? null
          : DateTime.parse(json['datumSmrti'] as String),
    );

Map<String, dynamic> _$DonoriToJson(Donori instance) => <String, dynamic>{
      'donoriId': instance.donoriId,
      'mjestoRodjenja': instance.mjestoRodjenja,
      'jmbg': instance.jmbg,
      'telefon': instance.telefon,
      'prebivaliste': instance.prebivaliste,
      'krvnaGrupa': instance.krvnaGrupa,
      'rhFaktor': instance.rhFaktor,
      'hronicneBolesti': instance.hronicneBolesti,
      'alergija': instance.alergija,
      'korisnikId': instance.korisnikId,
      'statusDonora': instance.statusDonora,
      'aktivanDonor': instance.aktivanDonor,
      'datumAktivacije': instance.datumAktivacije?.toIso8601String(),
      'datumSmrti': instance.datumSmrti?.toIso8601String(),
      'korisnik': instance.korisnik,
    };
