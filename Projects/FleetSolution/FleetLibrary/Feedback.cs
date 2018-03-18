using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FleetLibrary
{
    public class Feedback
    {

        int _feedbackID;
        string _name;
        string _email;
        string _feedback;

        public string Feedback1
        {
            get { return _feedback; }
            set { _feedback = value; }
        }

        public int FeedbackID
        {
            get { return _feedbackID; }
            set { _feedbackID = value; }
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
        

      
    }
}