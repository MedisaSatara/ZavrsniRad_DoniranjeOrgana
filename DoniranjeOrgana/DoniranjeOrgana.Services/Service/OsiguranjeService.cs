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
    public class OsiguranjeService : BaseCRUDService<Models.Model.Osiguranje, Database.Osiguranje, PacijentSearchObject, OsiguranjeInsertRequest, OsiguranjeUpdateRequest>, IOsiguranjeService
    {
        public OsiguranjeService(DoniranjeOrganaContext context, IMapper mapper)
        : base(context, mapper)
        {
        }

        public override IQueryable<Database.Osiguranje> AddInclude(IQueryable<Database.Osiguranje> query, PacijentSearchObject? search = null)
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
        }
        /* public override IQueryable<Databases.Osiguranje> AddFilter(IQueryable<Databases.Osiguranje> query, PacijentSearchObject? search = null)
         {

         }*/
    }
}
