using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http;

namespace training2.Controllers
{
    public class LettersController : ApiController
    {
        private Data.LettersContextDataContext _context = new Data.LettersContextDataContext();
        public List<Models.Letter> Get()
        {
            var letters = from e in _context.LetterCriterias
                          select new Models.Letter
                          {
                              Id = e.LetterId,
                              PatientFirstName = e.PatientsFirstName,
                              PatientLastName = e.PatientsLastName,
                              PatientNumber = e.PatientNbr,
                              CriteriaNotMet = e.CriteriaNoteMet
                          };
            return letters.ToList();
        }

        public void Delete(int id)
        {

            var lettersToDelete = (from e in _context.LetterCriterias
                                   where e.LetterId == id
                                   select e).SingleOrDefault();
            _context.LetterCriterias.DeleteOnSubmit(lettersToDelete);
            _context.SubmitChanges();
        }
    }
}