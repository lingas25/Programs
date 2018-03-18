using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FleetLibrary
{
    public class Airports
    {
        string _hubCode;
        string _name;

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
    }
}