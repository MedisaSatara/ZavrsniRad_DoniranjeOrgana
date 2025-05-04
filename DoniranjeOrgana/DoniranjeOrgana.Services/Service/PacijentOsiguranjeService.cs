using AutoMapper;
using DoniranjeOrgana.Models.Request.SearchObject;
using DoniranjeOrgana.Models.Request;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DoniranjeOrgana.Services.Migrations;
using DoniranjeOrgana.Services.Database;

namespace DoniranjeOrgana.Services.Service
{
    public class PacijentOsiguranjeService : BaseCRUDService<Models.Model.PacijentOsiguranje, Database.PacijentOsiguranje, PacijentSearchObject, PacijentOsiguranjeInsertRequest, PacijentOsiguranjeUpdateRequest>, IPacijentOsiguranjeService
    {
        public PacijentOsiguranjeService(DoniranjeOrganaContext context, IMapper mapper)
        : base(context, mapper)
        {
        }

        /*public override IQueryable<Databases.Pacijent> AddInclude(IQueryable<Databases.Pacijent> query, PacijentSearchObject? search = null)
        {
            if (search?.isOsiguranjeInclude == true)
            {
                query = query.Include("PacijentOsiguranjes.Osiguranje");
            }
            return base.AddInclude(query, search);
        }*/
        public override IQueryable<Database.PacijentOsiguranje> AddFilter(IQueryable<Database.PacijentOsiguranje> query, PacijentSearchObject? search = null)
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
            if (!string.IsNullOrWhiteSpace(search?.BrojKartona))
            {
                filteredQuery = filteredQuery.Where(x => x.Pacijent.BrojKartona.Contains(search.BrojKartona.ToLower()));
            }


            return filteredQuery;
        }
    }
}
