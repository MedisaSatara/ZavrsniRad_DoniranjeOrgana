using AutoMapper;
using DoniranjeOrgana.Models.Request;
using DoniranjeOrgana.Models.Request.SearchObject;
using DoniranjeOrgana.Services.Database;
using DoniranjeOrgana.Services.RabbitMQ;
using DoniranjeOrgana.Subscriber;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Text;
using System.Threading.Tasks;

namespace DoniranjeOrgana.Services.Service
{
    public class DonacijaKrviService : BaseCRUDService<Models.Model.DonacijaKrvi, Database.DonacijaKrvi, DonacijaKrviSeacrhObject, DonacijaKrviInsertRequest, DonacijaKrviUpdateRequest>, IDonacijiKrviService
    {
        private readonly IMailProducer _mailProducer;
        private readonly EmailService _emailService;

        public DonacijaKrviService(IMailProducer mailProducer, DoniranjeOrganaContext context, IMapper mapper)
            : base(context, mapper)
        {
            _mailProducer = mailProducer;
        }
        public override void BeforeInsert(DonacijaKrviInsertRequest insert, Database.DonacijaKrvi entity)
        {
            entity.DonorId = insert.DonorId;
            entity.DatumDonacije = insert.DatumDonacije;
            entity.Status = insert.Status;
            entity.Napomena = insert.Napomena;
            entity.Lokacija = insert.Lokacija;
            entity.Kolicina = insert.Kolicina;

            base.BeforeInsert(insert, entity);

           // SendEmailOnTerminInsert(entity.PacijentId, entity.Datum, entity.Vrijeme);
        }

       

        public override IQueryable<Database.DonacijaKrvi> AddFilter(IQueryable<Database.DonacijaKrvi> query, DonacijaKrviSeacrhObject? search = null)
        {
            var filteredQuery = base.AddFilter(query, search);

            if (!string.IsNullOrWhiteSpace(search?.ImeKorisnika))
            {
                filteredQuery = filteredQuery.Where(x => x.Donori.Korisnik.Ime.Contains(search.ImeKorisnika));
            }
            if (!string.IsNullOrWhiteSpace(search?.PrezimeKorisnika))
            {
                filteredQuery = filteredQuery.Where(x => x.Donori.Korisnik.Prezime.Contains(search.PrezimeKorisnika));
            }
            return filteredQuery;
        }

        public async Task<List<Models.Model.Donori>> GetDonoriSaKrvnomGrupomAsync(string krvnaGrupa)
        {
            var entiteti = await _context.Donoris
                .Include(x => x.Korisnik)
                .Where(d => d.KrvnaGrupa == krvnaGrupa)
                .ToListAsync();

            return _mapper.Map<List<Models.Model.Donori>>(entiteti);
        }
    }

}
