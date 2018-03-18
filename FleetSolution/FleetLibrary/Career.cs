using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FleetLibrary
{
    public class Career
    {
        int _careerID;
        string _name;
        string _email;
        int _phone;
        string _positionForJob;
        string _highestQualification;
        string _resume;


        public int CareerID
        {
            get { return _careerID; }
            set { _careerID = value; }
        }
        

        public string Name
        {
            get { return _name; }
            set { _name = value; }
        }
        

        public string Email
        {
            get { return _email; }
            set { _email = value; }
        }
       

        public int Phone
        {
            get { return _phone; }
            set { _phone = value; }
        }
        
        public string PositionForJob
        {
            get { return _positionForJob; }
            set { _positionForJob = value; }
        }
      

        public string HighestQualification
        {
            get { return _highestQualification; }
            set { _highestQualification = value; }
        }
       

        public string Resume
        {
            get { return _resume; }
            set { _resume = value; }
        }
    }
}