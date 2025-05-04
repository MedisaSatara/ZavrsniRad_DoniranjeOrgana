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
    public class UlogaService : BaseService<Models.Model.Uloga, Database.Uloga, BaseSearchObject>, IUlogaService
    {
        public UlogaService(DoniranjeOrganaContext context, IMapper mapper)
            : base(context, mapper)
        {

        }
    }
}
