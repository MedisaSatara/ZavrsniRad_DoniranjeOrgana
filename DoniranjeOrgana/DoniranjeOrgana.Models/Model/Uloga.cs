using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DoniranjeOrgana.Models.Model
{
    public class Uloga
    {
        public int UlogaId { get; set; }
        public string? Naziv { get; set; }
        public string? OpisUloge { get; set; }

        //public virtual ICollection<KorisnikUloga> KorisnikUlogas { get; set; }
    }
}
