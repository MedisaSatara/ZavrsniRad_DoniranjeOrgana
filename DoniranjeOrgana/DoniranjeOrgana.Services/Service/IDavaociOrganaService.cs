using DoniranjeOrgana.Models.Request.SearchObject;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DoniranjeOrgana.Services.Service
{
    public interface IDavaociOrganaService : ICRUDService<Models.Model.DavaociOrgana, DavaociOrganaSearchObject, Models.Request.DavaociOrganaInsertRequest, Models.Request.DavaociOrganaUpdateRequest>
    {
    }
}
