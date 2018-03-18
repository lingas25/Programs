using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FleetLibrary;

public partial class HandOverCheckBooking : System.Web.UI.Page
{
    FleetDL _fdl = new FleetDL();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Session["UserType"].ToString().Equals("S"))
            Response.Redirect("Default.aspx");
    }
    protected void CheckButton_Click(object sender, EventArgs e)
    {

        bool a = _fdl.CheckBookingData(BookingNoTextBox.Text);
        if (a == true)
        {
            Session["BookingID"] = BookingNoTextBox.Text;
            Response.Redirect("HandOver.aspx");
        }
        else ErrorMessageLabel.Text = "Invalid Booking no";


    }
    protected void ResetButton_Click(object sender, EventArgs e)
    {
        BookingNoTextBox.Text = "";
        ErrorMessageLabel.Text = "";
    }
}