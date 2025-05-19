import 'package:json_annotation/json_annotation.dart';

/// This allows the `User` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'donorski_formular.g.dart';

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.
@JsonSerializable()
class DonorskiFormular {
  DonorskiFormular(
      this.donorskiFormularId,
      this.datumPrijave,
      this.organiZaDonaciju,
      this.saglasnost,
      this.nacinSaglasnosti,
      this.statusPrijave,
      this.napomena,
      this.datumAzuriranja,
      this.pacijentId,
      );

  int? donorskiFormularId;
  DateTime? datumPrijave;
  String? organiZaDonaciju;
  bool? saglasnost;
  String? nacinSaglasnosti;
  String? statusPrijave;
  String? napomena;
  DateTime? datumAzuriranja;
  int? pacijentId;

  factory DonorskiFormular.fromJson(Map<String, dynamic> json) =>
      _$DonorskiFormularFromJson(json);

  Map<String, dynamic> toJson() => _$DonorskiFormularToJson(this);
}