using System;
using System.Collections.Generic;

namespace DoniranjeOrgana.Services.Database
{
    public partial class Korisnik
    {
        public Korisnik()
        {
            KorisnikUlogas = new HashSet<KorisnikUloga>();
            Pacijents = new HashSet<Pacijent>();
        }

        public int KorisnikId { get; set; }
        public string Ime { get; set; } = null!;
        public string Prezime { get; set; } = null!;
        public string KorisnickoIme { get; set; } = null!;
        public string? LozinkaSalt { get; set; }
        public string? LozinkaHash { get; set; }
        public string? Spol { get;set; }
        public string? Telefon { get; set; }
        public string? Email { get; set; }
        public byte[]? Slika { get; set; }
        public string? DatumRodjenja { get; set; }
        public virtual ICollection<KorisnikUloga> KorisnikUlogas { get; set; }
        public virtual ICollection<Pacijent> Pacijents { get; set; }
    }
}
