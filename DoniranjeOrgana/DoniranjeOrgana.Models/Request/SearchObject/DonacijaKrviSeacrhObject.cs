using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DoniranjeOrgana.Models.Request.SearchObject
{
    public class DonacijaKrviSeacrhObject:BaseSearchObject
    {
        public string? ImeKorisnika {  get; set; }
        public string? PrezimeKorisnika {  get;set; }
        public string? KrvnaGrupa { get; set; }
    }
}
