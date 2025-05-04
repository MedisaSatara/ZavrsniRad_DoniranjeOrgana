using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DoniranjeOrgana.Models.Request
{
    public class ProvjeraLozinkeRequest
    {
        public int KorisnikId { get; set; }
        public string StaraLozinka { get; set; }
    }
}
