using System;
using System.Collections.Generic;

namespace DoniranjeOrgana.Services.Database
{
    public partial class Specijalizacija
    {
        public Specijalizacija()
        {
            Doktors = new HashSet<Doktor>();
        }

        public int SpecijalizacijaId { get; set; }
        public string Naziv { get; set; } = null!;
        public string? Telefon { get; set; }

        public virtual ICollection<Doktor> Doktors { get; set; }
    }
}
