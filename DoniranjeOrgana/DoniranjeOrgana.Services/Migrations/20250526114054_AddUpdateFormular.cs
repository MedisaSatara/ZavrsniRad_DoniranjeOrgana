using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace DoniranjeOrgana.Services.Migrations
{
    public partial class AddUpdateFormular : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.UpdateData(
                table: "DonorskiFormula",
                keyColumn: "DonorskiFormularId",
                keyValue: 4995,
                column: "OrganiZaDonaciju",
                value: "bubreg");

            migrationBuilder.UpdateData(
                table: "DonorskiFormula",
                keyColumn: "DonorskiFormularId",
                keyValue: 4996,
                column: "OrganiZaDonaciju",
                value: "bubreg");

            migrationBuilder.UpdateData(
                table: "DonorskiFormula",
                keyColumn: "DonorskiFormularId",
                keyValue: 4997,
                column: "OrganiZaDonaciju",
                value: "bubreg");

            migrationBuilder.UpdateData(
                table: "Korisnik",
                keyColumn: "KorisnikId",
                keyValue: 1001,
                columns: new[] { "LozinkaHash", "LozinkaSalt" },
                values: new object[] { "DMS9vA1KbI4FjKjfUJ86IaMBXFE=", "PIBwVU2Heey3EoJ/Z6Cb6A==" });

            migrationBuilder.UpdateData(
                table: "Korisnik",
                keyColumn: "KorisnikId",
                keyValue: 1002,
                columns: new[] { "LozinkaHash", "LozinkaSalt" },
                values: new object[] { "0itOlbCwvwEVbKlnuRTul7QnEN8=", "tlLtSnu6vpk2fhXVR7WUQQ==" });

            migrationBuilder.UpdateData(
                table: "Korisnik",
                keyColumn: "KorisnikId",
                keyValue: 1170,
                columns: new[] { "LozinkaHash", "LozinkaSalt" },
                values: new object[] { "T+2/HhMBmWuq2fgNc0NFJSIgzc8=", "0YczFuApR47G48g02iLO4g==" });

            migrationBuilder.UpdateData(
                table: "Korisnik",
                keyColumn: "KorisnikId",
                keyValue: 1178,
                columns: new[] { "LozinkaHash", "LozinkaSalt" },
                values: new object[] { "CPI38xwn2ytIKcrflZPsWyb7Lhk=", "wfdn0WBvlevUbInavynMig==" });

            migrationBuilder.UpdateData(
                table: "Korisnik",
                keyColumn: "KorisnikId",
                keyValue: 1179,
                columns: new[] { "LozinkaHash", "LozinkaSalt" },
                values: new object[] { "8YRrKSdG1WXTkJEfcBATZ8mRpe0=", "G8omiLphFLPzfNbJ6mnwPA==" });

            migrationBuilder.UpdateData(
                table: "KorisnikUloga",
                keyColumn: "KorisnikUlogaId",
                keyValue: 1,
                column: "DatumIzmjene",
                value: new DateTime(2025, 5, 26, 13, 40, 52, 907, DateTimeKind.Local).AddTicks(2944));

            migrationBuilder.UpdateData(
                table: "KorisnikUloga",
                keyColumn: "KorisnikUlogaId",
                keyValue: 2,
                column: "DatumIzmjene",
                value: new DateTime(2025, 5, 26, 13, 40, 52, 907, DateTimeKind.Local).AddTicks(2997));

            migrationBuilder.UpdateData(
                table: "KorisnikUloga",
                keyColumn: "KorisnikUlogaId",
                keyValue: 19,
                column: "DatumIzmjene",
                value: new DateTime(2025, 5, 26, 13, 40, 52, 907, DateTimeKind.Local).AddTicks(3010));

            migrationBuilder.UpdateData(
                table: "KorisnikUloga",
                keyColumn: "KorisnikUlogaId",
                keyValue: 20,
                column: "DatumIzmjene",
                value: new DateTime(2025, 5, 26, 13, 40, 52, 907, DateTimeKind.Local).AddTicks(3007));

            migrationBuilder.UpdateData(
                table: "KorisnikUloga",
                keyColumn: "KorisnikUlogaId",
                keyValue: 21,
                column: "DatumIzmjene",
                value: new DateTime(2025, 5, 26, 13, 40, 52, 907, DateTimeKind.Local).AddTicks(3003));
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.UpdateData(
                table: "DonorskiFormula",
                keyColumn: "DonorskiFormularId",
                keyValue: 4995,
                column: "OrganiZaDonaciju",
                value: null);

            migrationBuilder.UpdateData(
                table: "DonorskiFormula",
                keyColumn: "DonorskiFormularId",
                keyValue: 4996,
                column: "OrganiZaDonaciju",
                value: null);

            migrationBuilder.UpdateData(
                table: "DonorskiFormula",
                keyColumn: "DonorskiFormularId",
                keyValue: 4997,
                column: "OrganiZaDonaciju",
                value: null);

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
    }
}
