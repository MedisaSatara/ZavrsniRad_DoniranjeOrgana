using AutoMapper;
using DoniranjeOrgana.Models.Request.SearchObject;
using DoniranjeOrgana.Models.Request;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DoniranjeOrgana.Services.Mapping
{
    public class ProfileMapping : Profile
    {
        public ProfileMapping()
        {
            CreateMap<Database.Korisnik, Models.Model.Korisnik>();
            CreateMap<KorisnikSearchObject, Database.Korisnik>();
            CreateMap<KorisnikInsertRequest, Database.Korisnik>();
            CreateMap<KorisnikUpdateRequest, Database.Korisnik>();

            CreateMap<Database.KorisnikUloga, Models.Model.KorisnikUloga>();
            CreateMap<KorisnikUlogaSearchObject, Database.KorisnikUloga>();
            CreateMap<KorisnikUlogaInsertRequest, Database.KorisnikUloga>();
            CreateMap<KorisnikUlogaUpdateRequest, Database.KorisnikUloga>();

            CreateMap<Database.Uloga, Models.Model.Uloga>();

            CreateMap<Database.Doktor, Models.Model.Doktor>();
            CreateMap<DoktorSearchObject, Database.Doktor>();
            CreateMap<DoktorInsertRequest, Database.Doktor>();
            CreateMap<DoktorUpdateRequest, Database.Doktor>();

            CreateMap<Database.Pacijent, Models.Model.Pacijent>();
            CreateMap<PacijentSearchObject, Database.Pacijent>();
            CreateMap<PacijentInsertRequest, Database.Pacijent>();
            CreateMap<PacijentUpdateRequest, Database.Pacijent>();

            CreateMap<Database.PacijentOsiguranje, Models.Model.PacijentOsiguranje>();
            CreateMap<Database.Osiguranje, Models.Model.Osiguranje>();
            CreateMap<Database.PreventivneMjere, Models.Model.PreventivneMjere>();

            CreateMap<Database.Specijalizacija, Models.Model.Specijalizacija>();
            CreateMap<SpecijalizacijaInsertRequest, Database.Specijalizacija>();
            CreateMap<SpecijalizacijaUpdateRequest, Database.Specijalizacija>();


            CreateMap<PacijentSearchObject, Database.PreventivneMjere>();
            CreateMap<PreventivneMjereInsertRequest, Database.PreventivneMjere>();
            CreateMap<PreventivneMjereUpdateRequest, Database.PreventivneMjere>();

            CreateMap<PacijentSearchObject, Database.Osiguranje>();
            CreateMap<OsiguranjeInsertRequest, Database.Osiguranje>();
            CreateMap<OsiguranjeUpdateRequest, Database.Osiguranje>();


            CreateMap<Database.PacijentOsiguranje, Models.Model.PacijentOsiguranje>();
            CreateMap<PacijentSearchObject, Database.PacijentOsiguranje>();
            CreateMap<PacijentOsiguranjeInsertRequest, Database.PacijentOsiguranje>();
            CreateMap<PacijentOsiguranjeUpdateRequest, Database.PacijentOsiguranje>();


            CreateMap<Database.Oboljenje, Models.Model.Oboljenje>();
            CreateMap<PacijentClassesSearchObject, Database.Oboljenje>();

            CreateMap<Database.Nalaz, Models.Model.Nalaz>();
            CreateMap<PacijentClassesSearchObject, Database.Nalaz>();


            CreateMap<Database.Terapija, Models.Model.Terapija>();

            CreateMap<Database.DonorskiFormula, Models.Model.DonorskiFormular>();
            CreateMap<DonorskiFormularSearchObject, Database.DonorskiFormula>();
            CreateMap<DonorskiFormularInsertRequest, Database.DonorskiFormula>();
            CreateMap<DonorskiFormularUpdateRequest, Database.DonorskiFormula>();


        }
    }
}
