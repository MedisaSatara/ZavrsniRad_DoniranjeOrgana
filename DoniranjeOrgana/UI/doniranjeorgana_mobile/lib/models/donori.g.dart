// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'donori.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Donori _$DonoriFromJson(Map<String, dynamic> json) => Donori(
      (json['donorId'] as num?)?.toInt(),
      json['ime'] as String?,
      json['prezime'] as String?,
      json['spol'] as String?,
      json['datumRodjenja'] as String?,
      json['mjestoRodjenja'] as String?,
      json['jmbg'] as String?,
      json['telefon'] as String?,
      json['prebivaliste'] as String?,
      json['krvnaGrupa'] as String?,
      json['rhFaktor'] as String?,
      json['alergija'] as String?,
      json['hronicneBolesti'] as String?,
      (json['korisnikId'] as num?)?.toInt(),
      json['korisnickoIme'] as String?,
      json['korisnik'] == null
          ? null
          : Korisnik.fromJson(json['korisnik'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DonoriToJson(Donori instance) => <String, dynamic>{
      'donorId': instance.donorId,
      'ime': instance.ime,
      'prezime': instance.prezime,
      'spol': instance.spol,
      'datumRodjenja': instance.datumRodjenja,
      'mjestoRodjenja': instance.mjestoRodjenja,
      'jmbg': instance.jmbg,
      'telefon': instance.telefon,
      'prebivaliste': instance.prebivaliste,
      'krvnaGrupa': instance.krvnaGrupa,
      'rhFaktor': instance.rhFaktor,
      'hronicneBolesti': instance.hronicneBolesti,
      'korisnickoIme': instance.korisnickoIme,
      'alergija': instance.alergija,
      'korisnikId': instance.korisnikId,
      'korisnik': instance.korisnik,
    };
