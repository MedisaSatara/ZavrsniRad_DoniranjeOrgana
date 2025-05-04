using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DoniranjeOrgana.Models.Request
{
    public class SpecijalizacijaUpdateRequest
    {
        //  public int OdjelId { get; set; }
        public string Naziv { get; set; } = null!;
        public string? Telefon { get; set; }
    }
}
