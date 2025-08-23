using AutoMapper;
using DoniranjeOrgana.Models.Request.SearchObject;
using DoniranjeOrgana.Models.Request;
using DoniranjeOrgana.Services.Database;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;

namespace DoniranjeOrgana.Services.Service
{
    public class DavaociOrganaService : BaseCRUDService<Models.Model.DavaociOrgana, Database.DavaociOrgana, DavaociOrganaSearchObject, DavaociOrganaInsertRequest, DavaociOrganaUpdateRequest>, IDavaociOrganaService
    {
        public DavaociOrganaService(DoniranjeOrganaContext context, IMapper mapper)
        : base(context, mapper)
        {
        }

        public override IQueryable<Database.DavaociOrgana> AddInclude(IQueryable<Database.DavaociOrgana> query, DavaociOrganaSearchObject? search = null)
        {
            if (search?.IsKorisnikIncluded == true)
            {
                query = query.Include("Korisnik");
            }
            return base.AddInclude(query, search);
        }
        public override IQueryable<Database.DavaociOrgana> AddFilter(IQueryable<Database.DavaociOrgana> query, DavaociOrganaSearchObject? search = null)
        {
            var filteredQuery = base.AddFilter(query, search);

            if (!string.IsNullOrWhiteSpace(search?.Ime))
            {
                filteredQuery = filteredQuery.Where(x => x.Korisnik.Ime.Contains(search.Ime.ToLower()));
            }
            if (!string.IsNullOrWhiteSpace(search?.Prezime))
            {
                filteredQuery = filteredQuery.Where(x => x.Korisnik.Prezime.Contains(search.Prezime.ToLower()));
            }
            if (search?.IsKorisnikIncluded == true)
            {
                query = query.Include(x => x.Korisnik);
            }


            return filteredQuery;
        }
    }
}
