using DoniranjeOrgana.Models.Request.SearchObject;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DoniranjeOrgana.Services.Service
{
    public interface IDonoriService : ICRUDService<Models.Model.Donori, DonoriSearchObject, Models.Request.DonoriInsertRequest, Models.Request.DonoriUpdateRequest>
    {
    }
}
