using System;
using System.Collections.Generic;

namespace DoniranjeOrgana.Services.Database
{
    public partial class Oboljenje
    {
        public int OboljenjeId { get; set; }
        public string? Dijagnoza { get; set; }
        public string? Terapija { get; set; }
    }
}
