using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace DoniranjeOrgana.Services.Database
{
    public partial class DoniranjeOrganaContext : DbContext
    {
        public DoniranjeOrganaContext()
        {
        }

        public DoniranjeOrganaContext(DbContextOptions<DoniranjeOrganaContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Doktor> Doktors { get; set; } = null!;
        public virtual DbSet<DonorskiFormula> DonorskiFormulas { get; set; } = null!;
        public virtual DbSet<Korisnik> Korisniks { get; set; } = null!;
        public virtual DbSet<KorisnikUloga> KorisnikUlogas { get; set; } = null!;
        public virtual DbSet<Nalaz> Nalazs { get; set; } = null!;
        public virtual DbSet<Oboljenje> Oboljenjes { get; set; } = null!;
        public virtual DbSet<Osiguranje> Osiguranjes { get; set; } = null!;
        public virtual DbSet<Pacijent> Pacijents { get; set; } = null!;
        public virtual DbSet<PacijentOsiguranje> PacijentOsiguranjes { get; set; } = null!;
        public virtual DbSet<PreventivneMjere> PreventivneMjeres { get; set; } = null!;
        public virtual DbSet<Specijalizacija> Specijalizacijas { get; set; } = null!;
        public virtual DbSet<Terapija> Terapijas { get; set; } = null!;
        public virtual DbSet<Uloga> Ulogas { get; set; } = null!;

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
                optionsBuilder.UseSqlServer("Data Source=localhost;Initial Catalog=DoniranjeOrgana;User Id=sa;Password=st123W!a;TrustServerCertificate=True");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Doktor>(entity =>
            {
                entity.ToTable("Doktor");

                entity.Property(e => e.DatumRodjenja).HasMaxLength(20);

                entity.Property(e => e.Email).HasMaxLength(50);

                entity.Property(e => e.Grad).HasMaxLength(30);

                entity.Property(e => e.Ime).HasMaxLength(30);

                entity.Property(e => e.Jmbg)
                    .HasMaxLength(13)
                    .HasColumnName("JMBG");

                entity.Property(e => e.Prezime).HasMaxLength(30);

                entity.Property(e => e.Spol).HasMaxLength(1);

                entity.Property(e => e.Telefon).HasMaxLength(20);

                entity.HasOne(d => d.Specijalizacija)
                    .WithMany(p => p.Doktors)
                    .HasForeignKey(d => d.SpecijalizacijaId)
                    .HasConstraintName("FK_Specijalizacija_Doktor");
            });

            modelBuilder.Entity<DonorskiFormula>(entity =>
            {
                entity.HasKey(e => e.DonorskiFormularId)
                    .HasName("PK__Donorski__DC8CD44D65EA0EBC");

                entity.ToTable("DonorskiFormula");

                entity.Property(e => e.DatumAzuriranja).HasColumnType("datetime");

                entity.Property(e => e.DatumPrijave).HasColumnType("datetime");

               // entity.Property(e => e.NacinSaglasnosti).HasMaxLength(100);

                entity.Property(e => e.Napomena).HasMaxLength(250);

                entity.Property(e => e.OrganiZaDonaciju).HasMaxLength(250);
               // entity.Property(e => e.Potpis).HasMaxLength(250);


                // entity.Property(e => e.StatusPrijave).HasMaxLength(150);

                entity.HasOne(d => d.Donori)
                    .WithMany(p => p.DonorskiFormulas)
                    .HasForeignKey(d => d.DonorId)
                    .HasConstraintName("FK_Donori_DonorskiFormular");
            });

            modelBuilder.Entity<Korisnik>(entity =>
            {
                entity.ToTable("Korisnik");

                entity.Property(e => e.Ime).HasMaxLength(30);

                entity.Property(e => e.KorisnickoIme).HasMaxLength(20);

                entity.Property(e => e.LozinkaHash).HasMaxLength(250);

                entity.Property(e => e.LozinkaSalt).HasMaxLength(250);

                entity.Property(e => e.Prezime).HasMaxLength(30);
            });

            modelBuilder.Entity<KorisnikUloga>(entity =>
            {
                entity.ToTable("KorisnikUloga");

                entity.Property(e => e.DatumIzmjene).HasColumnType("date");

                entity.HasOne(d => d.Korisnik)
                    .WithMany(p => p.KorisnikUlogas)
                    .HasForeignKey(d => d.KorisnikId)
                    .HasConstraintName("FK_Korisnik_KorisnikUloga");

                entity.HasOne(d => d.Uloga)
                    .WithMany(p => p.KorisnikUlogas)
                    .HasForeignKey(d => d.UlogaId)
                    .HasConstraintName("FK_Uloga_KorisnikUloga");
            });

            modelBuilder.Entity<Nalaz>(entity =>
            {
                entity.ToTable("Nalaz");

                entity.Property(e => e.Datum).HasMaxLength(20);

                entity.Property(e => e.LicnaAnamneza).HasMaxLength(250);

                entity.Property(e => e.RadnaAnamneza).HasMaxLength(250);

                entity.HasOne(d => d.Pacijent)
                    .WithMany(p => p.Nalazs)
                    .HasForeignKey(d => d.PacijentId)
                    .HasConstraintName("FK_Nalaz_Pacijent");
            });

            modelBuilder.Entity<Oboljenje>(entity =>
            {
                entity.ToTable("Oboljenje");

                entity.Property(e => e.Dijagnoza).HasMaxLength(250);

                entity.Property(e => e.Terapija).HasMaxLength(250);
            });

            modelBuilder.Entity<Osiguranje>(entity =>
            {
                entity.ToTable("Osiguranje");

                entity.Property(e => e.Osiguranik).HasMaxLength(250);

                entity.Property(e => e.TipOsiguranja).HasMaxLength(50);
            });

            modelBuilder.Entity<Pacijent>(entity =>
            {
                entity.ToTable("Pacijent");

                entity.Property(e => e.Alergija).HasMaxLength(250);

                entity.Property(e => e.BrojKartona).HasMaxLength(10);

                entity.Property(e => e.DatumRodjenja).HasMaxLength(10);

                entity.Property(e => e.HronicneBolesti).HasMaxLength(250);

                entity.Property(e => e.Ime).HasMaxLength(30);

                entity.Property(e => e.Jmbg)
                    .HasMaxLength(13)
                    .HasColumnName("JMBG");

                entity.Property(e => e.KorisnickoIme).HasMaxLength(20);

                entity.Property(e => e.KrvnaGrupa).HasMaxLength(10);

                entity.Property(e => e.LozinkaHash).HasMaxLength(50);

                entity.Property(e => e.LozinkaSalt).HasMaxLength(50);

                entity.Property(e => e.MjestoRodjenja).HasMaxLength(50);

                entity.Property(e => e.Prebivaliste).HasMaxLength(50);

                entity.Property(e => e.Prezime).HasMaxLength(30);

                entity.Property(e => e.RhFaktor).HasMaxLength(20);

                entity.Property(e => e.Spol).HasMaxLength(1);

                entity.Property(e => e.Telefon).HasMaxLength(20);

                entity.HasOne(d => d.Korisnik)
                    .WithMany(p => p.Pacijents)
                    .HasForeignKey(d => d.KorisnikId)
                    .HasConstraintName("FK_Korisnik_Pacijent");
            });

            modelBuilder.Entity<PacijentOsiguranje>(entity =>
            {
                entity.ToTable("PacijentOsiguranje");

                entity.Property(e => e.DatumOsiguranja).HasMaxLength(20);

                entity.HasOne(d => d.Osiguranje)
                    .WithMany(p => p.PacijentOsiguranjes)
                    .HasForeignKey(d => d.OsiguranjeId)
                    .HasConstraintName("FK_Osiguranje_PacijentOsiguranje");

                entity.HasOne(d => d.Pacijent)
                    .WithMany(p => p.PacijentOsiguranjes)
                    .HasForeignKey(d => d.PacijentId)
                    .HasConstraintName("FK_Pacijent_PacijentOsiguranje");
            });

            modelBuilder.Entity<PreventivneMjere>(entity =>
            {
                entity.ToTable("PreventivneMjere");

                entity.Property(e => e.Stanje).HasMaxLength(100);

                entity.HasOne(d => d.Pacijent)
                    .WithMany(p => p.PreventivneMjeres)
                    .HasForeignKey(d => d.PacijentId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Pacijent_Mjere");
            });

            modelBuilder.Entity<Specijalizacija>(entity =>
            {
                entity.ToTable("Specijalizacija");

                entity.Property(e => e.Naziv).HasMaxLength(200);

                entity.Property(e => e.Telefon).HasMaxLength(20);
            });

            modelBuilder.Entity<Terapija>(entity =>
            {
                entity.ToTable("Terapija");

                entity.Property(e => e.Do).HasMaxLength(20);

                entity.Property(e => e.NazivLijeka).HasMaxLength(100);

                entity.Property(e => e.Od).HasMaxLength(20);

                entity.Property(e => e.Podsjetnik).HasMaxLength(250);

                entity.Property(e => e.Uputa).HasMaxLength(100);
            });

            modelBuilder.Entity<Uloga>(entity =>
            {
                entity.ToTable("Uloga");

                entity.Property(e => e.Naziv).HasMaxLength(50);

                entity.Property(e => e.OpisUloge).HasMaxLength(250);
            });
            modelBuilder.Entity<Donori>().HasKey(z => z.DonorId);
            modelBuilder.Entity<Donori>(entity =>
            {
                entity.ToTable("Donori");

                entity.Property(e => e.Alergija).HasMaxLength(250);

                entity.Property(e => e.DatumRodjenja).HasMaxLength(10);

                entity.Property(e => e.HronicneBolesti).HasMaxLength(250);

                entity.Property(e => e.Ime).HasMaxLength(30);

                entity.Property(e => e.Jmbg)
                    .HasMaxLength(13)
                    .HasColumnName("JMBG");

                entity.Property(e => e.KorisnickoIme).HasMaxLength(20);

                entity.Property(e => e.KrvnaGrupa).HasMaxLength(10);

                entity.Property(e => e.LozinkaHash).HasMaxLength(50);

                entity.Property(e => e.LozinkaSalt).HasMaxLength(50);

                entity.Property(e => e.MjestoRodjenja).HasMaxLength(50);

                entity.Property(e => e.Prebivaliste).HasMaxLength(50);

                entity.Property(e => e.Prezime).HasMaxLength(30);

                entity.Property(e => e.RhFaktor).HasMaxLength(20);

                entity.Property(e => e.Spol).HasMaxLength(1);

                entity.Property(e => e.Telefon).HasMaxLength(20);

                entity.HasOne(d => d.Korisnik)
                    .WithMany(p => p.Donoris)
                    .HasForeignKey(d => d.KorisnikId)
                    .HasConstraintName("FK_Korisnik_Donori");
            });

            OnModelCreatingPartial(modelBuilder);
            modelBuilder.Seed();
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
