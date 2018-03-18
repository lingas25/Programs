using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using FleetLibrary;

public partial class _Default : System.Web.UI.Page
{
    FleetDL _fdl;
   
    #region Constructor
    public _Default()
    {
        _fdl = new FleetDL();
    } 
    #endregion

    #region CheckBox Change Event
    protected void DifferentLocCheckBox_CheckedChanged(object sender, EventArgs e)
    {
        if (DifferentLocCheckBox.Checked)
        {
            ReturnPanel.Visible = true;
        }
        else
        {
            ReturnPanel.Visible = false;
        }
    } 
    #endregion

    protected void Page_Load(object sender, EventArgs e)
    {
        #region AirportRelated
        if (Request["AirportCode"] != null && string.IsNullOrEmpty(PickUpHubCodeTextBox.Text))
        {
            PickUpHubCodeTextBox.Text = Request["AirportCode"];
        }
        if (Session["FromAirportCode"] != null)
        {
            PickUpHubCodeTextBox.Text = Session["FromAirportCode"].ToString();
        }
        if (Session["Checked"] != null)
        {
            ReturnPanel.Visible = true;
            if (Request["AirportCode"] != null)
            {
                ReturnHubCodeTextBox.Text = Request["AirportCode"];
            }
            DifferentLocCheckBox.Checked = true;

        }
        Session["Checked"] = null;
        #endregion

        #region HoursMinutesComboPopulate
        for (int i = 1; i <= 12; i++)
        {
            RentalHoursDropDownList.Items.Add(i.ToString());
            ReturnHoursDropDownList.Items.Add(i.ToString());
        }
        RentalMinutesDropDownList.Items.Add("00");
        ReturnMinutesDropDownList.Items.Add("00");
        for (int i = 00; i < 60; i = i + 15)
        {
            RentalMinutesDropDownList.Items.Add(i.ToString());
            ReturnMinutesDropDownList.Items.Add(i.ToString());
        }
        #endregion


        #region State Populate
        if (!IsPostBack)
        {
            PickUpCityDropDownList.Items.Add("Select");
            ReturnLocCityDropDownList.Items.Add("Select");
            List<State> stateCollection = _fdl.GetState();
            PickUpStateDropDownList.Items.Add("Select");
            ReturnLocStateDropDownList.Items.Add("Select");
            foreach (State s in stateCollection)
            {
                PickUpStateDropDownList.Items.Add(s.StateName);
                PickUpStateDropDownList.DataBind();
                ReturnLocStateDropDownList.Items.Add(s.StateName);
                ReturnLocStateDropDownList.DataBind();
            }
        }
        #endregion

        if (Request["rd"] != null)
            PickUpHubCodeTextBox.Text = Request["rd"];
        if (Session["RentalDate"] != null)
            RentalDateTimeTextBox.Text = Session["RentalDate"].ToString();
        if (Session["ReturnDate"] != null)
            ReturnDateTimeTextBox.Text = Session["ReturnDate"].ToString();
    }

    protected void PickUpFindAirportButton_Click(object sender, EventArgs e)
    {
        Session["RentalDate"] = RentalDateTimeTextBox.Text;
        Session["ReturnDate"] = ReturnDateTimeTextBox.Text;
        Response.Redirect("AirportSearch.aspx");
    }

    protected void ReturnFindAirportButton_Click(object sender, EventArgs e)
    {
        Session["RentalDate"] = RentalDateTimeTextBox.Text;
        Session["ReturnDate"] = ReturnDateTimeTextBox.Text;
        Session["FromAirportCode"] = PickUpHubCodeTextBox.Text.ToString();
        Session["Checked"] = true;
        Response.Redirect("AirportSearch.aspx");
    }

    protected void PickUpStateDropDownList_SelectedIndexChanged(object sender, EventArgs e)
    {
        List<City> cityCollection = _fdl.GetCity(PickUpStateDropDownList.SelectedValue);
        PickUpCityDropDownList.Items.Clear();

        foreach (City c in cityCollection)
        {
            PickUpCityDropDownList.Items.Add(c.CityName);
            PickUpCityDropDownList.DataBind();
        }

    }

    protected void ReturnLocStateDropDownList_SelectedIndexChanged(object sender, EventArgs e)
    {
        List<City> cityCollection = _fdl.GetCity(ReturnLocStateDropDownList.SelectedValue);
        ReturnLocCityDropDownList.Items.Clear();

        foreach (City c in cityCollection)
        {
            ReturnLocCityDropDownList.Items.Add(c.CityName);
            ReturnLocCityDropDownList.DataBind();
        }
    }

    protected void PickupSearchButton_Click(object sender, EventArgs e)
    {
        Session["RentalDate"] = RentalDateTimeTextBox.Text;
        Session["ReturnDate"] = ReturnDateTimeTextBox.Text;
        string city = PickUpCityDropDownList.SelectedValue;
        Response.Redirect("HubSearch.aspx?city="+city);
    }

    protected void HomeContinueBookingButton_Click(object sender, EventArgs e)
    {
        string rentalTime, returnTime;
        #region TimeStrings Creation
        if (RentalAMRadioButton.Checked)
            rentalTime = RentalHoursDropDownList.SelectedValue + ":" + RentalMinutesDropDownList.SelectedValue + " " + RentalAMRadioButton.Text;
        else
            rentalTime = RentalHoursDropDownList.SelectedValue + ":" + RentalMinutesDropDownList.SelectedValue + " " + RentalPMRadioButton.Text;

        if (ReturnAMRadioButton.Checked)
            returnTime = ReturnHoursDropDownList.SelectedValue + ":" + ReturnMinutesDropDownList.Text + " " + ReturnAMRadioButton.Text;
        else
            returnTime = RentalHoursDropDownList.SelectedValue + ":" + RentalMinutesDropDownList.SelectedValue + " " + RentalPMRadioButton.Text; 
        #endregion

        BookingDetails bd = new BookingDetails { PickDate = RentalDateTimeTextBox.Text, ReturnDate = ReturnDateTimeTextBox.Text, PickTime = rentalTime, ReturnTime = returnTime,PickAt= PickUpHubCodeTextBox.Text};


        if(DifferentLocCheckBox.Checked)
        {
            bd.ReturnAt=ReturnHubCodeTextBox.Text;
        }
        else
        {
           bd.ReturnAt = PickUpHubCodeTextBox.Text; 
        }

        Session["BookingDetails"] = bd;

        Response.Redirect("CarSelect.aspx");
    }

    protected void ReturnSearchButton_Click(object sender, EventArgs e)
    {
        Session["RentalDate"] = RentalDateTimeTextBox.Text;
        Session["ReturnDate"] = ReturnDateTimeTextBox.Text;
        string city = ReturnLocCityDropDownList.SelectedValue;
        Response.Redirect("HubSearch.aspx?city=" + city);
    }
}