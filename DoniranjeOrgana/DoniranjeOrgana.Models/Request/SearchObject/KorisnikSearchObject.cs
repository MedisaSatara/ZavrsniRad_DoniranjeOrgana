﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DoniranjeOrgana.Models.Request.SearchObject
{
    public class KorisnikSearchObject:BaseSearchObject
    {
        public string? Ime { get; set; }
        public string? Prezime { get; set; }
        public string? KorisnickoIme { get; set; }
        public string? NazivUloge { get; set; }

        public int? UlogaId { get; set; }

        public bool? IsUlogeIncluded { get; set; }
    }
}
