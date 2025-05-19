using DoniranjeOrgana.Models.Request.SearchObject;
using DoniranjeOrgana.Models.Request;
using DoniranjeOrgana.Services.Service;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace DoniranjeOrgana.Controllers
{
    [Route("[controller]")]
    public class DonorskiFormularController : BaseCRUDController<Models.Model.DonorskiFormular, DonorskiFormularSearchObject, DonorskiFormularInsertRequest, DonorskiFormularUpdateRequest>
    {
        public DonorskiFormularController(ILogger<BaseController<Models.Model.DonorskiFormular, DonorskiFormularSearchObject>> logger, IDonorskiFormularService service) : base(logger, service)
        {
        }

        public override Models.Model.DonorskiFormular Insert([FromBody] DonorskiFormularInsertRequest insert)
        {
            return base.Insert(insert);
        }

    }
}
