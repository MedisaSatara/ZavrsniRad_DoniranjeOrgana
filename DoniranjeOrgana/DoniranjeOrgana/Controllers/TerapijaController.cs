using DoniranjeOrgana.Models.Request.SearchObject;
using DoniranjeOrgana.Services.Service;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace DoniranjeOrgana.Controllers
{
    [Route("[controller]")]
    public class TerapijaController : BaseController<Models.Model.Terapija, BaseSearchObject>
    {
        public TerapijaController(ILogger<BaseController<Models.Model.Terapija, BaseSearchObject>> logger, ITerapijaService service) : base(logger, service)
        {
        }
    }
}
