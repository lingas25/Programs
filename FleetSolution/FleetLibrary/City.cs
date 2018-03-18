using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace FleetLibrary
{
    public class City
    {
        int _cityID;
        int _stateID;
        string _cityName;
        public int CityID
        {
            get { return _cityID; }
            set { _cityID = value; }
        }
        
        public int StateID
        {
            get { return _stateID; }
            set { _stateID = value; }
        }

        public string CityName
        {
            get { return _cityName; }
            set { _cityName = value; }
        }

    }
}
