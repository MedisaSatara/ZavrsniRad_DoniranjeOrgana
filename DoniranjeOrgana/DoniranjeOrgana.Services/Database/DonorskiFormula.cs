using System;
using System.Collections.Generic;

namespace DoniranjeOrgana.Services.Database
{
    public partial class DonorskiFormula
    {
        public int DonorskiFormularId { get; set; }
        public int? DonorId { get; set; }
        public DateTime? DatumPrijave { get; set; }
        public string? OrganiZaDonaciju { get; set; }
        public int? Saglasnost { get; set; }
        public string? Napomena { get; set; }
        public DateTime? DatumAzuriranja { get; set; }
        public byte[]? Potpis { get; set; }
        public virtual Donori? Donori { get; set; }
       // public virtual ICollection<DonacijaOrgana> DonacijaOrganas { get; set; }


    }
}
