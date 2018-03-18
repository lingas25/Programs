using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace FleetLibrary
{
   public class State
    {
        int _stateID;
        string _stateName;

        public int StateID
        {
            get { return _stateID; }
            set { _stateID = value; }
        }

        public string StateName
        {
            get { return _stateName; }
            set { _stateName = value; }
        }


    }
}
