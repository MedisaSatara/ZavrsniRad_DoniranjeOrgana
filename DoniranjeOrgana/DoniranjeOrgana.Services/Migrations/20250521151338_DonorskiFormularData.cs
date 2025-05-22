using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace DoniranjeOrgana.Services.Migrations
{
    public partial class DonorskiFormularData : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "NacinSaglasnosti",
                table: "DonorskiFormula");

            migrationBuilder.DropColumn(
                name: "StatusPrijave",
                table: "DonorskiFormula");

            migrationBuilder.AddColumn<byte[]>(
                name: "Potpis",
                table: "DonorskiFormula",
                type: "varbinary(max)",
                nullable: true);

            migrationBuilder.UpdateData(
                table: "Korisnik",
                keyColumn: "KorisnikId",
                keyValue: 1001,
                columns: new[] { "LozinkaHash", "LozinkaSalt" },
                values: new object[] { "kt1vK09oIgMKH6dgN0aY1bdB3v0=", "n8m9rW5Qn0ptMv/tHIFZHg==" });

            migrationBuilder.UpdateData(
                table: "Korisnik",
                keyColumn: "KorisnikId",
                keyValue: 1002,
                columns: new[] { "LozinkaHash", "LozinkaSalt" },
                values: new object[] { "Q2odxdprt+YbpBUXZ6Zq2IxiClY=", "LQRfANd9yYE1rLzpudQOBg==" });

            migrationBuilder.UpdateData(
                table: "KorisnikUloga",
                keyColumn: "KorisnikUlogaId",
                keyValue: 1,
                column: "DatumIzmjene",
                value: new DateTime(2025, 5, 21, 17, 13, 37, 530, DateTimeKind.Local).AddTicks(2539));

            migrationBuilder.UpdateData(
                table: "KorisnikUloga",
                keyColumn: "KorisnikUlogaId",
                keyValue: 2,
                column: "DatumIzmjene",
                value: new DateTime(2025, 5, 21, 17, 13, 37, 530, DateTimeKind.Local).AddTicks(2597));
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Potpis",
                table: "DonorskiFormula");

            migrationBuilder.AddColumn<string>(
                name: "NacinSaglasnosti",
                table: "DonorskiFormula",
                type: "nvarchar(100)",
                maxLength: 100,
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "StatusPrijave",
                table: "DonorskiFormula",
                type: "nvarchar(150)",
                maxLength: 150,
                nullable: true);

            migrationBuilder.UpdateData(
                table: "Korisnik",
                keyColumn: "KorisnikId",
                keyValue: 1001,
                columns: new[] { "LozinkaHash", "LozinkaSalt" },
                values: new object[] { "X2XHGNHH9Vg6RYSXZOam8kkA54Y=", "H393/PcFlHY0bhVdS3FUyw==" });

            migrationBuilder.UpdateData(
                table: "Korisnik",
                keyColumn: "KorisnikId",
                keyValue: 1002,
                columns: new[] { "LozinkaHash", "LozinkaSalt" },
                values: new object[] { "68s72yvClbNc5igdjsJ4UIMyW54=", "VqkINUFnD9xfFFsLZQjArg==" });

            migrationBuilder.UpdateData(
                table: "KorisnikUloga",
                keyColumn: "KorisnikUlogaId",
                keyValue: 1,
                column: "DatumIzmjene",
                value: new DateTime(2025, 5, 19, 20, 58, 55, 343, DateTimeKind.Local).AddTicks(6556));

            migrationBuilder.UpdateData(
                table: "KorisnikUloga",
                keyColumn: "KorisnikUlogaId",
                keyValue: 2,
                column: "DatumIzmjene",
                value: new DateTime(2025, 5, 19, 20, 58, 55, 343, DateTimeKind.Local).AddTicks(6607));
        }
    }
}
