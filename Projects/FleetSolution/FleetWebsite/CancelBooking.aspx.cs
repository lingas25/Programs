using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using FleetLibrary;
public partial class CancelBooking : System.Web.UI.Page
{
    FleetDL _fdl;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Session["UserType"].ToString().Equals("S"))
            Response.Redirect("Default.aspx");
        _fdl = new FleetDL();
    }
    
    protected void ResetButton_Click(object sender, EventArgs e)
    {
        BookingNoTextBox.Text = "";
        ErrorMessageLabel.Text = "";
    }
   
    protected void CancelBookingButton_Click(object sender, EventArgs e)
    {
        bool a = _fdl.CancelBookingData(BookingNoTextBox.Text);
        if (a == true)
        {
            ErrorMessageLabel.Text = "successfully deleted";
        //    Response.Redirect("");

        }
        else ErrorMessageLabel.Text = "Invalid Booking no";
    }
}