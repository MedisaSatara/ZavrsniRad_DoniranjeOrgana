using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace DoniranjeOrgana.Services.Migrations
{
    public partial class RemoveData : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
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

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.UpdateData(
                table: "Korisnik",
                keyColumn: "KorisnikId",
                keyValue: 1001,
                columns: new[] { "LozinkaHash", "LozinkaSalt" },
                values: new object[] { "lvgB5xGWea79Yq1hXNNdjirbWAE=", "s28EiPz3GOl31fsaDIUFhA==" });

            migrationBuilder.UpdateData(
                table: "Korisnik",
                keyColumn: "KorisnikId",
                keyValue: 1002,
                columns: new[] { "LozinkaHash", "LozinkaSalt" },
                values: new object[] { "vnQyeTf2HvmIxFaRSjei7TcIN9k=", "kqbqn+iNI5rpTCP/ZccRDA==" });

            migrationBuilder.UpdateData(
                table: "Korisnik",
                keyColumn: "KorisnikId",
                keyValue: 1170,
                columns: new[] { "LozinkaHash", "LozinkaSalt" },
                values: new object[] { "f0WCZ32cxHXCbG5lhYlOUdilv7o=", "6dFQZJbv6IgAd/jRBuzyAg==" });

            migrationBuilder.UpdateData(
                table: "Korisnik",
                keyColumn: "KorisnikId",
                keyValue: 1178,
                columns: new[] { "LozinkaHash", "LozinkaSalt" },
                values: new object[] { "4kYZT13XHXPeOzRLR3SES+zG0XY=", "zDwFagKGTD9KRFAxQis55Q==" });

            migrationBuilder.UpdateData(
                table: "Korisnik",
                keyColumn: "KorisnikId",
                keyValue: 1179,
                columns: new[] { "LozinkaHash", "LozinkaSalt" },
                values: new object[] { "8zxQgK0bjJq7utWBSSkTtfS69nc=", "LpVF+C13tInmfm9DX4xxSw==" });

            migrationBuilder.UpdateData(
                table: "KorisnikUloga",
                keyColumn: "KorisnikUlogaId",
                keyValue: 1,
                column: "DatumIzmjene",
                value: new DateTime(2025, 5, 27, 2, 33, 4, 588, DateTimeKind.Local).AddTicks(6848));

            migrationBuilder.UpdateData(
                table: "KorisnikUloga",
                keyColumn: "KorisnikUlogaId",
                keyValue: 2,
                column: "DatumIzmjene",
                value: new DateTime(2025, 5, 27, 2, 33, 4, 588, DateTimeKind.Local).AddTicks(6905));

            migrationBuilder.UpdateData(
                table: "KorisnikUloga",
                keyColumn: "KorisnikUlogaId",
                keyValue: 19,
                column: "DatumIzmjene",
                value: new DateTime(2025, 5, 27, 2, 33, 4, 588, DateTimeKind.Local).AddTicks(6917));

            migrationBuilder.UpdateData(
                table: "KorisnikUloga",
                keyColumn: "KorisnikUlogaId",
                keyValue: 20,
                column: "DatumIzmjene",
                value: new DateTime(2025, 5, 27, 2, 33, 4, 588, DateTimeKind.Local).AddTicks(6913));

            migrationBuilder.UpdateData(
                table: "KorisnikUloga",
                keyColumn: "KorisnikUlogaId",
                keyValue: 21,
                column: "DatumIzmjene",
                value: new DateTime(2025, 5, 27, 2, 33, 4, 588, DateTimeKind.Local).AddTicks(6910));
        }
    }
}
