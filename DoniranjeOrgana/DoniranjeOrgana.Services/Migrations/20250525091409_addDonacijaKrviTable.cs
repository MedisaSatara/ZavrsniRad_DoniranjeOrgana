using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace DoniranjeOrgana.Services.Migrations
{
    public partial class addDonacijaKrviTable : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "DatumRodjenja",
                table: "Donori");

            migrationBuilder.DropColumn(
                name: "Ime",
                table: "Donori");

            migrationBuilder.DropColumn(
                name: "KorisnickoIme",
                table: "Donori");

            migrationBuilder.DropColumn(
                name: "Prezime",
                table: "Donori");

            migrationBuilder.DropColumn(
                name: "Spol",
                table: "Donori");

            migrationBuilder.AlterColumn<string>(
                name: "KorisnickoIme",
                table: "Korisnik",
                type: "nvarchar(20)",
                maxLength: 20,
                nullable: true,
                oldClrType: typeof(string),
                oldType: "nvarchar(20)",
                oldMaxLength: 20);

            migrationBuilder.CreateTable(
                name: "DonacijaKrvi",
                columns: table => new
                {
                    DonacijiKrviId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    DonorId = table.Column<int>(type: "int", nullable: true),
                    DatumDonacije = table.Column<DateTime>(type: "datetime2", maxLength: 20, nullable: true),
                    Kolicina = table.Column<decimal>(type: "decimal(18,2)", maxLength: 50, nullable: true),
                    Lokacija = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: true),
                    Napomena = table.Column<string>(type: "nvarchar(250)", maxLength: 250, nullable: true),
                    Status = table.Column<string>(type: "nvarchar(250)", maxLength: 250, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_DonacijaKrvi", x => x.DonacijiKrviId);
                    table.ForeignKey(
                        name: "FK_DonacijaKrvi_Donori",
                        column: x => x.DonorId,
                        principalTable: "Donori",
                        principalColumn: "DonorId");
                });

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
                columns: new[] { "LozinkaHash", "LozinkaSalt" },
                values: new object[] { "u8B3lHMwk32pfUB5qDHnXLsyIXo=", "K/JmEiCyDFOQWTn3J/JSTA==" });

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

            migrationBuilder.CreateIndex(
                name: "IX_DonacijaKrvi_DonorId",
                table: "DonacijaKrvi",
                column: "DonorId");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "DonacijaKrvi");

            migrationBuilder.AlterColumn<string>(
                name: "KorisnickoIme",
                table: "Korisnik",
                type: "nvarchar(20)",
                maxLength: 20,
                nullable: false,
                defaultValue: "",
                oldClrType: typeof(string),
                oldType: "nvarchar(20)",
                oldMaxLength: 20,
                oldNullable: true);

            migrationBuilder.AddColumn<DateTime>(
                name: "DatumRodjenja",
                table: "Donori",
                type: "datetime2",
                maxLength: 10,
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "Ime",
                table: "Donori",
                type: "nvarchar(30)",
                maxLength: 30,
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "KorisnickoIme",
                table: "Donori",
                type: "nvarchar(20)",
                maxLength: 20,
                nullable: false,
                defaultValue: "");

            migrationBuilder.AddColumn<string>(
                name: "Prezime",
                table: "Donori",
                type: "nvarchar(30)",
                maxLength: 30,
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "Spol",
                table: "Donori",
                type: "nvarchar(1)",
                maxLength: 1,
                nullable: true);

            migrationBuilder.UpdateData(
                table: "Donori",
                keyColumn: "DonorId",
                keyValue: 5501,
                columns: new[] { "DatumRodjenja", "Ime", "KorisnickoIme", "Prezime", "Spol" },
                values: new object[] { new DateTime(1998, 5, 7, 0, 0, 0, 0, DateTimeKind.Unspecified), "Medisa", "donor1", "Satara", "Z" });

            migrationBuilder.UpdateData(
                table: "Korisnik",
                keyColumn: "KorisnikId",
                keyValue: 1001,
                columns: new[] { "LozinkaHash", "LozinkaSalt" },
                values: new object[] { "CoF+nSjs7NnjlIcMvyj4cZ8hqfs=", "qR8y5ci0MdOpBGqtuq3MBw==" });

            migrationBuilder.UpdateData(
                table: "Korisnik",
                keyColumn: "KorisnikId",
                keyValue: 1002,
                columns: new[] { "LozinkaHash", "LozinkaSalt" },
                values: new object[] { "MdQWPrn1hDW2I8llkmB80Rv1uLE=", "FA3Kf7ocI6JAjMMgnIVqfQ==" });

            migrationBuilder.UpdateData(
                table: "KorisnikUloga",
                keyColumn: "KorisnikUlogaId",
                keyValue: 1,
                column: "DatumIzmjene",
                value: new DateTime(2025, 5, 24, 1, 59, 40, 445, DateTimeKind.Local).AddTicks(298));

            migrationBuilder.UpdateData(
                table: "KorisnikUloga",
                keyColumn: "KorisnikUlogaId",
                keyValue: 2,
                column: "DatumIzmjene",
                value: new DateTime(2025, 5, 24, 1, 59, 40, 445, DateTimeKind.Local).AddTicks(352));
        }
    }
}
