using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using FleetLibrary;

public partial class AddOn : System.Web.UI.Page
{
    FleetDL _fdl;
    protected void Page_Load(object sender, EventArgs e)
    {
        CarType temp = new CarType();
        BookingDetails bd = Session["BookingDetails"] as BookingDetails;
        bd.CarTypeID= Convert.ToInt32(Request["CarSelectRadio"]);
        _fdl = new FleetDL();
        temp = _fdl.GetCarTypeObject(bd.CarTypeID);
        bd.Daily = temp.Daily;
        bd.Weekly = temp.Weekly;
        bd.Monthly = temp.Monthly;
        Session["BookingDetails"] = bd;
    }

    protected void AddonContinueButton_Click(object sender, EventArgs e)
    {

    }
}