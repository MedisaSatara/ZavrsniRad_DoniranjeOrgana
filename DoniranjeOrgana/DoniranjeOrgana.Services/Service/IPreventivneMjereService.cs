using DoniranjeOrgana.Models.Request.SearchObject;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DoniranjeOrgana.Services.Service
{
    public interface IPreventivneMjereService : ICRUDService<Models.Model.PreventivneMjere, PacijentSearchObject, Models.Request.PreventivneMjereInsertRequest, Models.Request.PreventivneMjereUpdateRequest>
    {
    }
}
