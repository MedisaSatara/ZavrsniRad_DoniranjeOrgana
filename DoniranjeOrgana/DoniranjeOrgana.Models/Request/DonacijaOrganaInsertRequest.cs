using DoniranjeOrgana.Models.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DoniranjeOrgana.Models.Request
{
    public class DonacijaOrganaInsertRequest
    {
     //   public int? DonacijaOrganaId { get; set; }
        public int? DonoriId { get; set; }
        public int? DonorskiFormularId { get; set; }
        public string? StatusDonora { get; set; }
        public int? AktivanDonor { get; set; }
        public DateTime? DatumAktivacije { get; set; }
        public DateTime? DatumSmrti { get; set; }
    }
}
