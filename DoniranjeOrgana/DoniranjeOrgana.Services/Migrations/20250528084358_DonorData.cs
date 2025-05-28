using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace DoniranjeOrgana.Services.Migrations
{
    public partial class DonorData : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Donori_DonorskiFormular",
                table: "DonorskiFormula");

            migrationBuilder.DeleteData(
                table: "DonorskiFormula",
                keyColumn: "DonorskiFormularId",
                keyValue: 4995);

            migrationBuilder.UpdateData(
                table: "Korisnik",
                keyColumn: "KorisnikId",
                keyValue: 1001,
                columns: new[] { "LozinkaHash", "LozinkaSalt" },
                values: new object[] { "y0ScMP+qyPX0d9Z2Hn6KHLBHg50=", "3s/Zk9MizbLZdo+vAZqKnA==" });

            migrationBuilder.UpdateData(
                table: "Korisnik",
                keyColumn: "KorisnikId",
                keyValue: 1002,
                columns: new[] { "LozinkaHash", "LozinkaSalt" },
                values: new object[] { "wY2yn5g/eHVUUR3yqO9dv1nwdDA=", "h62itDbkp1coeDyclEuP8A==" });

            migrationBuilder.UpdateData(
                table: "Korisnik",
                keyColumn: "KorisnikId",
                keyValue: 1170,
                columns: new[] { "LozinkaHash", "LozinkaSalt" },
                values: new object[] { "FFpjiz2rcryU01f34dfXthoXX2I=", "+tScfEv25y1OtQgiI7n2SA==" });

            migrationBuilder.UpdateData(
                table: "Korisnik",
                keyColumn: "KorisnikId",
                keyValue: 1178,
                columns: new[] { "LozinkaHash", "LozinkaSalt" },
                values: new object[] { "Jp6Mxq/8xYOsk7clpNNBSYMvkTo=", "og6V92L7MHbuYksgZqneng==" });

            migrationBuilder.UpdateData(
                table: "Korisnik",
                keyColumn: "KorisnikId",
                keyValue: 1179,
                columns: new[] { "LozinkaHash", "LozinkaSalt" },
                values: new object[] { "PNQTPP2erJjf8dPruG7OxcFrsPE=", "Rf08sPHJ9WHkmKFuJgu3wQ==" });

            migrationBuilder.UpdateData(
                table: "KorisnikUloga",
                keyColumn: "KorisnikUlogaId",
                keyValue: 1,
                column: "DatumIzmjene",
                value: new DateTime(2025, 5, 28, 10, 43, 56, 310, DateTimeKind.Local).AddTicks(3223));

            migrationBuilder.UpdateData(
                table: "KorisnikUloga",
                keyColumn: "KorisnikUlogaId",
                keyValue: 2,
                column: "DatumIzmjene",
                value: new DateTime(2025, 5, 28, 10, 43, 56, 310, DateTimeKind.Local).AddTicks(3307));

            migrationBuilder.UpdateData(
                table: "KorisnikUloga",
                keyColumn: "KorisnikUlogaId",
                keyValue: 19,
                column: "DatumIzmjene",
                value: new DateTime(2025, 5, 28, 10, 43, 56, 310, DateTimeKind.Local).AddTicks(3321));

            migrationBuilder.UpdateData(
                table: "KorisnikUloga",
                keyColumn: "KorisnikUlogaId",
                keyValue: 20,
                column: "DatumIzmjene",
                value: new DateTime(2025, 5, 28, 10, 43, 56, 310, DateTimeKind.Local).AddTicks(3317));

            migrationBuilder.UpdateData(
                table: "KorisnikUloga",
                keyColumn: "KorisnikUlogaId",
                keyValue: 21,
                column: "DatumIzmjene",
                value: new DateTime(2025, 5, 28, 10, 43, 56, 310, DateTimeKind.Local).AddTicks(3313));

            migrationBuilder.AddForeignKey(
                name: "FK_Donori_DonorskiFormular",
                table: "DonorskiFormula",
                column: "DonorId",
                principalTable: "Donori",
                principalColumn: "DonorId",
                onDelete: ReferentialAction.Restrict);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Donori_DonorskiFormular",
                table: "DonorskiFormula");

            migrationBuilder.InsertData(
                table: "DonorskiFormula",
                columns: new[] { "DonorskiFormularId", "DatumAzuriranja", "DatumPrijave", "DonorId", "Napomena", "OrganiZaDonaciju", "PacijentId", "Potpis", "Saglasnost" },
                values: new object[] { 4995, new DateTime(2024, 5, 7, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2024, 5, 7, 0, 0, 0, 0, DateTimeKind.Unspecified), 5501, "", "bubreg", null, null, 1 });

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
                columns: new[] { "LozinkaHash", "LozinkaSalt" },
                values: new object[] { "JgAjmqy9QL+qvVhgMziwcWHILk8=", "H9KZi4bA9tMKoZohzweVwA==" });

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

            migrationBuilder.AddForeignKey(
                name: "FK_Donori_DonorskiFormular",
                table: "DonorskiFormula",
                column: "DonorId",
                principalTable: "Donori",
                principalColumn: "DonorId");
        }
    }
}
