using DoniranjeOrgana.Models.Request.SearchObject;
using DoniranjeOrgana.Services.Service;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace DoniranjeOrgana.Controllers
{
    [Route("[controller]")]
    public class NalazController : BaseController<Models.Model.Nalaz, PacijentClassesSearchObject>
    {
        public NalazController(ILogger<BaseController<Models.Model.Nalaz, PacijentClassesSearchObject>> logger, INalazService service) : base(logger, service)
        {
        }
    }
}
