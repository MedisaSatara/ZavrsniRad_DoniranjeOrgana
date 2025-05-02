using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DoniranjeOrgana.Models.Model
{
    public class Osiguranje
    {
        public int OsiguranjeId { get; set; }
        public string Osiguranik { get; set; } = null!;
        public string? TipOsiguranja { get; set; }

       // public virtual ICollection<PacijentOsiguranje> PacijentOsiguranjes { get; set; }
    }
}
