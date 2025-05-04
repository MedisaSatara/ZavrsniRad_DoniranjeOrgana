using AutoMapper;
using DoniranjeOrgana.Models.Request.SearchObject;
using DoniranjeOrgana.Models.Request;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;
using DoniranjeOrgana.Services.Database;

namespace DoniranjeOrgana.Services.Service
{
    public class PacijentService : BaseCRUDService<Models.Model.Pacijent, Database.Pacijent, PacijentSearchObject, PacijentInsertRequest, PacijentUpdateRequest>, IPacijentService
    {
        public PacijentService(DoniranjeOrganaContext context, IMapper mapper)
        : base(context, mapper)
        {
        }

        public override IQueryable<Database.Pacijent> AddInclude(IQueryable<Database.Pacijent> query, PacijentSearchObject? search = null)
        {
            if (search?.isPreventivneMjereIncluded == true)
            {
                query = query.Include("PreventivneMjeres");
            }
            if (search?.isOsiguranjeInclude == true)
            {
                query = query.Include("PacijentOsiguranjes.Osiguranje");
            }
            return base.AddInclude(query, search);
        }
        public override IQueryable<Database.Pacijent> AddFilter(IQueryable<Database.Pacijent> query, PacijentSearchObject? search = null)
        {
            var filteredQuery = base.AddFilter(query, search);

            if (!string.IsNullOrWhiteSpace(search?.ImePacijenta))
            {
                filteredQuery = filteredQuery.Where(x => x.Ime.Contains(search.ImePacijenta.ToLower()));
            }
            if (!string.IsNullOrWhiteSpace(search?.PrezimePacijenta))
            {
                filteredQuery = filteredQuery.Where(x => x.Prezime.Contains(search.PrezimePacijenta.ToLower()));
            }
            if (!string.IsNullOrWhiteSpace(search?.BrojKartona))
            {
                filteredQuery = filteredQuery.Where(x => x.BrojKartona.Contains(search.BrojKartona.ToLower()));
            }
            if (search?.isPreventivneMjereIncluded == true)
            {
                query = query.Include(x => x.PreventivneMjeres);
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
