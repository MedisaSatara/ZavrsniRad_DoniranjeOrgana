using System;
using System.Collections.Generic;

namespace DoniranjeOrgana.Services.Database
{
    public partial class Osiguranje
    {
        public Osiguranje()
        {
            PacijentOsiguranjes = new HashSet<PacijentOsiguranje>();
        }

        public int OsiguranjeId { get; set; }
        public string Osiguranik { get; set; } = null!;
        public string? TipOsiguranja { get; set; }

        public virtual ICollection<PacijentOsiguranje> PacijentOsiguranjes { get; set; }
    }
}
