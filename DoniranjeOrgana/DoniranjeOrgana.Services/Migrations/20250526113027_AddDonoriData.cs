using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace DoniranjeOrgana.Services.Migrations
{
    public partial class AddDonoriData : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DeleteData(
                table: "Donori",
                keyColumn: "DonorId",
                keyValue: 5503);

            migrationBuilder.DeleteData(
                table: "Donori",
                keyColumn: "DonorId",
                keyValue: 5504);

            migrationBuilder.InsertData(
                table: "Donori",
                columns: new[] { "DonorId", "Alergija", "HronicneBolesti", "JMBG", "KorisnikId", "KrvnaGrupa", "LozinkaHash", "LozinkaSalt", "MjestoRodjenja", "Prebivaliste", "RhFaktor", "Telefon" },
                values: new object[,]
                {
                    { 5513, "Nema", "Nema", "1211998796541", 1170, "A", null, null, "Mostar", "Mostar", "+", "064 201 022" },
                    { 5514, "Nema", "Nema", "1211998796541", 1178, "AB", null, null, "Mostar", "Stolac", "+", "061 231 022" },
                    { 5515, "Nema", "Nema", "1211998796541", 1179, "0", null, null, "Mostar", "Stolac", "+", "061 231 022" }
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

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DeleteData(
                table: "Donori",
                keyColumn: "DonorId",
                keyValue: 5513);

            migrationBuilder.DeleteData(
                table: "Donori",
                keyColumn: "DonorId",
                keyValue: 5514);

            migrationBuilder.DeleteData(
                table: "Donori",
                keyColumn: "DonorId",
                keyValue: 5515);

            migrationBuilder.InsertData(
                table: "Donori",
                columns: new[] { "DonorId", "Alergija", "HronicneBolesti", "JMBG", "KorisnikId", "KrvnaGrupa", "LozinkaHash", "LozinkaSalt", "MjestoRodjenja", "Prebivaliste", "RhFaktor", "Telefon" },
                values: new object[,]
                {
                    { 5503, "Voltaren", "Nema", "1211998796541", 1007, "A", null, null, "Mostar", "Stolac", "+", "061 201 022" },
                    { 5504, "Voltaren", "Nema", "1211998796541", 1008, "AB", null, null, "Mostar", "Stolac", "+", "061 201 022" }
                });

            migrationBuilder.UpdateData(
                table: "Korisnik",
                keyColumn: "KorisnikId",
                keyValue: 1001,
                columns: new[] { "LozinkaHash", "LozinkaSalt" },
                values: new object[] { "ymjb8snsg5lVHrreGse0pfh8VZE=", "/Haz0aE56oJRqWYMuZ8w2g==" });

            migrationBuilder.UpdateData(
                table: "Korisnik",
                keyColumn: "KorisnikId",
                keyValue: 1002,
                columns: new[] { "LozinkaHash", "LozinkaSalt" },
                values: new object[] { "TkSYaZwgPg0wsTy1en52oLYPChw=", "KXKbVoZicGFxdIbUCsdb9Q==" });

            migrationBuilder.UpdateData(
                table: "Korisnik",
                keyColumn: "KorisnikId",
                keyValue: 1170,
                columns: new[] { "LozinkaHash", "LozinkaSalt" },
                values: new object[] { "m5yJHjASm10Eth1973k5z5fF7/M=", "1lNkqMZKL99a45kBG+yxpQ==" });

            migrationBuilder.UpdateData(
                table: "Korisnik",
                keyColumn: "KorisnikId",
                keyValue: 1178,
                columns: new[] { "LozinkaHash", "LozinkaSalt" },
                values: new object[] { "gk3RKXhTQ5xx3tf2w0KVt1wOCPQ=", "iG8Y3/U3WkDbTEfOLqnclQ==" });

            migrationBuilder.UpdateData(
                table: "Korisnik",
                keyColumn: "KorisnikId",
                keyValue: 1179,
                columns: new[] { "LozinkaHash", "LozinkaSalt" },
                values: new object[] { "TdOmim6bg0sYGyvXLc2uMjicmyM=", "czFu5Z6295or8A6aQJxuqg==" });

            migrationBuilder.UpdateData(
                table: "KorisnikUloga",
                keyColumn: "KorisnikUlogaId",
                keyValue: 1,
                column: "DatumIzmjene",
                value: new DateTime(2025, 5, 26, 13, 23, 23, 557, DateTimeKind.Local).AddTicks(8475));

            migrationBuilder.UpdateData(
                table: "KorisnikUloga",
                keyColumn: "KorisnikUlogaId",
                keyValue: 2,
                column: "DatumIzmjene",
                value: new DateTime(2025, 5, 26, 13, 23, 23, 557, DateTimeKind.Local).AddTicks(8535));

            migrationBuilder.UpdateData(
                table: "KorisnikUloga",
                keyColumn: "KorisnikUlogaId",
                keyValue: 19,
                column: "DatumIzmjene",
                value: new DateTime(2025, 5, 26, 13, 23, 23, 557, DateTimeKind.Local).AddTicks(8548));

            migrationBuilder.UpdateData(
                table: "KorisnikUloga",
                keyColumn: "KorisnikUlogaId",
                keyValue: 20,
                column: "DatumIzmjene",
                value: new DateTime(2025, 5, 26, 13, 23, 23, 557, DateTimeKind.Local).AddTicks(8544));

            migrationBuilder.UpdateData(
                table: "KorisnikUloga",
                keyColumn: "KorisnikUlogaId",
                keyValue: 21,
                column: "DatumIzmjene",
                value: new DateTime(2025, 5, 26, 13, 23, 23, 557, DateTimeKind.Local).AddTicks(8540));
        }
    }
}
