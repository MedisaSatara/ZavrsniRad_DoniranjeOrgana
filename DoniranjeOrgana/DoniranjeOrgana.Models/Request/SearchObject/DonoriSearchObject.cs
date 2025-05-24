using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DoniranjeOrgana.Models.Request.SearchObject
{
    public class DonoriSearchObject:BaseSearchObject
    {
        public string? Ime { get; set; }
        public string? Prezime { get; set; }

    }
}
