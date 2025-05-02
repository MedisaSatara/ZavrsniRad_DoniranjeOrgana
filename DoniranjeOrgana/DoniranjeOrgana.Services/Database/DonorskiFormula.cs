using System;
using System.Collections.Generic;

namespace DoniranjeOrgana.Services.Database
{
    public partial class DonorskiFormula
    {
        public int DonorskiFormularId { get; set; }
        public int? PacijentId { get; set; }
        public DateTime? DatumPrijave { get; set; }
        public string? OrganiZaDonaciju { get; set; }
        public int? Saglasnost { get; set; }
        public string? NacinSaglasnosti { get; set; }
        public string? StatusPrijave { get; set; }
        public string? Napomena { get; set; }
        public DateTime? DatumAzuriranja { get; set; }

        public virtual Pacijent? Pacijent { get; set; }
    }
}
