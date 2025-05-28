import 'package:doniranjeorgana_desktop/models/korisnik.dart';
import 'package:json_annotation/json_annotation.dart';

/// This allows the `User` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'donacija_krvi.g.dart';

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.
@JsonSerializable()
class DonacijaKrvi {
  DonacijaKrvi(
    this.donacijaKrviId,
    this.donoriId,
    this.datumDonacije,
    this.kolicina,
    this.lokacija,
    this.napomena,
    this.status,
  );
  int? donacijaKrviId;
  int? donoriId;
  DateTime? datumDonacije;
  String? kolicina;
  String? lokacija;
  String? napomena;
  String? status;

  factory DonacijaKrvi.fromJson(Map<String, dynamic> json) => _$DonacijaKrviFromJson(json);

  Map<String, dynamic> toJson() => _$DonacijaKrviToJson(this);
}
