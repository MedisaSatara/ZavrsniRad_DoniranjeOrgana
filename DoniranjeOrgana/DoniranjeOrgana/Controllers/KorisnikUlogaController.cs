using DoniranjeOrgana.Models.Request.SearchObject;
using DoniranjeOrgana.Models.Request;
using DoniranjeOrgana.Services.Service;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace DoniranjeOrgana.Controllers
{
    [Route("[controller]")]
    public class KorisnikUlogaController : BaseCRUDController<Models.Model.KorisnikUloga, KorisnikUlogaSearchObject, KorisnikUlogaInsertRequest, KorisnikUlogaUpdateRequest>
    {
        public KorisnikUlogaController(ILogger<BaseController<Models.Model.KorisnikUloga, KorisnikUlogaSearchObject>> logger, IKorisnikUlogaService service) : base(logger, service)
        {

        }
    }
}
