using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Bill : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Session["UserType"].ToString().Equals("S"))
            Response.Redirect("Default.aspx");
        BillIDLabel.Text = Session["BillID"].ToString();
        AmountLabel.Text = Session["Amount"].ToString();
    }
}