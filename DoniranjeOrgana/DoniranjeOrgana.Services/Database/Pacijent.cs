using System;
using System.Collections.Generic;

namespace DoniranjeOrgana.Services.Database
{
    public partial class Pacijent
    {
        public Pacijent()
        {
            DonorskiFormulas = new HashSet<DonorskiFormula>();
            Nalazs = new HashSet<Nalaz>();
            PacijentOsiguranjes = new HashSet<PacijentOsiguranje>();
            PreventivneMjeres = new HashSet<PreventivneMjere>();
        }

        public int PacijentId { get; set; }
        public string Ime { get; set; } = null!;
        public string Prezime { get; set; } = null!;
        public string Spol { get; set; } = null!;
        public string? DatumRodjenja { get; set; }
        public string Jmbg { get; set; } = null!;
        public string? MjestoRodjenja { get; set; }
        public string? Prebivaliste { get; set; }
        public string Telefon { get; set; } = null!;
        public string? KrvnaGrupa { get; set; }
        public string? RhFaktor { get; set; }
        public string? HronicneBolesti { get; set; }
        public string? Alergija { get; set; }
        public bool? Koagulopatija { get; set; }
        public string BrojKartona { get; set; } = null!;
        public string KorisnickoIme { get; set; } = null!;
        public string? LozinkaSalt { get; set; }
        public string? LozinkaHash { get; set; }
        public int? KorisnikId { get; set; }

        public virtual Korisnik? Korisnik { get; set; }
        public virtual ICollection<DonorskiFormula> DonorskiFormulas { get; set; }
        public virtual ICollection<Nalaz> Nalazs { get; set; }
        public virtual ICollection<PacijentOsiguranje> PacijentOsiguranjes { get; set; }
        public virtual ICollection<PreventivneMjere> PreventivneMjeres { get; set; }
    }
}
