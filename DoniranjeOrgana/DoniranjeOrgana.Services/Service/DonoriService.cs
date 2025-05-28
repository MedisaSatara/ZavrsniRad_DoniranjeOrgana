using AutoMapper;
using DoniranjeOrgana.Models.Request.SearchObject;
using DoniranjeOrgana.Models.Request;
using DoniranjeOrgana.Services.Database;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;

namespace DoniranjeOrgana.Services.Service
{
    public class DonoriService : BaseCRUDService<Models.Model.Donori, Database.Donori, DonoriSearchObject, DonoriInsertRequest, DonoriUpdateRequest>, IDonoriService
    {
        public DonoriService(DoniranjeOrganaContext context, IMapper mapper)
            : base(context, mapper)
        {

        }
        public override IQueryable<Database.Donori> AddInclude(IQueryable<Database.Donori> query, DonoriSearchObject? search = null)
        {
            return query.Include(x => x.Korisnik);
        }
    }
}
