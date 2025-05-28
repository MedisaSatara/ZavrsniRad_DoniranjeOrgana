using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace DoniranjeOrgana.Services.Migrations
{
    public partial class KorisnikEmail : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.UpdateData(
                table: "Korisnik",
                keyColumn: "KorisnikId",
                keyValue: 1001,
                columns: new[] { "LozinkaHash", "LozinkaSalt" },
                values: new object[] { "Z5T+eHa5RZw2DdyRWcmL4nHlc4U=", "nLqbr9CB7L3lbgSvreFbWw==" });

            migrationBuilder.UpdateData(
                table: "Korisnik",
                keyColumn: "KorisnikId",
                keyValue: 1002,
                columns: new[] { "Email", "LozinkaHash", "LozinkaSalt" },
                values: new object[] { "sataramedisa@gmail.com", "+8cLcA+dTAal1lp2DEMuu7iZDRo=", "qSHpBoIiK0eaO9wlY5/Rgg==" });

            migrationBuilder.UpdateData(
                table: "KorisnikUloga",
                keyColumn: "KorisnikUlogaId",
                keyValue: 1,
                column: "DatumIzmjene",
                value: new DateTime(2025, 5, 25, 16, 33, 2, 3, DateTimeKind.Local).AddTicks(4173));

            migrationBuilder.UpdateData(
                table: "KorisnikUloga",
                keyColumn: "KorisnikUlogaId",
                keyValue: 2,
                column: "DatumIzmjene",
                value: new DateTime(2025, 5, 25, 16, 33, 2, 3, DateTimeKind.Local).AddTicks(4234));
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.UpdateData(
                table: "Korisnik",
                keyColumn: "KorisnikId",
                keyValue: 1001,
                columns: new[] { "LozinkaHash", "LozinkaSalt" },
                values: new object[] { "Y7qX1MCPPZvvyVx/5EY1lliTiiM=", "LyVXWi96QgZBtTy5IbZANQ==" });

            migrationBuilder.UpdateData(
                table: "Korisnik",
                keyColumn: "KorisnikId",
                keyValue: 1002,
                columns: new[] { "Email", "LozinkaHash", "LozinkaSalt" },
                values: new object[] { "medisa@gmail.com", "u8B3lHMwk32pfUB5qDHnXLsyIXo=", "K/JmEiCyDFOQWTn3J/JSTA==" });

            migrationBuilder.UpdateData(
                table: "KorisnikUloga",
                keyColumn: "KorisnikUlogaId",
                keyValue: 1,
                column: "DatumIzmjene",
                value: new DateTime(2025, 5, 25, 11, 14, 8, 276, DateTimeKind.Local).AddTicks(8410));

            migrationBuilder.UpdateData(
                table: "KorisnikUloga",
                keyColumn: "KorisnikUlogaId",
                keyValue: 2,
                column: "DatumIzmjene",
                value: new DateTime(2025, 5, 25, 11, 14, 8, 276, DateTimeKind.Local).AddTicks(8469));
        }
    }
}
