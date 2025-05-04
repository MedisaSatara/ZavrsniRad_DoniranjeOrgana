using DoniranjeOrgana.Models.Request.SearchObject;
using DoniranjeOrgana.Models.Request;
using DoniranjeOrgana.Services.Service;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace DoniranjeOrgana.Controllers
{
    [Route("[controller]")]
    public class DoktorController : BaseCRUDController<Models.Model.Doktor, DoktorSearchObject, DoktorInsertRequest, DoktorUpdateRequest>
    {
        public DoktorController(ILogger<BaseController<Models.Model.Doktor, DoktorSearchObject>> logger, IDoktorService service) : base(logger, service)
        {
        }

        public override Models.Model.Doktor Insert([FromBody] DoktorInsertRequest insert)
        {
            return base.Insert(insert);
        }

    }
}
