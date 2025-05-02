using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DoniranjeOrgana.Models.Model
{
    public class Doktor
    {
        public int DoktorId { get; set; }
        public string Ime { get; set; } = null!;
        public string Prezime { get; set; } = null!;
        public string? Spol { get; set; }
        public string? DatumRodjenja { get; set; }
        public string? Grad { get; set; }
        public string Jmbg { get; set; } = null!;
        public string? Telefon { get; set; }
        public string? Email { get; set; }
        public int? SpecijalizacijaId { get; set; }

       // public virtual Specijalizacija? Specijalizacija { get; set; }
    }
}
