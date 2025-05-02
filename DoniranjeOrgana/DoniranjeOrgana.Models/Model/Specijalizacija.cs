using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DoniranjeOrgana.Models.Model
{
    public class Specijalizacija
    {

        public int SpecijalizacijaId { get; set; }
        public string Naziv { get; set; } = null!;
        public string? Telefon { get; set; }

      //  public virtual ICollection<Doktor> Doktors { get; set; }
    }
}
