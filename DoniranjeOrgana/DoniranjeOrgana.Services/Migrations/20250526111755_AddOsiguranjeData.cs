using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace DoniranjeOrgana.Services.Migrations
{
    public partial class AddOsiguranjeData : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.UpdateData(
                table: "Korisnik",
                keyColumn: "KorisnikId",
                keyValue: 1001,
                columns: new[] { "LozinkaHash", "LozinkaSalt" },
                values: new object[] { "zzyvDeJ35jfo2Ir64r+uVVzIdkE=", "Qww0RQpbpx3+I9OHaBZXQQ==" });

            migrationBuilder.UpdateData(
                table: "Korisnik",
                keyColumn: "KorisnikId",
                keyValue: 1002,
                columns: new[] { "LozinkaHash", "LozinkaSalt" },
                values: new object[] { "hxaGRhUtudTLezMNcGOXKZK05/0=", "E7s/erSvHAMs+dvqEavGJQ==" });

            migrationBuilder.UpdateData(
                table: "Korisnik",
                keyColumn: "KorisnikId",
                keyValue: 1007,
                columns: new[] { "LozinkaHash", "LozinkaSalt" },
                values: new object[] { "yD9OEGHstMj/wyVjiNvBX5p0Q58=", "FswcUrdNaJ8st93hM4lVbA==" });

            migrationBuilder.UpdateData(
                table: "Korisnik",
                keyColumn: "KorisnikId",
                keyValue: 1008,
                columns: new[] { "LozinkaHash", "LozinkaSalt" },
                values: new object[] { "HexnsWdJwV7njrTrvVleHVcbVKU=", "STkFahtdcL7sfVBtciUxjA==" });

            migrationBuilder.UpdateData(
                table: "KorisnikUloga",
                keyColumn: "KorisnikUlogaId",
                keyValue: 1,
                column: "DatumIzmjene",
                value: new DateTime(2025, 5, 26, 13, 17, 54, 365, DateTimeKind.Local).AddTicks(8428));

            migrationBuilder.UpdateData(
                table: "KorisnikUloga",
                keyColumn: "KorisnikUlogaId",
                keyValue: 2,
                column: "DatumIzmjene",
                value: new DateTime(2025, 5, 26, 13, 17, 54, 365, DateTimeKind.Local).AddTicks(8484));

            migrationBuilder.UpdateData(
                table: "KorisnikUloga",
                keyColumn: "KorisnikUlogaId",
                keyValue: 4,
                column: "DatumIzmjene",
                value: new DateTime(2025, 5, 26, 13, 17, 54, 365, DateTimeKind.Local).AddTicks(8493));

            migrationBuilder.UpdateData(
                table: "KorisnikUloga",
                keyColumn: "KorisnikUlogaId",
                keyValue: 5,
                column: "DatumIzmjene",
                value: new DateTime(2025, 5, 26, 13, 17, 54, 365, DateTimeKind.Local).AddTicks(8489));

            migrationBuilder.InsertData(
                table: "Osiguranje",
                columns: new[] { "OsiguranjeId", "Osiguranik", "TipOsiguranja" },
                values: new object[] { 4004, "test", null });
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DeleteData(
                table: "Osiguranje",
                keyColumn: "OsiguranjeId",
                keyValue: 4004);

            migrationBuilder.UpdateData(
                table: "Korisnik",
                keyColumn: "KorisnikId",
                keyValue: 1001,
                columns: new[] { "LozinkaHash", "LozinkaSalt" },
                values: new object[] { "8UNrd7hQNyVgxg+fP4CJ9VPvGwk=", "ukWF/xjCoy0Sgn70PhHG1w==" });

            migrationBuilder.UpdateData(
                table: "Korisnik",
                keyColumn: "KorisnikId",
                keyValue: 1002,
                columns: new[] { "LozinkaHash", "LozinkaSalt" },
                values: new object[] { "ezts1cLRgN8mza0USCDsw2YJYRk=", "fxhNYC7dG/Lh5ZH3B8qTTQ==" });

            migrationBuilder.UpdateData(
                table: "Korisnik",
                keyColumn: "KorisnikId",
                keyValue: 1007,
                columns: new[] { "LozinkaHash", "LozinkaSalt" },
                values: new object[] { "tu+N2SNnciX8ljrrnVzwrux2Q+M=", "7nPGcYX/8mi0DFja6ET1Gw==" });

            migrationBuilder.UpdateData(
                table: "Korisnik",
                keyColumn: "KorisnikId",
                keyValue: 1008,
                columns: new[] { "LozinkaHash", "LozinkaSalt" },
                values: new object[] { "dxog4gao7cDCNnkgCIy6fS5uMDU=", "CCJBxVJBwtQMz2SzRAAufg==" });

            migrationBuilder.UpdateData(
                table: "KorisnikUloga",
                keyColumn: "KorisnikUlogaId",
                keyValue: 1,
                column: "DatumIzmjene",
                value: new DateTime(2025, 5, 26, 3, 18, 16, 845, DateTimeKind.Local).AddTicks(4551));

            migrationBuilder.UpdateData(
                table: "KorisnikUloga",
                keyColumn: "KorisnikUlogaId",
                keyValue: 2,
                column: "DatumIzmjene",
                value: new DateTime(2025, 5, 26, 3, 18, 16, 845, DateTimeKind.Local).AddTicks(4602));

            migrationBuilder.UpdateData(
                table: "KorisnikUloga",
                keyColumn: "KorisnikUlogaId",
                keyValue: 4,
                column: "DatumIzmjene",
                value: new DateTime(2025, 5, 26, 3, 18, 16, 845, DateTimeKind.Local).AddTicks(4611));

            migrationBuilder.UpdateData(
                table: "KorisnikUloga",
                keyColumn: "KorisnikUlogaId",
                keyValue: 5,
                column: "DatumIzmjene",
                value: new DateTime(2025, 5, 26, 3, 18, 16, 845, DateTimeKind.Local).AddTicks(4607));
        }
    }
}
