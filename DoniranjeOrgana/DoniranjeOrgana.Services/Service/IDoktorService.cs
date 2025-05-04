using DoniranjeOrgana.Models.Model;
using DoniranjeOrgana.Models.Request;
using DoniranjeOrgana.Models.Request.SearchObject;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DoniranjeOrgana.Services.Service
{
    public interface IDoktorService : ICRUDService<Doktor, DoktorSearchObject, DoktorInsertRequest, DoktorUpdateRequest>
    {

    }
}
