using DoniranjeOrgana.Models.Request.SearchObject;
using DoniranjeOrgana.Models.Request;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using DoniranjeOrgana.Services.Service;

namespace DoniranjeOrgana.Controllers
{
    [Route("[controller]")]
    public class PreventivneMjereController : BaseCRUDController<Models.Model.PreventivneMjere, PacijentSearchObject, PreventivneMjereInsertRequest, PreventivneMjereUpdateRequest>
    {
        public PreventivneMjereController(ILogger<BaseController<Models.Model.PreventivneMjere, PacijentSearchObject>> logger, IPreventivneMjereService service) : base(logger, service)
        {
        }

        public override Models.Model.PreventivneMjere Insert([FromBody] PreventivneMjereInsertRequest insert)
        {
            return base.Insert(insert);
        }

    }
}
