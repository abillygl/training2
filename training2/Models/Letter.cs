using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace training2.Models
{
    public class Letter
    {
        public int Id { get; set; }
        public string PatientLastName { get; set; }
        public string PatientFirstName { get; set; }
        public string CriteriaNotMet { get; set; }
        public string PatientNumber {get; set;}
    }
}