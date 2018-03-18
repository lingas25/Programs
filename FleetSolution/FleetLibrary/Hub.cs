using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FleetLibrary
{
    public class Hub
    {
        string _hubCode;
        string _name;
        string _address;
        long _phone;
        string _sun;
        string _monFri;
        string _sat;
        string _city;

        public string HubCode
        {
            get { return _hubCode; }
            set { _hubCode = value; }
        }
        

        public string Name
        {
            get { return _name; }
            set { _name = value; }
        }
        

        public string Address
        {
            get { return _address; }
            set { _address = value; }
        }
       

        public long Phone
        {
            get { return _phone; }
            set { _phone = value; }
        }
        

        public string Sun
        {
            get { return _sun; }
            set { _sun = value; }
        }
        

        public string MonFri
        {
            get { return _monFri; }
            set { _monFri = value; }
        }
       

        public string Sat
        {
            get { return _sat; }
            set { _sat = value; }
        }
       

        public string City
        {
            get { return _city; }
            set { _city = value; }
        }

    }
}