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
      this.ime,
      this.prezime,
      this.spol,
      this.datumRodjenja,
      this.mjestoRodjenja,
      this.jmbg,
      this.telefon,
      this.prebivaliste,
      this.krvnaGrupa,
      this.rhFaktor,
      this.alergija,
      this.hronicneBolesti,
      this.korisnikId,
      this.korisnickoIme
      );

  int? donorId;
  String? ime;
  String? prezime;
  String? spol;
  String? datumRodjenja;
  String? mjestoRodjenja;
  String? jmbg;
  String? telefon;
  String? prebivaliste;
  String? krvnaGrupa;
  String? rhFaktor;
  String? hronicneBolesti;
  String? korisnickoIme;
  String? alergija;
  bool? koagulopatija;
  int? korisnikId;

  factory Donori.fromJson(Map<String, dynamic> json) =>
      _$DonoriFromJson(json);

  Map<String, dynamic> toJson() => _$DonoriToJson(this);
}