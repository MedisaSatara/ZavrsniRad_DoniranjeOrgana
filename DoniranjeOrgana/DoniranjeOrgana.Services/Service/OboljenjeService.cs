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
    public class OboljenjeService : BaseService<Models.Model.Oboljenje, Database.Oboljenje, PacijentClassesSearchObject>, IOboljenjeService
    {
        public OboljenjeService(DoniranjeOrganaContext context, IMapper mapper)
            : base(context, mapper)
        {

        }
    }
}
