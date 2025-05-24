using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace DoniranjeOrgana.Services.Migrations
{
    public partial class AddedTableDonori : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Pacijent_DonorskiFormular",
                table: "DonorskiFormula");

            migrationBuilder.AddColumn<int>(
                name: "DonorId",
                table: "DonorskiFormula",
                type: "int",
                nullable: true);

            migrationBuilder.CreateTable(
                name: "Donori",
                columns: table => new
                {
                    DonorId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Ime = table.Column<string>(type: "nvarchar(30)", maxLength: 30, nullable: true),
                    Prezime = table.Column<string>(type: "nvarchar(30)", maxLength: 30, nullable: true),
                    Spol = table.Column<string>(type: "nvarchar(1)", maxLength: 1, nullable: true),
                    DatumRodjenja = table.Column<DateTime>(type: "datetime2", maxLength: 10, nullable: true),
                    JMBG = table.Column<string>(type: "nvarchar(13)", maxLength: 13, nullable: false),
                    MjestoRodjenja = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: true),
                    Prebivaliste = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: true),
                    Telefon = table.Column<string>(type: "nvarchar(20)", maxLength: 20, nullable: false),
                    KrvnaGrupa = table.Column<string>(type: "nvarchar(10)", maxLength: 10, nullable: true),
                    RhFaktor = table.Column<string>(type: "nvarchar(20)", maxLength: 20, nullable: true),
                    HronicneBolesti = table.Column<string>(type: "nvarchar(250)", maxLength: 250, nullable: true),
                    Alergija = table.Column<string>(type: "nvarchar(250)", maxLength: 250, nullable: true),
                    KorisnickoIme = table.Column<string>(type: "nvarchar(20)", maxLength: 20, nullable: false),
                    LozinkaSalt = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: true),
                    LozinkaHash = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: true),
                    KorisnikId = table.Column<int>(type: "int", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Donori", x => x.DonorId);
                    table.ForeignKey(
                        name: "FK_Korisnik_Donori",
                        column: x => x.KorisnikId,
                        principalTable: "Korisnik",
                        principalColumn: "KorisnikId");
                });

            migrationBuilder.UpdateData(
                table: "Korisnik",
                keyColumn: "KorisnikId",
                keyValue: 1001,
                columns: new[] { "LozinkaHash", "LozinkaSalt" },
                values: new object[] { "hwnXRlU/WrF3lcfQx9+HYUHd9Pk=", "3JnXtIvZWn2tzQcP43P2Ug==" });

            migrationBuilder.UpdateData(
                table: "Korisnik",
                keyColumn: "KorisnikId",
                keyValue: 1002,
                columns: new[] { "LozinkaHash", "LozinkaSalt" },
                values: new object[] { "FuSPYmzUCmaROsJzCOfu8n8O4EQ=", "DgFCT/UQCb/YMHVzOcyVXw==" });

            migrationBuilder.UpdateData(
                table: "KorisnikUloga",
                keyColumn: "KorisnikUlogaId",
                keyValue: 1,
                column: "DatumIzmjene",
                value: new DateTime(2025, 5, 23, 21, 57, 4, 764, DateTimeKind.Local).AddTicks(3481));

            migrationBuilder.UpdateData(
                table: "KorisnikUloga",
                keyColumn: "KorisnikUlogaId",
                keyValue: 2,
                column: "DatumIzmjene",
                value: new DateTime(2025, 5, 23, 21, 57, 4, 764, DateTimeKind.Local).AddTicks(3533));

            migrationBuilder.CreateIndex(
                name: "IX_DonorskiFormula_DonorId",
                table: "DonorskiFormula",
                column: "DonorId");

            migrationBuilder.CreateIndex(
                name: "IX_Donori_KorisnikId",
                table: "Donori",
                column: "KorisnikId");

            migrationBuilder.AddForeignKey(
                name: "FK_Donori_DonorskiFormular",
                table: "DonorskiFormula",
                column: "DonorId",
                principalTable: "Donori",
                principalColumn: "DonorId");

            migrationBuilder.AddForeignKey(
                name: "FK_DonorskiFormula_Pacijent_PacijentId",
                table: "DonorskiFormula",
                column: "PacijentId",
                principalTable: "Pacijent",
                principalColumn: "PacijentId");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Donori_DonorskiFormular",
                table: "DonorskiFormula");

            migrationBuilder.DropForeignKey(
                name: "FK_DonorskiFormula_Pacijent_PacijentId",
                table: "DonorskiFormula");

            migrationBuilder.DropTable(
                name: "Donori");

            migrationBuilder.DropIndex(
                name: "IX_DonorskiFormula_DonorId",
                table: "DonorskiFormula");

            migrationBuilder.DropColumn(
                name: "DonorId",
                table: "DonorskiFormula");

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

            migrationBuilder.AddForeignKey(
                name: "FK_Pacijent_DonorskiFormular",
                table: "DonorskiFormula",
                column: "PacijentId",
                principalTable: "Pacijent",
                principalColumn: "PacijentId");
        }
    }
}
