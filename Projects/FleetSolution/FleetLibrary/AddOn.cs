using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace FleetLibrary
{
    public class AddOn
    {
        int _addonID;
        string _name;
        int _pricePerDay;


        public int AddonID
        {
            get { return _addonID; }
            set { _addonID = value; }
        }


        public string Name
        {
            get { return _name; }
            set { _name = value; }
        }


        public int PricePerDay
        {
            get { return _pricePerDay; }
            set { _pricePerDay = value; }
        }
    }
}
