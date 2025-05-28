using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DoniranjeOrgana.Models.Request.SearchObject
{
    public class DonacijaOrganaSearchObject:BaseSearchObject
    {
        public string? ImeDonora {  get; set; } 
        public string? PrezimeDonora { get; set; }
        public string? StatusDonora {  get; set; }
        public int? AktivanDonor {  get; set; }
    }
}
