using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DoniranjeOrgana.Models.Request
{
    public class DonacijaKrviNotifier
    {
        public DonacijaKrviNotifier()
        {
        }
        public string Email { get; set; }
        public string Subject { get; set; }
        public string Content { get; set; }
    }
}
