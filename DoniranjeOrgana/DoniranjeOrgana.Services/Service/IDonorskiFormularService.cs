using DoniranjeOrgana.Models.Request.SearchObject;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DoniranjeOrgana.Services.Service
{
    public interface IDonorskiFormularService : ICRUDService<Models.Model.DonorskiFormular, DonorskiFormularSearchObject, Models.Request.DonorskiFormularInsertRequest, Models.Request.DonorskiFormularUpdateRequest>
    {
    }
}
