using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DoniranjeOrgana.Models.Model
{
    public class Oboljenje
    {
        public int OboljenjeId { get; set; }
        public string? Dijagnoza { get; set; }
        public string? Terapija { get; set; }
    }
}
