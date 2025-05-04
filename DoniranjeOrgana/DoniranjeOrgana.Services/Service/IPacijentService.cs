using DoniranjeOrgana.Models.Request.SearchObject;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DoniranjeOrgana.Services.Service
{
    public interface IPacijentService : ICRUDService<Models.Model.Pacijent, PacijentSearchObject, Models.Request.PacijentInsertRequest, Models.Request.PacijentUpdateRequest>
    {
    }
}
