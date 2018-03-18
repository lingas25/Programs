using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using FleetLibrary;
using System.Data.SqlClient;

public partial class StaffLogin : System.Web.UI.Page
{
    FleetDL _fdl;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Session["UserType"].ToString().Equals("G"))
        {
            Session["UserType"] = "G";
            Response.Redirect("Default.aspx");
        }
    }

    protected void LoginButton_Click(object sender, EventArgs e)
    {
        _fdl = new FleetDL();
        SqlConnection _con = new SqlConnection("Data Source=.; Initial Catalog=Fleet; Integrated Security=true;");
        _con.Open();
        SqlCommand _cmd = new SqlCommand("select HubCode from stafflogin where UserName='" + MembershipNoTextBox.Text + "'and Password='" + PasswordTextBox.Text + "'", _con);
        SqlDataReader dataReader = _cmd.ExecuteReader();
        if (dataReader.Read())
        {
            Session["HubCode"] = dataReader[0].ToString();
            Session["UserType"] = "S";
            Response.Redirect("Default.aspx");
        }
        else
        {
            MessageLabel.Text = "Invalid MemberShip Number and Password";
        }
    }
}