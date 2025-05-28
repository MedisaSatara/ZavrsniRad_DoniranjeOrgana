using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace DoniranjeOrgana.Services.Migrations
{
    public partial class UpdateData : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.UpdateData(
                table: "Korisnik",
                keyColumn: "KorisnikId",
                keyValue: 1001,
                columns: new[] { "LozinkaHash", "LozinkaSalt" },
                values: new object[] { "nrI9Simx3mxNbp/Eh/phq/waU+Y=", "Xfbl8H5TMctaqniyIZvt0A==" });

            migrationBuilder.UpdateData(
                table: "Korisnik",
                keyColumn: "KorisnikId",
                keyValue: 1002,
                columns: new[] { "LozinkaHash", "LozinkaSalt" },
                values: new object[] { "oLJiAzV2Gmr8Yhe8xha/RrwFUcA=", "W6JMh2A2XHBcokl2zkEplg==" });

            migrationBuilder.UpdateData(
                table: "Korisnik",
                keyColumn: "KorisnikId",
                keyValue: 1170,
                columns: new[] { "LozinkaHash", "LozinkaSalt" },
                values: new object[] { "rcK3lXxmoKFD3kCQvB0G/dpHP00=", "nbarI26uiEsh6mfuprUOHQ==" });

            migrationBuilder.UpdateData(
                table: "Korisnik",
                keyColumn: "KorisnikId",
                keyValue: 1178,
                columns: new[] { "LozinkaHash", "LozinkaSalt" },
                values: new object[] { "gwsUEDPdC2YvLzFXs3YIJGajEe8=", "oRQxNuDKSRX/FY25a5OfIg==" });

            migrationBuilder.UpdateData(
                table: "Korisnik",
                keyColumn: "KorisnikId",
                keyValue: 1179,
                columns: new[] { "LozinkaHash", "LozinkaSalt" },
                values: new object[] { "FGCFV9La7H4obwXil6A+DzYEKUI=", "GNi1aToHA74WUVg94W6yvw==" });

            migrationBuilder.UpdateData(
                table: "KorisnikUloga",
                keyColumn: "KorisnikUlogaId",
                keyValue: 1,
                column: "DatumIzmjene",
                value: new DateTime(2025, 5, 27, 2, 47, 51, 37, DateTimeKind.Local).AddTicks(5418));

            migrationBuilder.UpdateData(
                table: "KorisnikUloga",
                keyColumn: "KorisnikUlogaId",
                keyValue: 2,
                column: "DatumIzmjene",
                value: new DateTime(2025, 5, 27, 2, 47, 51, 37, DateTimeKind.Local).AddTicks(5496));

            migrationBuilder.UpdateData(
                table: "KorisnikUloga",
                keyColumn: "KorisnikUlogaId",
                keyValue: 19,
                column: "DatumIzmjene",
                value: new DateTime(2025, 5, 27, 2, 47, 51, 37, DateTimeKind.Local).AddTicks(5508));

            migrationBuilder.UpdateData(
                table: "KorisnikUloga",
                keyColumn: "KorisnikUlogaId",
                keyValue: 20,
                column: "DatumIzmjene",
                value: new DateTime(2025, 5, 27, 2, 47, 51, 37, DateTimeKind.Local).AddTicks(5504));

            migrationBuilder.UpdateData(
                table: "KorisnikUloga",
                keyColumn: "KorisnikUlogaId",
                keyValue: 21,
                column: "DatumIzmjene",
                value: new DateTime(2025, 5, 27, 2, 47, 51, 37, DateTimeKind.Local).AddTicks(5501));
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.UpdateData(
                table: "Korisnik",
                keyColumn: "KorisnikId",
                keyValue: 1001,
                columns: new[] { "LozinkaHash", "LozinkaSalt" },
                values: new object[] { "TXHpCtx7ZbyB4cM1nelMQE7yNBY=", "jLAoO8frO052M76nIEpnIg==" });

            migrationBuilder.UpdateData(
                table: "Korisnik",
                keyColumn: "KorisnikId",
                keyValue: 1002,
                columns: new[] { "LozinkaHash", "LozinkaSalt" },
                values: new object[] { "n3uO6ZnrbldVHm3n5XkIBp98hPc=", "hN9cFyyK5i6AFD8HFYLz/g==" });

            migrationBuilder.UpdateData(
                table: "Korisnik",
                keyColumn: "KorisnikId",
                keyValue: 1170,
                columns: new[] { "LozinkaHash", "LozinkaSalt" },
                values: new object[] { "oHBdMcF0freXMfOpIxuCRssAgmw=", "iMjeuU1hZ0/7AsDqx1zRyw==" });

            migrationBuilder.UpdateData(
                table: "Korisnik",
                keyColumn: "KorisnikId",
                keyValue: 1178,
                columns: new[] { "LozinkaHash", "LozinkaSalt" },
                values: new object[] { "PTJhWYxWW+bV1Av0UCQi7H2tG8c=", "HnoZbAbUFStCFZenZNonmg==" });

            migrationBuilder.UpdateData(
                table: "Korisnik",
                keyColumn: "KorisnikId",
                keyValue: 1179,
                columns: new[] { "LozinkaHash", "LozinkaSalt" },
                values: new object[] { "ro5eIDPL4cTHlmfEsfyuDe8zWvs=", "g6QuR0TcADxa/rohTJNzXQ==" });

            migrationBuilder.UpdateData(
                table: "KorisnikUloga",
                keyColumn: "KorisnikUlogaId",
                keyValue: 1,
                column: "DatumIzmjene",
                value: new DateTime(2025, 5, 27, 2, 41, 12, 440, DateTimeKind.Local).AddTicks(4962));

            migrationBuilder.UpdateData(
                table: "KorisnikUloga",
                keyColumn: "KorisnikUlogaId",
                keyValue: 2,
                column: "DatumIzmjene",
                value: new DateTime(2025, 5, 27, 2, 41, 12, 440, DateTimeKind.Local).AddTicks(5022));

            migrationBuilder.UpdateData(
                table: "KorisnikUloga",
                keyColumn: "KorisnikUlogaId",
                keyValue: 19,
                column: "DatumIzmjene",
                value: new DateTime(2025, 5, 27, 2, 41, 12, 440, DateTimeKind.Local).AddTicks(5035));

            migrationBuilder.UpdateData(
                table: "KorisnikUloga",
                keyColumn: "KorisnikUlogaId",
                keyValue: 20,
                column: "DatumIzmjene",
                value: new DateTime(2025, 5, 27, 2, 41, 12, 440, DateTimeKind.Local).AddTicks(5031));

            migrationBuilder.UpdateData(
                table: "KorisnikUloga",
                keyColumn: "KorisnikUlogaId",
                keyValue: 21,
                column: "DatumIzmjene",
                value: new DateTime(2025, 5, 27, 2, 41, 12, 440, DateTimeKind.Local).AddTicks(5027));
        }
    }
}
