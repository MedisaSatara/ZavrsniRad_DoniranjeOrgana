using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace DoniranjeOrgana.Services.Migrations
{
    public partial class DonorDataUpdate : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.UpdateData(
                table: "Korisnik",
                keyColumn: "KorisnikId",
                keyValue: 1001,
                columns: new[] { "LozinkaHash", "LozinkaSalt" },
                values: new object[] { "qEfIuU/QklFXL6vY9z8xnA4WcGE=", "tITpSycgqu9GTMabiQZgbg==" });

            migrationBuilder.UpdateData(
                table: "Korisnik",
                keyColumn: "KorisnikId",
                keyValue: 1002,
                columns: new[] { "LozinkaHash", "LozinkaSalt" },
                values: new object[] { "RB2FkTfaaG05RoHe3KCgHldtS88=", "ccRv6uR5hDUM2qw6ph+UxQ==" });

            migrationBuilder.UpdateData(
                table: "Korisnik",
                keyColumn: "KorisnikId",
                keyValue: 1170,
                columns: new[] { "LozinkaHash", "LozinkaSalt" },
                values: new object[] { "twkWpXDqX9so6bQYRD3M18q/bOM=", "S/e7AUHzlsDRf0LbOmBfKA==" });

            migrationBuilder.UpdateData(
                table: "Korisnik",
                keyColumn: "KorisnikId",
                keyValue: 1178,
                columns: new[] { "LozinkaHash", "LozinkaSalt" },
                values: new object[] { "yuDYbrj241y7GjYLQSE2J/0tlzQ=", "y9Z3k6qgn3rXjDyV7pOPtA==" });

            migrationBuilder.UpdateData(
                table: "Korisnik",
                keyColumn: "KorisnikId",
                keyValue: 1179,
                columns: new[] { "LozinkaHash", "LozinkaSalt" },
                values: new object[] { "wV07eeDM0V/FcNQ2ZUbNcKKrC0A=", "p0ajCmhq3mD2TMvwmd925A==" });

            migrationBuilder.UpdateData(
                table: "KorisnikUloga",
                keyColumn: "KorisnikUlogaId",
                keyValue: 1,
                column: "DatumIzmjene",
                value: new DateTime(2025, 5, 28, 10, 44, 23, 96, DateTimeKind.Local).AddTicks(8019));

            migrationBuilder.UpdateData(
                table: "KorisnikUloga",
                keyColumn: "KorisnikUlogaId",
                keyValue: 2,
                column: "DatumIzmjene",
                value: new DateTime(2025, 5, 28, 10, 44, 23, 96, DateTimeKind.Local).AddTicks(8092));

            migrationBuilder.UpdateData(
                table: "KorisnikUloga",
                keyColumn: "KorisnikUlogaId",
                keyValue: 19,
                column: "DatumIzmjene",
                value: new DateTime(2025, 5, 28, 10, 44, 23, 96, DateTimeKind.Local).AddTicks(8110));

            migrationBuilder.UpdateData(
                table: "KorisnikUloga",
                keyColumn: "KorisnikUlogaId",
                keyValue: 20,
                column: "DatumIzmjene",
                value: new DateTime(2025, 5, 28, 10, 44, 23, 96, DateTimeKind.Local).AddTicks(8104));

            migrationBuilder.UpdateData(
                table: "KorisnikUloga",
                keyColumn: "KorisnikUlogaId",
                keyValue: 21,
                column: "DatumIzmjene",
                value: new DateTime(2025, 5, 28, 10, 44, 23, 96, DateTimeKind.Local).AddTicks(8099));
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
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
        }
    }
}
