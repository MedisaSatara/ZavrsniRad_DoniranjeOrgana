using System;
using System.Collections.Generic;

namespace DoniranjeOrgana.Services.Database
{
    public partial class Terapija
    {
        public int TerapijaId { get; set; }
        public string NazivLijeka { get; set; } = null!;
        public string? Uputa { get; set; }
        public string Od { get; set; } = null!;
        public string Do { get; set; } = null!;
        public string? Podsjetnik { get; set; }
    }
}
