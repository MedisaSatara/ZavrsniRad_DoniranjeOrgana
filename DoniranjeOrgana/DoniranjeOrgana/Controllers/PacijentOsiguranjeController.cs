using DoniranjeOrgana.Models.Request.SearchObject;
using DoniranjeOrgana.Models.Request;
using DoniranjeOrgana.Services.Service;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace DoniranjeOrgana.Controllers
{
    [Route("[controller]")]
    public class PacijentOsiguranjeController : BaseCRUDController<Models.Model.PacijentOsiguranje, PacijentSearchObject, PacijentOsiguranjeInsertRequest, PacijentOsiguranjeUpdateRequest>
    {
        public PacijentOsiguranjeController(ILogger<BaseController<Models.Model.PacijentOsiguranje, PacijentSearchObject>> logger, IPacijentOsiguranjeService service) : base(logger, service)
        {
        }

        public override Models.Model.PacijentOsiguranje Insert([FromBody] PacijentOsiguranjeInsertRequest insert)
        {
            return base.Insert(insert);
        }

    }
}
