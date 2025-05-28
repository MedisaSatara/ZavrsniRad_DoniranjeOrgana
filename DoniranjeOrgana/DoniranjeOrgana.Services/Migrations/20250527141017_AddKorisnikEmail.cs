using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace DoniranjeOrgana.Services.Migrations
{
    public partial class AddKorisnikEmail : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.UpdateData(
                table: "Korisnik",
                keyColumn: "KorisnikId",
                keyValue: 1001,
                columns: new[] { "LozinkaHash", "LozinkaSalt" },
                values: new object[] { "An7R3xOoPmKYs736bYgQN/g+3D4=", "+ssBQ/rp9FQcSPLEDPfozQ==" });

            migrationBuilder.UpdateData(
                table: "Korisnik",
                keyColumn: "KorisnikId",
                keyValue: 1002,
                columns: new[] { "LozinkaHash", "LozinkaSalt" },
                values: new object[] { "tUG+6z7Xeh3fKWdR/tXGkMJpTk0=", "oHwVTcHhSMyI6jw1GP/RPg==" });

            migrationBuilder.UpdateData(
                table: "Korisnik",
                keyColumn: "KorisnikId",
                keyValue: 1170,
                columns: new[] { "LozinkaHash", "LozinkaSalt" },
                values: new object[] { "/W/Q7E2U60wnsgwMhM6BXjpZ3T4=", "cuTh2iX86sMckXXswv1OIg==" });

            migrationBuilder.UpdateData(
                table: "Korisnik",
                keyColumn: "KorisnikId",
                keyValue: 1178,
                columns: new[] { "LozinkaHash", "LozinkaSalt" },
                values: new object[] { "zPE8Grgsels/VHtZqW1l7dB+rFE=", "HTQrCruieB7xtStjG5ruyQ==" });

            migrationBuilder.UpdateData(
                table: "Korisnik",
                keyColumn: "KorisnikId",
                keyValue: 1179,
                columns: new[] { "Email", "LozinkaHash", "LozinkaSalt" },
                values: new object[] { "ajlarahic98@gmail.com", "JgAjmqy9QL+qvVhgMziwcWHILk8=", "H9KZi4bA9tMKoZohzweVwA==" });

            migrationBuilder.UpdateData(
                table: "KorisnikUloga",
                keyColumn: "KorisnikUlogaId",
                keyValue: 1,
                column: "DatumIzmjene",
                value: new DateTime(2025, 5, 27, 16, 10, 16, 118, DateTimeKind.Local).AddTicks(2564));

            migrationBuilder.UpdateData(
                table: "KorisnikUloga",
                keyColumn: "KorisnikUlogaId",
                keyValue: 2,
                column: "DatumIzmjene",
                value: new DateTime(2025, 5, 27, 16, 10, 16, 118, DateTimeKind.Local).AddTicks(2620));

            migrationBuilder.UpdateData(
                table: "KorisnikUloga",
                keyColumn: "KorisnikUlogaId",
                keyValue: 19,
                column: "DatumIzmjene",
                value: new DateTime(2025, 5, 27, 16, 10, 16, 118, DateTimeKind.Local).AddTicks(2633));

            migrationBuilder.UpdateData(
                table: "KorisnikUloga",
                keyColumn: "KorisnikUlogaId",
                keyValue: 20,
                column: "DatumIzmjene",
                value: new DateTime(2025, 5, 27, 16, 10, 16, 118, DateTimeKind.Local).AddTicks(2629));

            migrationBuilder.UpdateData(
                table: "KorisnikUloga",
                keyColumn: "KorisnikUlogaId",
                keyValue: 21,
                column: "DatumIzmjene",
                value: new DateTime(2025, 5, 27, 16, 10, 16, 118, DateTimeKind.Local).AddTicks(2625));
        }

        protected override void Down(MigrationBuilder migrationBuilder)
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
                columns: new[] { "Email", "LozinkaHash", "LozinkaSalt" },
                values: new object[] { "selma@gmail.com", "FGCFV9La7H4obwXil6A+DzYEKUI=", "GNi1aToHA74WUVg94W6yvw==" });

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
    }
}
