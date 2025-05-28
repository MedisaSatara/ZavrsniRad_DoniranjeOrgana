using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DoniranjeOrgana.Models.Request
{
    public class DonacijaKrviUpdateRequest
    {
        // public int DonacijiKrviId { get; set; }
        public int? DonorId { get; set; }
        public DateTime? DatumDonacije { get; set; }
        public decimal? Kolicina { get; set; }
        public string? Lokacija { get; set; }
        public string? Napomena { get; set; }
        public string? Status { get; set; }
        // public virtual Korisnik? Korisnik { get; set; }
    }
}
