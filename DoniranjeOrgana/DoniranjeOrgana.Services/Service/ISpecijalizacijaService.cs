using DoniranjeOrgana.Models.Request.SearchObject;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DoniranjeOrgana.Services.Service
{
    public interface ISpecijalizacijaService : ICRUDService<Models.Model.Specijalizacija, BaseSearchObject, Models.Request.SpecijalizacijaInsertRequest, Models.Request.SpecijalizacijaUpdateRequest>
    {
    }
}
