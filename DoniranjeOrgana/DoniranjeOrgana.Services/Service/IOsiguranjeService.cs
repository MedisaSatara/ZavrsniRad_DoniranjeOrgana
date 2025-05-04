using DoniranjeOrgana.Models.Request.SearchObject;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DoniranjeOrgana.Services.Service
{
    public interface IOsiguranjeService : ICRUDService<Models.Model.Osiguranje, PacijentSearchObject, Models.Request.OsiguranjeInsertRequest, Models.Request.OsiguranjeUpdateRequest>
    {
    }
}
