﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DoniranjeOrgana.Models.Model
{
        public class Donori
        {
        public int DonorId { get;set; }
            public string Jmbg { get; set; } = null!;
            public string? MjestoRodjenja { get; set; }
            public string? Prebivaliste { get; set; }
            public string Telefon { get; set; } = null!;
            public string? KrvnaGrupa { get; set; }
            public string? RhFaktor { get; set; }
            public string? HronicneBolesti { get; set; }
            public string? Alergija { get; set; }
        public string? StatusDonora { get; set; }
        public int? AktivanDonor { get; set; }
        public DateTime? DatumAktivacije { get; set; }
        public DateTime? DatumSmrti { get; set; }
            public int? KorisnikId { get; set; }
            public virtual Korisnik? Korisnik { get; set; }
            //public virtual ICollection<DonorskiFormula> DonorskiFormulas { get; set; }

        }
}
