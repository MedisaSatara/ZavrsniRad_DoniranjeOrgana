using DoniranjeOrgana.Models.Request.SearchObject;
using DoniranjeOrgana.Services.Service;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace DoniranjeOrgana.Controllers
{
    [Route("[controller]")]
    public class UlogaController : BaseController<Models.Model.Uloga, BaseSearchObject>
    {
        public UlogaController(ILogger<BaseController<Models.Model.Uloga, BaseSearchObject>> logger, IUlogaService service) : base(logger, service)
        {
        }
    }
}
