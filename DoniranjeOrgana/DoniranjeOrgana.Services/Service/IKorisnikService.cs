using DoniranjeOrgana.Models.Request;
using DoniranjeOrgana.Models.Request.SearchObject;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DoniranjeOrgana.Services.Service
{
    public interface IKorisnikService : ICRUDService<Models.Model.Korisnik, KorisnikSearchObject, KorisnikInsertRequest, KorisnikUpdateRequest>
    {
        Models.Model.Korisnik Login(string username, string password);
        bool ProvjeriLozinku(int korisnikId, string staraLozinka);
        bool PromeniLozinku(int korisnikId, string staraLozinka, string novaLozinka);
        Task DeleteKorisnikAsync(int korisnikId);

    }
}
