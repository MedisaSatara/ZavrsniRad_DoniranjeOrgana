using DoniranjeOrgana.Models.Request;
using DoniranjeOrgana.Models.Request.SearchObject;
using DoniranjeOrgana.Services.Service;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace DoniranjeOrgana.Controllers
{
    [Route("[controller]")]
    public class SpecijalizacijaController : BaseCRUDController<Models.Model.Specijalizacija, BaseSearchObject, SpecijalizacijaInsertRequest, SpecijalizacijaUpdateRequest>
    {
        public SpecijalizacijaController(ILogger<BaseController<Models.Model.Specijalizacija, BaseSearchObject>> logger, ISpecijalizacijaService service) : base(logger, service)
        {
        }
    }
}
