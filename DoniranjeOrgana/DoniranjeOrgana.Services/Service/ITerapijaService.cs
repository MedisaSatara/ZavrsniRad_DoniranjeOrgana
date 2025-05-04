using DoniranjeOrgana.Models.Request.SearchObject;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static DoniranjeOrgana.Services.Service.IService;

namespace DoniranjeOrgana.Services.Service
{
    public interface ITerapijaService : IService<Models.Model.Terapija, BaseSearchObject>
    {

    }
}
