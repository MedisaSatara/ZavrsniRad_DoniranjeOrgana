import 'package:doniranjeorgana_desktop/models/korisnik.dart';
import 'package:json_annotation/json_annotation.dart';

/// This allows the `User` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'donori.g.dart';

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.
@JsonSerializable()
class Donori {
  Donori(
    this.donorId,
    this.mjestoRodjenja,
    this.jmbg,
    this.telefon,
    this.prebivaliste,
    this.krvnaGrupa,
    this.rhFaktor,
    this.alergija,
    this.hronicneBolesti,
    this.korisnikId,
    this.korisnik,
    this.statusDonora,
    this.aktivanDonor,
    this.datumAktivacije,
    this.datumSmrti,
  );

  int? donorId;
  String? mjestoRodjenja;
  String? jmbg;
  String? telefon;
  String? prebivaliste;
  String? krvnaGrupa;
  String? rhFaktor;
  String? hronicneBolesti;
  String? alergija;
  int? korisnikId;
  String? statusDonora;
  int? aktivanDonor;
  DateTime? datumAktivacije;
  DateTime? datumSmrti;

  Korisnik? korisnik;

  factory Donori.fromJson(Map<String, dynamic> json) => _$DonoriFromJson(json);

  Map<String, dynamic> toJson() => _$DonoriToJson(this);
}
