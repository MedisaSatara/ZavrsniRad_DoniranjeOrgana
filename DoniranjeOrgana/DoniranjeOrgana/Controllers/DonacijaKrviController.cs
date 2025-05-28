using DoniranjeOrgana.Models.Request.SearchObject;
using DoniranjeOrgana.Models.Request;
using DoniranjeOrgana.Services.Service;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.Text;
using DoniranjeOrgana.Models.Model;
using DoniranjeOrgana.Services.RabbitMQ;

namespace DoniranjeOrgana.Controllers
{
    [Route("[controller]")]
    public class DonacijaKrviController : BaseCRUDController<Models.Model.DonacijaKrvi, DonacijaKrviSeacrhObject, DonacijaKrviInsertRequest, DonacijaKrviUpdateRequest>
    {
        private readonly IMailProducer _mailProducer;
        private readonly IDonacijiKrviService _service;
        private readonly IEmailService _emailService;

        public DonacijaKrviController(IMailProducer mailProducer, IEmailService emailService, ILogger<BaseController<Models.Model.DonacijaKrvi, DonacijaKrviSeacrhObject>> logger, IDonacijiKrviService service) : base(logger, service)
        {
            _mailProducer = mailProducer;
            _service = service;
            _emailService = emailService;
        }


        public override DonacijaKrvi Insert([FromBody] DonacijaKrviInsertRequest insert)
        {
            return base.Insert(insert);
        }
        [AllowAnonymous]
        [HttpPost("posaljiMail")]
        public async Task<IActionResult> PosaljiMailDonorima([FromBody] string krvnaGrupa)
        {
            if (string.IsNullOrWhiteSpace(krvnaGrupa))
                return BadRequest("Krvna grupa ne može biti prazna.");
            var donori = await _service.GetDonoriSaKrvnomGrupomAsync(krvnaGrupa); 

            string subject = "Poziv za donaciju krvi";
            string body = $"Poštovani, potrebna je krvna grupa {krvnaGrupa}. Molimo vas da se odazovete.";

            foreach (var donor in donori)
            {
                if (!string.IsNullOrEmpty(donor.Korisnik.Email))
                {
                    try
                    {
                        await _emailService.SendEmailAsync(donor.Korisnik.Email, subject, body);
                    }
                    catch (Exception ex)
                    {
                    }
                }
            }

            return Ok($"Email poslat donorima sa krvnom grupom {krvnaGrupa}");
        }
    }
}