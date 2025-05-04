using DoniranjeOrgana.Models.Request.SearchObject;
using DoniranjeOrgana.Services.Service;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace DoniranjeOrgana.Controllers
{
    [Route("[controller]")]
    public class OboljenjeController : BaseController<Models.Model.Oboljenje, PacijentClassesSearchObject>
    {
        public OboljenjeController(ILogger<BaseController<Models.Model.Oboljenje, PacijentClassesSearchObject>> logger, IOboljenjeService service) : base(logger, service)
        {
        }
    }
}
