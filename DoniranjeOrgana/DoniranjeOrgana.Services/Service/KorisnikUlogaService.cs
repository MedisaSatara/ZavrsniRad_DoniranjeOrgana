using AutoMapper;
using DoniranjeOrgana.Models.Request;
using DoniranjeOrgana.Models.Request.SearchObject;
using DoniranjeOrgana.Services.Database;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DoniranjeOrgana.Services.Service
{
    public class KorisnikUlogaService : BaseCRUDService<Models.Model.KorisnikUloga, Database.KorisnikUloga, KorisnikUlogaSearchObject, KorisnikUlogaInsertRequest, KorisnikUlogaUpdateRequest>, IKorisnikUlogaService
    {
        public KorisnikUlogaService(DoniranjeOrganaContext context, IMapper mapper)
            : base(context, mapper)
        {
        }

        public override IQueryable<Database.KorisnikUloga> AddInclude(IQueryable<Database.KorisnikUloga> query, KorisnikUlogaSearchObject? search = null)
        {
            if (search?.IsUlogaIncluded == true)
            {
                query = query.Include("Uloga");
            }
            return base.AddInclude(query, search);
        }
        public override IQueryable<Database.KorisnikUloga> AddFilter(IQueryable<Database.KorisnikUloga> query, KorisnikUlogaSearchObject? search = null)
        {
            var filteredQuery = base.AddFilter(query, search);

            if (!string.IsNullOrWhiteSpace(search?.ImeKorisnik))
            {
                filteredQuery = filteredQuery.Where(x => x.Korisnik.Ime.Contains(search.ImeKorisnik.ToLower()));
            }
            if (!string.IsNullOrWhiteSpace(search?.PrezimeKorisnika))
            {
                filteredQuery = filteredQuery.Where(x => x.Korisnik.Prezime.Contains(search.PrezimeKorisnika.ToLower()));
            }
            if (!string.IsNullOrWhiteSpace(search?.NazivUloge))
            {
                filteredQuery = filteredQuery.Where(x => x.Uloga.Naziv.Contains(search.NazivUloge.ToLower()));
            }

            return filteredQuery;
        }
    }
}
