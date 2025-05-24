using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace DoniranjeOrgana.Services.Migrations
{
    public partial class AddedTableDonoriData : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.InsertData(
                table: "Donori",
                columns: new[] { "DonorId", "Alergija", "DatumRodjenja", "HronicneBolesti", "Ime", "JMBG", "KorisnickoIme", "KorisnikId", "KrvnaGrupa", "LozinkaHash", "LozinkaSalt", "MjestoRodjenja", "Prebivaliste", "Prezime", "RhFaktor", "Spol", "Telefon" },
                values: new object[] { 5501, "Voltaren", new DateTime(1998, 5, 7, 0, 0, 0, 0, DateTimeKind.Unspecified), "Nema", "Medisa", "1211998796541", "donor1", 1002, "AB", null, null, "Mostar", "Stolac", "Satara", "+", "Z", "061 201 022" });

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

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DeleteData(
                table: "Donori",
                keyColumn: "DonorId",
                keyValue: 5501);

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
        }
    }
}
