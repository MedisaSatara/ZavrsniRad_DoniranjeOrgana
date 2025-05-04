using AutoMapper;
using DoniranjeOrgana.Models.Request.SearchObject;
using DoniranjeOrgana.Services.Database;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DoniranjeOrgana.Services.Service
{
    public class NalazService : BaseService<Models.Model.Nalaz, Database.Nalaz, PacijentClassesSearchObject>, INalazService
    {
        public NalazService(DoniranjeOrganaContext context, IMapper mapper)
            : base(context, mapper)
        {

        }
        public override IQueryable<Database.Nalaz> AddFilter(IQueryable<Database.Nalaz> query, PacijentClassesSearchObject? search = null)
        {
            if (!string.IsNullOrWhiteSpace(search?.ImePacijenta))
            {
                query = query.Where(x => x.Pacijent.Ime.Contains(search.ImePacijenta.ToLower()));
            }
            if (!string.IsNullOrWhiteSpace(search?.PrezimePacijenta))
            {
                query = query.Where(x => x.Pacijent.Prezime.Contains(search.PrezimePacijenta.ToLower()));
            }
            if (!string.IsNullOrWhiteSpace(search?.BrojKartona))
            {
                query = query.Where(x => x.Pacijent.BrojKartona.Contains(search.BrojKartona.ToLower()));
            }
            if (search?.PacijentId != null && search.PacijentId > 0)
            {
                query = query.Where(x => x.PacijentId == search.PacijentId);
            }

            return base.AddFilter(query, search);
        }
    }
}
