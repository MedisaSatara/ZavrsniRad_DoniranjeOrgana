using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace DoniranjeOrgana.Services.Migrations
{
    public partial class updatedSeed : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
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

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.UpdateData(
                table: "Korisnik",
                keyColumn: "KorisnikId",
                keyValue: 1001,
                columns: new[] { "LozinkaHash", "LozinkaSalt" },
                values: new object[] { "AEIMsOdD08RmKHbXtTi6sSSQZ7E=", "eqRDDlz5UaekUxnuWZ+WYg==" });

            migrationBuilder.UpdateData(
                table: "Korisnik",
                keyColumn: "KorisnikId",
                keyValue: 1002,
                columns: new[] { "LozinkaHash", "LozinkaSalt" },
                values: new object[] { "kC9nZ/h7s7Jp261OOJZufuxuKxE=", "Bu7ca5GTk8tM2VIJ+wJJxA==" });

            migrationBuilder.UpdateData(
                table: "Korisnik",
                keyColumn: "KorisnikId",
                keyValue: 1007,
                columns: new[] { "LozinkaHash", "LozinkaSalt" },
                values: new object[] { "PCFME+pgYICiTzgC+zKok6/bIVM=", "QeNMaMi0v+h6ohFJSQnPmA==" });

            migrationBuilder.UpdateData(
                table: "Korisnik",
                keyColumn: "KorisnikId",
                keyValue: 1008,
                columns: new[] { "LozinkaHash", "LozinkaSalt" },
                values: new object[] { "bc7wcMx9HxMjc5yh0LT0OQ5g+i0=", "EVwwR4Sc0qgcMu/9gYW80Q==" });

            migrationBuilder.UpdateData(
                table: "KorisnikUloga",
                keyColumn: "KorisnikUlogaId",
                keyValue: 1,
                column: "DatumIzmjene",
                value: new DateTime(2025, 5, 26, 3, 7, 47, 469, DateTimeKind.Local).AddTicks(5899));

            migrationBuilder.UpdateData(
                table: "KorisnikUloga",
                keyColumn: "KorisnikUlogaId",
                keyValue: 2,
                column: "DatumIzmjene",
                value: new DateTime(2025, 5, 26, 3, 7, 47, 469, DateTimeKind.Local).AddTicks(5954));

            migrationBuilder.UpdateData(
                table: "KorisnikUloga",
                keyColumn: "KorisnikUlogaId",
                keyValue: 4,
                column: "DatumIzmjene",
                value: new DateTime(2025, 5, 26, 3, 7, 47, 469, DateTimeKind.Local).AddTicks(5963));

            migrationBuilder.UpdateData(
                table: "KorisnikUloga",
                keyColumn: "KorisnikUlogaId",
                keyValue: 5,
                column: "DatumIzmjene",
                value: new DateTime(2025, 5, 26, 3, 7, 47, 469, DateTimeKind.Local).AddTicks(5960));
        }
    }
}
