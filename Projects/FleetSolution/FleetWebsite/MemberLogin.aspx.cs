using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using FleetLibrary;
using System.Data.SqlClient;
public partial class MemberLogin : System.Web.UI.Page
{
    FleetDL _fdl;
    public MemberLogin()
    {
        _fdl=new FleetDL();
    }

    protected void Page_Load(object sender, EventArgs e)
    {        
    }

    protected void LoginButton_Click(object sender, EventArgs e)
    {
        SqlConnection _con = new SqlConnection("Data Source=.; Initial Catalog=Fleet; Integrated Security=true;");
        _con.Open();
        SqlCommand _cmd = new SqlCommand("select count(*) from Members where MemberID='" + MembershipNoTextBox.Text + "'and Password='" + PasswordTextBox.Text + "'", _con);
        int i = Convert.ToInt32(_cmd.ExecuteScalar());
        string MemberID = MembershipNoTextBox.Text;
        if (i == 1)
        {
            Session["MemberInfo"] =_fdl.OnLoginSuccess(MemberID);
            Session["UserType"] = "M";
            Response.Redirect("CustomerInformation.aspx");
            
        }
        else
        {
            MessageLabel.Text = "Invalid MemberShip Number and Password";
        }
    }
}