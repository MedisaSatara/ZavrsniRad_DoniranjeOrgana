import 'package:json_annotation/json_annotation.dart';

/// This allows the `User` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'specijalizacija.g.dart';

@JsonSerializable()
class Specijalizacija {
  int? specijalizacijaId;
  String? naziv;
  String? telefon;

  Specijalizacija({this.specijalizacijaId, this.naziv, this.telefon});

  factory Specijalizacija.fromJson(Map<String, dynamic> json) => _$SpecijalizacijaFromJson(json);

  Map<String, dynamic> toJson() => _$SpecijalizacijaToJson(this);
}
