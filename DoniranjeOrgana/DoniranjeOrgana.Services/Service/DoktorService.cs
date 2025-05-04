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

namespace DoniranjeOrgana.Services.Service
{
    public class DoktorService : BaseCRUDService<Models.Model.Doktor, Database.Doktor, DoktorSearchObject, DoktorInsertRequest, DoktorUpdateRequest>, IDoktorService
    {
        public DoktorService(DoniranjeOrganaContext context, IMapper mapper)
        : base(context, mapper)
        {
        }

        public override IQueryable<Database.Doktor> AddInclude(IQueryable<Database.Doktor> query, DoktorSearchObject? search = null)
        {
            if (search?.IsOdjelIncluded == true)
            {
                query = query.Include("Odjel");
            }
            return base.AddInclude(query, search);
        }
        public override IQueryable<Database.Doktor> AddFilter(IQueryable<Database.Doktor> query, DoktorSearchObject? search = null)
        {
            var filteredQuery = base.AddFilter(query, search);

            if (!string.IsNullOrWhiteSpace(search?.ImeDoktora))
            {
                filteredQuery = filteredQuery.Where(x => x.Ime.Contains(search.ImeDoktora.ToLower()));
            }
            if (!string.IsNullOrWhiteSpace(search?.PrezimeDoktora))
            {
                filteredQuery = filteredQuery.Where(x => x.Prezime.Contains(search.PrezimeDoktora.ToLower()));
            }
            if (!string.IsNullOrWhiteSpace(search?.NazivOdjela))
            {
                query = query.Where(x => x.Specijalizacija.Naziv == search.NazivOdjela);
            }
            if (search?.SpecijalizacijaId != null && search.SpecijalizacijaId > 0)
            {
                query = query.Where(x => x.SpecijalizacijaId == search.SpecijalizacijaId);
            }



            return filteredQuery;
        }
        public static string GenerateSalt()
        {
            RNGCryptoServiceProvider provider = new RNGCryptoServiceProvider();
            var byteArray = new byte[16];
            provider.GetBytes(byteArray);


            return Convert.ToBase64String(byteArray);
        }
        public static string GenerateHash(string salt, string password)
        {
            byte[] src = Convert.FromBase64String(salt);
            byte[] bytes = Encoding.Unicode.GetBytes(password);
            byte[] dst = new byte[src.Length + bytes.Length];

            System.Buffer.BlockCopy(src, 0, dst, 0, src.Length);
            System.Buffer.BlockCopy(bytes, 0, dst, src.Length, bytes.Length);

            HashAlgorithm algorithm = HashAlgorithm.Create("SHA1");
            byte[] inArray = algorithm.ComputeHash(dst);
            return Convert.ToBase64String(inArray);
        }
    }
}
