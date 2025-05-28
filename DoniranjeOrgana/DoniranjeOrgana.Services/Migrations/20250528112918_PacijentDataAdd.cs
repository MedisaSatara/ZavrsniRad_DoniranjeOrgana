using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace DoniranjeOrgana.Services.Migrations
{
    public partial class PacijentDataAdd : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "BrojKartona",
                table: "Pacijent");

            migrationBuilder.DropColumn(
                name: "KorisnickoIme",
                table: "Pacijent");

            migrationBuilder.DropColumn(
                name: "LozinkaHash",
                table: "Pacijent");

            migrationBuilder.DropColumn(
                name: "LozinkaSalt",
                table: "Pacijent");

            migrationBuilder.UpdateData(
                table: "Korisnik",
                keyColumn: "KorisnikId",
                keyValue: 1001,
                columns: new[] { "LozinkaHash", "LozinkaSalt" },
                values: new object[] { "3nSQXTQEyhe4KLqvrZh1gay6UuM=", "69rDF85G1UT8y/m87NcVPg==" });

            migrationBuilder.UpdateData(
                table: "Korisnik",
                keyColumn: "KorisnikId",
                keyValue: 1002,
                columns: new[] { "LozinkaHash", "LozinkaSalt" },
                values: new object[] { "vOu4oss7qaeTHHVBHqWmNAMwW2A=", "RJx7LXGgsY8cs4fswEagTg==" });

            migrationBuilder.UpdateData(
                table: "Korisnik",
                keyColumn: "KorisnikId",
                keyValue: 1170,
                columns: new[] { "LozinkaHash", "LozinkaSalt" },
                values: new object[] { "ztHxe7nzO7dmzCqo+vyEYq0Hmmg=", "viJ62l5R+FTa9cqCGQcbzA==" });

            migrationBuilder.UpdateData(
                table: "Korisnik",
                keyColumn: "KorisnikId",
                keyValue: 1178,
                columns: new[] { "LozinkaHash", "LozinkaSalt" },
                values: new object[] { "SGMLyvZtrFJXMJsdSYHCDDEZ7GA=", "tOfHX6yGX2UAX3UM3Nc3Cw==" });

            migrationBuilder.UpdateData(
                table: "Korisnik",
                keyColumn: "KorisnikId",
                keyValue: 1179,
                columns: new[] { "LozinkaHash", "LozinkaSalt" },
                values: new object[] { "sFOHzyHNE5saySM6wAEYnrIcPjo=", "/YYO+PdAYpHZohkP/bb76w==" });

            migrationBuilder.UpdateData(
                table: "KorisnikUloga",
                keyColumn: "KorisnikUlogaId",
                keyValue: 1,
                column: "DatumIzmjene",
                value: new DateTime(2025, 5, 28, 13, 29, 17, 12, DateTimeKind.Local).AddTicks(5542));

            migrationBuilder.UpdateData(
                table: "KorisnikUloga",
                keyColumn: "KorisnikUlogaId",
                keyValue: 2,
                column: "DatumIzmjene",
                value: new DateTime(2025, 5, 28, 13, 29, 17, 12, DateTimeKind.Local).AddTicks(5594));

            migrationBuilder.UpdateData(
                table: "KorisnikUloga",
                keyColumn: "KorisnikUlogaId",
                keyValue: 19,
                column: "DatumIzmjene",
                value: new DateTime(2025, 5, 28, 13, 29, 17, 12, DateTimeKind.Local).AddTicks(5607));

            migrationBuilder.UpdateData(
                table: "KorisnikUloga",
                keyColumn: "KorisnikUlogaId",
                keyValue: 20,
                column: "DatumIzmjene",
                value: new DateTime(2025, 5, 28, 13, 29, 17, 12, DateTimeKind.Local).AddTicks(5603));

            migrationBuilder.UpdateData(
                table: "KorisnikUloga",
                keyColumn: "KorisnikUlogaId",
                keyValue: 21,
                column: "DatumIzmjene",
                value: new DateTime(2025, 5, 28, 13, 29, 17, 12, DateTimeKind.Local).AddTicks(5599));
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<string>(
                name: "BrojKartona",
                table: "Pacijent",
                type: "nvarchar(10)",
                maxLength: 10,
                nullable: false,
                defaultValue: "");

            migrationBuilder.AddColumn<string>(
                name: "KorisnickoIme",
                table: "Pacijent",
                type: "nvarchar(20)",
                maxLength: 20,
                nullable: false,
                defaultValue: "");

            migrationBuilder.AddColumn<string>(
                name: "LozinkaHash",
                table: "Pacijent",
                type: "nvarchar(50)",
                maxLength: 50,
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "LozinkaSalt",
                table: "Pacijent",
                type: "nvarchar(50)",
                maxLength: 50,
                nullable: true);

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

            migrationBuilder.UpdateData(
                table: "Pacijent",
                keyColumn: "PacijentId",
                keyValue: 5001,
                columns: new[] { "BrojKartona", "KorisnickoIme" },
                values: new object[] { "14B579", "pacijent1" });

            migrationBuilder.UpdateData(
                table: "Pacijent",
                keyColumn: "PacijentId",
                keyValue: 5002,
                columns: new[] { "BrojKartona", "KorisnickoIme" },
                values: new object[] { "19378A", "Pacijent2" });

            migrationBuilder.UpdateData(
                table: "Pacijent",
                keyColumn: "PacijentId",
                keyValue: 5003,
                columns: new[] { "BrojKartona", "KorisnickoIme" },
                values: new object[] { "8537C", "pacijent3" });
        }
    }
}
