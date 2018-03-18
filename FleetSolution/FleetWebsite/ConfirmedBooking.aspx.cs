using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using FleetLibrary;

public partial class ConfirmedBooking : System.Web.UI.Page
{
    FleetDL _fdl;

    protected void Page_Load(object sender, EventArgs e)
    {
        _fdl = new FleetDL();
        int id =_fdl.GetBookingID();
        BookingIdLabel.Text = id.ToString();
    }
}