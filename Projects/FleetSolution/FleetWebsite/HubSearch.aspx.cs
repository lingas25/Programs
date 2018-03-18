using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using FleetLibrary;

public partial class HubSearch : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    protected void HubSearchCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx");
    }
}