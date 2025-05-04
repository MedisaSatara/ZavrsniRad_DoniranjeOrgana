using DoniranjeOrgana.Models.Request.SearchObject;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DoniranjeOrgana.Services.Service
{
    public interface IPacijentOsiguranjeService : ICRUDService<Models.Model.PacijentOsiguranje, PacijentSearchObject, Models.Request.PacijentOsiguranjeInsertRequest, Models.Request.PacijentOsiguranjeUpdateRequest>
    {
    }
}
