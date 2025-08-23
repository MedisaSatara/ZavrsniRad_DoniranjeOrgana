using DoniranjeOrgana.Models.Request.SearchObject;
using DoniranjeOrgana.Models.Request;
using DoniranjeOrgana.Services.Service;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace DoniranjeOrgana.Controllers
{
    [Route("[controller]")]
    public class DavaociOrganaController : BaseCRUDController<Models.Model.DavaociOrgana, DavaociOrganaSearchObject, DavaociOrganaInsertRequest, DavaociOrganaUpdateRequest>
    {
        public DavaociOrganaController(ILogger<BaseController<Models.Model.DavaociOrgana, DavaociOrganaSearchObject>> logger, IDavaociOrganaService service) : base(logger, service)
        {
        }

        public override Models.Model.DavaociOrgana Insert([FromBody] DavaociOrganaInsertRequest insert)
        {
            return base.Insert(insert);
        }

    }
}
