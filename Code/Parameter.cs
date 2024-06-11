using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BloodDonorPage.Code
{
    public class Parameter
    {
        public int countryId { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string BloodGroup { get; set; }
        public int Age { get; set; }
        public DateTime DateofBirth { get; set; }
        public string Email { get; set; }
        public string Phone { get; set; }
        public string Address { get; set; }
        public string Gender { get; set; }
        public DateTime EntryDate { get; set; }
        public int Country { get; set; }
        public int State { get; set; }
        public int UserID { get; set; }        
        public string AdminEmail { get; set;}
        public string AdminPassword { get; set; }
        public int DonorID {  get; set; }
    }
}