using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;
using FleetLibrary;

public partial class AirportSearch : System.Web.UI.Page
{
    FleetDL _fdl;  
    public AirportSearch ()
	{
        _fdl = new FleetDL();
	}

    protected void Page_Load(object sender, EventArgs e)
    {
              
        if (!IsPostBack)
        {
            List < State > stateCollection = _fdl.GetState();
            StateDropDownList.Items.Add("Select");
            foreach (State s in stateCollection)
            {
                StateDropDownList.Items.Add(s.StateName);
                StateDropDownList.DataBind();
            }
        }     
    }

    protected void StateDropDownList_SelectedIndexChanged(object sender, EventArgs e)
    {
        List<City> cityCollection = _fdl.GetCity(StateDropDownList.SelectedValue);
        CityDropDownList.Items.Clear();

        foreach (City c in cityCollection)
        {
            CityDropDownList.Items.Add(c.CityName);
            CityDropDownList.DataBind();
        }
    }

    protected void CityDropDownList_SelectedIndexChanged(object sender, EventArgs e)
    {
        //AirportDropDownList.Items.Clear();
        //AirportDropDownList.Items.Add("select");
       DataTable dt = _fdl.GetAirport(CityDropDownList.SelectedValue);
        Response.Write(dt.ToString());
        AirportDropDownList.DataSource = dt;
        AirportDropDownList.DataTextField = "Name";
        AirportDropDownList.DataValueField = "HubCode";
        AirportDropDownList.DataBind();
    }    

    protected void SubmitButton_Click(object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx?AirportCode=" + AirportDropDownList.SelectedValue+"&AirportName="+AirportDropDownList.SelectedItem.Text);
    }    
}