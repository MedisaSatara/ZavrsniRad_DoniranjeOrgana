﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DoniranjeOrgana.Models.Request
{
    public class PreventivneMjereInsertRequest
    {
        // public int PreventivneMjereId { get; set; }
        public string Stanje { get; set; } = null!;
        public int PacijentId { get; set; }

        //public virtual Pacijent Pacijent { get; set; } = null!;
    }
}
