using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace DoniranjeOrgana.Services.Migrations
{
    public partial class KorisnikData : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
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
                columns: new[] { "Email", "LozinkaHash", "LozinkaSalt" },
                values: new object[] { "medisa@gmail.com", "68s72yvClbNc5igdjsJ4UIMyW54=", "VqkINUFnD9xfFFsLZQjArg==" });

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

            migrationBuilder.UpdateData(
                table: "Pacijent",
                keyColumn: "PacijentId",
                keyValue: 5001,
                columns: new[] { "Alergija", "DatumRodjenja", "Ime", "Prebivaliste", "Prezime", "Spol" },
                values: new object[] { "Voltaren", new DateTime(1998, 5, 7, 0, 0, 0, 0, DateTimeKind.Unspecified), "Medisa", "Stolac", "Satara", "Z" });
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.UpdateData(
                table: "Korisnik",
                keyColumn: "KorisnikId",
                keyValue: 1001,
                columns: new[] { "LozinkaHash", "LozinkaSalt" },
                values: new object[] { "0qN4eqQHFeLAPR9ZjS8aSMH6w1E=", "+sm8smzyGAUsP5Z+iEfNAg==" });

            migrationBuilder.UpdateData(
                table: "Korisnik",
                keyColumn: "KorisnikId",
                keyValue: 1002,
                columns: new[] { "Email", "LozinkaHash", "LozinkaSalt" },
                values: new object[] { "korisnik@gmail.com", "Ipl3GDlB9dwlFPG0oeyZboUHk5I=", "13Euzz3RJYwobI3fH3eHZw==" });

            migrationBuilder.UpdateData(
                table: "KorisnikUloga",
                keyColumn: "KorisnikUlogaId",
                keyValue: 1,
                column: "DatumIzmjene",
                value: new DateTime(2025, 5, 18, 22, 19, 46, 711, DateTimeKind.Local).AddTicks(9307));

            migrationBuilder.UpdateData(
                table: "KorisnikUloga",
                keyColumn: "KorisnikUlogaId",
                keyValue: 2,
                column: "DatumIzmjene",
                value: new DateTime(2025, 5, 18, 22, 19, 46, 711, DateTimeKind.Local).AddTicks(9392));

            migrationBuilder.UpdateData(
                table: "Pacijent",
                keyColumn: "PacijentId",
                keyValue: 5001,
                columns: new[] { "Alergija", "DatumRodjenja", "Ime", "Prebivaliste", "Prezime", "Spol" },
                values: new object[] { "Ne", new DateTime(1998, 12, 11, 0, 0, 0, 0, DateTimeKind.Unspecified), "Josip", "Mostar", "Bojcic", "M" });
        }
    }
}
