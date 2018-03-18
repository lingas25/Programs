using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using FleetLibrary;

public partial class BillSearch : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Session["UserType"].ToString().Equals("S"))
            Response.Redirect("Default.aspx");
        Bill1DetailsView.Visible = false;
        Bill2DetailsView.Visible = false;
        Bill3DetailsView.Visible = false;
    }
    protected void BillIDTextBox_TextChanged(object sender, EventArgs e)
    {

    }
    protected void BillSearchButton_Click(object sender, EventArgs e)
    {
        Bill1DetailsView.Visible = true;
        Bill2DetailsView.Visible = true;
        Bill3DetailsView.Visible = true;
    }
    protected void Bill2DetailsView_PageIndexChanging(object sender, DetailsViewPageEventArgs e)
    {

    }
}