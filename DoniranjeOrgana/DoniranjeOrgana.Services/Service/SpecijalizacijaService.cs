using AutoMapper;
using DoniranjeOrgana.Models.Request;
using DoniranjeOrgana.Models.Request.SearchObject;
using DoniranjeOrgana.Services.Database;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DoniranjeOrgana.Services.Service
{
    public class SpecijalizacijaService : BaseCRUDService<Models.Model.Specijalizacija, Database.Specijalizacija, BaseSearchObject, SpecijalizacijaInsertRequest, SpecijalizacijaUpdateRequest>, ISpecijalizacijaService
    {
        public SpecijalizacijaService(DoniranjeOrganaContext context, IMapper mapper)
            : base(context, mapper)
        {

        }
    }
}
