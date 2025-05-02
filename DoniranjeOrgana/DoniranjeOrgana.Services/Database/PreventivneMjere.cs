using System;
using System.Collections.Generic;

namespace DoniranjeOrgana.Services.Database
{
    public partial class PreventivneMjere
    {
        public int PreventivneMjereId { get; set; }
        public string Stanje { get; set; } = null!;
        public int PacijentId { get; set; }

        public virtual Pacijent Pacijent { get; set; } = null!;
    }
}
