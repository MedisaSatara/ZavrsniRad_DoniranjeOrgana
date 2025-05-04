using DoniranjeOrgana.Models.Request.SearchObject;
using DoniranjeOrgana.Models.Request;
using DoniranjeOrgana.Services.Service;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace DoniranjeOrgana.Controllers
{
    [Route("[controller]")]
    public class OsiguranjeController : BaseCRUDController<Models.Model.Osiguranje, PacijentSearchObject, OsiguranjeInsertRequest, OsiguranjeUpdateRequest>
    {
        public OsiguranjeController(ILogger<BaseController<Models.Model.Osiguranje, PacijentSearchObject>> logger, IOsiguranjeService service) : base(logger, service)
        {
        }

        public override Models.Model.Osiguranje Insert([FromBody] OsiguranjeInsertRequest insert)
        {
            return base.Insert(insert);
        }

    }
}
