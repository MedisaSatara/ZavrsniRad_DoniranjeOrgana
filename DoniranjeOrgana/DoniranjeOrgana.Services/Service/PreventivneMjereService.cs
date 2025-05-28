using AutoMapper;
using DoniranjeOrgana.Models.Request.SearchObject;
using DoniranjeOrgana.Models.Request;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DoniranjeOrgana.Services.Database;

namespace DoniranjeOrgana.Services.Service
{
    public class PreventivneMjereService : BaseCRUDService<Models.Model.PreventivneMjere, Database.PreventivneMjere, PacijentSearchObject, PreventivneMjereInsertRequest, PreventivneMjereUpdateRequest>, IPreventivneMjereService
    {
        public PreventivneMjereService(DoniranjeOrganaContext context, IMapper mapper)
        : base(context, mapper)
        {
        }

        /* public override IQueryable<Databases.PreventivneMjere> AddInclude(IQueryable<Databases.PreventivneMjere> query, PacijentSearchObject? search = null)
         {
             if (search?.isPreventivneMjereIncluded == true)
             {
                 query = query.Include("PreventivneMjeres");
             }
             if (search?.isOsiguranjeInclude == true)
             {
                 query = query.Include("PacijentOsiguranjes.Osiguranje");
             }
             return base.AddInclude(query, search);
         }*/
        public override IQueryable<Database.PreventivneMjere> AddFilter(IQueryable<Database.PreventivneMjere> query, PacijentSearchObject? search = null)
        {
            var filteredQuery = base.AddFilter(query, search);

            if (!string.IsNullOrWhiteSpace(search?.ImePacijenta))
            {
                filteredQuery = filteredQuery.Where(x => x.Pacijent.Ime.Contains(search.ImePacijenta.ToLower()));
            }
            if (!string.IsNullOrWhiteSpace(search?.PrezimePacijenta))
            {
                filteredQuery = filteredQuery.Where(x => x.Pacijent.Prezime.Contains(search.PrezimePacijenta.ToLower()));
            }
            if (search?.isPreventivneMjereIncluded == true)
            {
                query = query.Include(x => x.PreventivneMjereId);
            }


            return filteredQuery;
        }
    }
}
