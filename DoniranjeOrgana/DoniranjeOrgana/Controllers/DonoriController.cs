using DoniranjeOrgana.Models.Request.SearchObject;
using DoniranjeOrgana.Models.Request;
using DoniranjeOrgana.Services.Service;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace DoniranjeOrgana.Controllers
{
    [Route("[controller]")]
    public class DonoriController : BaseCRUDController<Models.Model.Donori, DonoriSearchObject, DonoriInsertRequest, DonoriUpdateRequest>
    {
        public DonoriController(ILogger<BaseController<Models.Model.Donori, DonoriSearchObject>> logger, IDonoriService service) : base(logger, service)
        {
        }
    }
}
