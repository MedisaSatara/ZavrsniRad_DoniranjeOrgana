using AutoMapper;
using DoniranjeOrgana.Models.Request.SearchObject;
using DoniranjeOrgana.Models.Request;
using DoniranjeOrgana.Services.Database;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;
using DoniranjeOrgana.Models.Model;

namespace DoniranjeOrgana.Services.Service
{
    public class DonorskiFormularService : BaseCRUDService<Models.Model.DonorskiFormular, Database.DonorskiFormula, DonorskiFormularSearchObject, DonorskiFormularInsertRequest, DonorskiFormularUpdateRequest>, IDonorskiFormularService
    {
        public DonorskiFormularService(DoniranjeOrganaContext context, IMapper mapper)
        : base(context, mapper)
        {
        }

        public override IQueryable<Database.DonorskiFormula> AddFilter(IQueryable<Database.DonorskiFormula> query, DonorskiFormularSearchObject? search = null)
        {
            var filteredQuery = base.AddFilter(query, search);

            if (!string.IsNullOrWhiteSpace(search?.ImeKorisnika))
            {
                filteredQuery = filteredQuery.Where(x => x.Donori.Korisnik.Ime.Contains(search.ImeKorisnika.ToLower()));
            }
            return filteredQuery;
        }



    }
}
