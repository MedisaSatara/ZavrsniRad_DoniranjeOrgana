using DoniranjeOrgana.Models.Model;
using DoniranjeOrgana.Models.Request;
using DoniranjeOrgana.Models.Request.SearchObject;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DoniranjeOrgana.Services.Service
{
    public interface IDonacijiKrviService : ICRUDService<Models.Model.DonacijaKrvi, DonacijaKrviSeacrhObject, DonacijaKrviInsertRequest, DonacijaKrviUpdateRequest>
    {
        // Task<string> PosaljiMailDonorima(string krvnaGrupa);
       // Task PosaljiMailDonorima(string predmet, string sadrzaj);
        Task<List<Donori>> GetDonoriSaKrvnomGrupomAsync(string krvnaGrupa);

    }
}
