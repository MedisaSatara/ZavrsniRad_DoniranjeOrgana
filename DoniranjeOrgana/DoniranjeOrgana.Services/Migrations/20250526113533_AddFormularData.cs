using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace DoniranjeOrgana.Services.Migrations
{
    public partial class AddFormularData : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DeleteData(
                table: "DonorskiFormula",
                keyColumn: "DonorskiFormularId",
                keyValue: 45);

            migrationBuilder.DeleteData(
                table: "DonorskiFormula",
                keyColumn: "DonorskiFormularId",
                keyValue: 46);

            migrationBuilder.DeleteData(
                table: "DonorskiFormula",
                keyColumn: "DonorskiFormularId",
                keyValue: 47);

            migrationBuilder.InsertData(
                table: "DonorskiFormula",
                columns: new[] { "DonorskiFormularId", "DatumAzuriranja", "DatumPrijave", "DonorId", "Napomena", "OrganiZaDonaciju", "PacijentId", "Potpis", "Saglasnost" },
                values: new object[,]
                {
                    { 4995, new DateTime(2024, 5, 7, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2024, 5, 7, 0, 0, 0, 0, DateTimeKind.Unspecified), 5501, "", null, null, null, 1 },
                    { 4996, new DateTime(2024, 5, 7, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2024, 5, 7, 0, 0, 0, 0, DateTimeKind.Unspecified), 5513, "", null, null, null, 1 },
                    { 4997, new DateTime(2024, 5, 7, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2024, 5, 7, 0, 0, 0, 0, DateTimeKind.Unspecified), 5515, "", null, null, null, 1 }
                });

            migrationBuilder.UpdateData(
                table: "Korisnik",
                keyColumn: "KorisnikId",
                keyValue: 1001,
                columns: new[] { "LozinkaHash", "LozinkaSalt" },
                values: new object[] { "s3UBeMczwJqtALTTx1dP2/OQ8NI=", "RlpGqxeWX0Dgbl09izSO6A==" });

            migrationBuilder.UpdateData(
                table: "Korisnik",
                keyColumn: "KorisnikId",
                keyValue: 1002,
                columns: new[] { "LozinkaHash", "LozinkaSalt" },
                values: new object[] { "/pTCqi4e0we68quq8Bcbulz5O9Q=", "8xQNrPLi641wwJlp9Zycnw==" });

            migrationBuilder.UpdateData(
                table: "Korisnik",
                keyColumn: "KorisnikId",
                keyValue: 1170,
                columns: new[] { "LozinkaHash", "LozinkaSalt" },
                values: new object[] { "HprRO13NaBB8/t8pDv84+61Mv9c=", "VMBG8DTsgii6QwdsmRlydA==" });

            migrationBuilder.UpdateData(
                table: "Korisnik",
                keyColumn: "KorisnikId",
                keyValue: 1178,
                columns: new[] { "LozinkaHash", "LozinkaSalt" },
                values: new object[] { "XlJJFrNtkgPGuiXX83lUONYKO3M=", "UqPjfxx79hBQWkCT7d5buQ==" });

            migrationBuilder.UpdateData(
                table: "Korisnik",
                keyColumn: "KorisnikId",
                keyValue: 1179,
                columns: new[] { "LozinkaHash", "LozinkaSalt" },
                values: new object[] { "6HdS2Tl5CscepHMDg/5U+F5AukY=", "Gcb7H0rCDP0ghHeEtYvhfA==" });

            migrationBuilder.UpdateData(
                table: "KorisnikUloga",
                keyColumn: "KorisnikUlogaId",
                keyValue: 1,
                column: "DatumIzmjene",
                value: new DateTime(2025, 5, 26, 13, 35, 32, 436, DateTimeKind.Local).AddTicks(1960));

            migrationBuilder.UpdateData(
                table: "KorisnikUloga",
                keyColumn: "KorisnikUlogaId",
                keyValue: 2,
                column: "DatumIzmjene",
                value: new DateTime(2025, 5, 26, 13, 35, 32, 436, DateTimeKind.Local).AddTicks(2016));

            migrationBuilder.UpdateData(
                table: "KorisnikUloga",
                keyColumn: "KorisnikUlogaId",
                keyValue: 19,
                column: "DatumIzmjene",
                value: new DateTime(2025, 5, 26, 13, 35, 32, 436, DateTimeKind.Local).AddTicks(2029));

            migrationBuilder.UpdateData(
                table: "KorisnikUloga",
                keyColumn: "KorisnikUlogaId",
                keyValue: 20,
                column: "DatumIzmjene",
                value: new DateTime(2025, 5, 26, 13, 35, 32, 436, DateTimeKind.Local).AddTicks(2025));

            migrationBuilder.UpdateData(
                table: "KorisnikUloga",
                keyColumn: "KorisnikUlogaId",
                keyValue: 21,
                column: "DatumIzmjene",
                value: new DateTime(2025, 5, 26, 13, 35, 32, 436, DateTimeKind.Local).AddTicks(2021));
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DeleteData(
                table: "DonorskiFormula",
                keyColumn: "DonorskiFormularId",
                keyValue: 4995);

            migrationBuilder.DeleteData(
                table: "DonorskiFormula",
                keyColumn: "DonorskiFormularId",
                keyValue: 4996);

            migrationBuilder.DeleteData(
                table: "DonorskiFormula",
                keyColumn: "DonorskiFormularId",
                keyValue: 4997);

            migrationBuilder.InsertData(
                table: "DonorskiFormula",
                columns: new[] { "DonorskiFormularId", "DatumAzuriranja", "DatumPrijave", "DonorId", "Napomena", "OrganiZaDonaciju", "PacijentId", "Potpis", "Saglasnost" },
                values: new object[,]
                {
                    { 45, new DateTime(2024, 5, 7, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2024, 5, 7, 0, 0, 0, 0, DateTimeKind.Unspecified), 5501, "", null, null, null, 1 },
                    { 46, new DateTime(2024, 5, 7, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2024, 5, 7, 0, 0, 0, 0, DateTimeKind.Unspecified), 5504, "", null, null, null, 1 },
                    { 47, new DateTime(2024, 5, 7, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2024, 5, 7, 0, 0, 0, 0, DateTimeKind.Unspecified), 5503, "", null, null, null, 1 }
                });

            migrationBuilder.UpdateData(
                table: "Korisnik",
                keyColumn: "KorisnikId",
                keyValue: 1001,
                columns: new[] { "LozinkaHash", "LozinkaSalt" },
                values: new object[] { "hV+P7CgvwmHQvBajpkJbP3GT2YI=", "YtT+bHetfzSYsC25q6BUXg==" });

            migrationBuilder.UpdateData(
                table: "Korisnik",
                keyColumn: "KorisnikId",
                keyValue: 1002,
                columns: new[] { "LozinkaHash", "LozinkaSalt" },
                values: new object[] { "4yKT1ScSDS5UY0IfUmGAv7ZHDP4=", "DZNfByIwEwTRJbdDXJ1hag==" });

            migrationBuilder.UpdateData(
                table: "Korisnik",
                keyColumn: "KorisnikId",
                keyValue: 1170,
                columns: new[] { "LozinkaHash", "LozinkaSalt" },
                values: new object[] { "qEab4qT7DekdGyRZ+51b/jgixlc=", "SC7pyKqtN+vTLUkF4hWkAg==" });

            migrationBuilder.UpdateData(
                table: "Korisnik",
                keyColumn: "KorisnikId",
                keyValue: 1178,
                columns: new[] { "LozinkaHash", "LozinkaSalt" },
                values: new object[] { "3UOngems9WKGlkhYnJZ52iqOzZ0=", "j0UJyAgQ0vss81DglRTZvw==" });

            migrationBuilder.UpdateData(
                table: "Korisnik",
                keyColumn: "KorisnikId",
                keyValue: 1179,
                columns: new[] { "LozinkaHash", "LozinkaSalt" },
                values: new object[] { "AjVHd8xmXu2aW3jBcYZXeoBci0c=", "KXbH/TAK1GMj/rnSt7sCEQ==" });

            migrationBuilder.UpdateData(
                table: "KorisnikUloga",
                keyColumn: "KorisnikUlogaId",
                keyValue: 1,
                column: "DatumIzmjene",
                value: new DateTime(2025, 5, 26, 13, 30, 26, 121, DateTimeKind.Local).AddTicks(1536));

            migrationBuilder.UpdateData(
                table: "KorisnikUloga",
                keyColumn: "KorisnikUlogaId",
                keyValue: 2,
                column: "DatumIzmjene",
                value: new DateTime(2025, 5, 26, 13, 30, 26, 121, DateTimeKind.Local).AddTicks(1592));

            migrationBuilder.UpdateData(
                table: "KorisnikUloga",
                keyColumn: "KorisnikUlogaId",
                keyValue: 19,
                column: "DatumIzmjene",
                value: new DateTime(2025, 5, 26, 13, 30, 26, 121, DateTimeKind.Local).AddTicks(1640));

            migrationBuilder.UpdateData(
                table: "KorisnikUloga",
                keyColumn: "KorisnikUlogaId",
                keyValue: 20,
                column: "DatumIzmjene",
                value: new DateTime(2025, 5, 26, 13, 30, 26, 121, DateTimeKind.Local).AddTicks(1636));

            migrationBuilder.UpdateData(
                table: "KorisnikUloga",
                keyColumn: "KorisnikUlogaId",
                keyValue: 21,
                column: "DatumIzmjene",
                value: new DateTime(2025, 5, 26, 13, 30, 26, 121, DateTimeKind.Local).AddTicks(1632));
        }
    }
}
