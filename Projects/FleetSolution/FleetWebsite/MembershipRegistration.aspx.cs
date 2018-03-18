using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using FleetLibrary;

public partial class MembershipRegistration : System.Web.UI.Page
{
    FleetDL _fdl;
    
    public MembershipRegistration()
    {
        _fdl = new FleetDL();
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        StateDropDownList.AutoPostBack = true;
        //PrefferedCarDropDownList.AutoPostBack = true;   
            
            //if (!IsPostBack)
            //{
            //    CityDropDownList.Items.Add("Select");
            //    List<State> stateCollection = _fdl.GetState();
            //   StateDropDownList.Items.Add("Select");
            //    foreach (State s in stateCollection)
            //    {
            //        StateDropDownList.Items.Add(s.StateName);
            //        StateDropDownList.DataBind();
            //    }
            //}

            //if (!IsPostBack)
            //{
            //    PrefferedCarDropDownList.Items.Add("Select");
            //    List<String> addOnCollection = _fdl.
            //    foreach (String str in addOnCollection)
            //    {
            //        PrefferedCarDropDownList.Items.Add(str);
            //        PrefferedCarDropDownList.DataBind();
            //    }
            //}
    }

    //protected void StateDropDownList_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    List<City> cityCollection = _fdl.GetCity(StateDropDownList.SelectedValue);
    //    CityDropDownList.Items.Clear();
     
    //    foreach (City c in cityCollection)
    //    {
    //        CityDropDownList.Items.Add(c.CityName);
    //        CityDropDownList.DataBind();
    //    }
    //}
    protected void SubmitButton_Click(object sender, EventArgs e)
    {
        try
        {
            Members m1 = new Members
            {
                FirstName = FirstNameTextBox.Text,
                LastName = LastNameTextBox.Text,
                MemberID = UserNameTextBox.Text,
                Password = PasswordTextBox.Text,
                BirthDate = BirthDateTextBox.Text,
                Address1 = Address1TextBox.Text,
                Address2 = Address2TextBox.Text,
                EmailID = EmailIDTextBox.Text,
                State = StateDropDownList.Text,
                City = CityDropDownList.Text,
                Zip = Convert.ToInt32(ZipTextBox.Text),
                Phone = Convert.ToInt64(HomePhoneTextBox.Text),
                Mobile = Convert.ToInt64(CellTextBox.Text.ToString().Trim()),
                DLicense = DrivingLiscenseTextBox.Text,
                DlIssuedBy = DLIssuedByTextBox.Text,
                DLValidThrough = DLValidThroughTextBox.Text,
                IdpNo = IDPNoTextBox.Text,
                IdpIssuedBy = INIssuedByTextBox.Text,
                InValidThru = INValidThroughTextBox.Text,
                PassportNo = PassportNoTextBox.Text,
                PnIssuedBy = PNIssuedByTextBox.Text,
                PnValidThru = PNValidThroughTextBox.Text,
                PreferredCarType = PrefferedCarDropDownList.Text
            };
            //BookingDetails bookingCustInfo = new BookingDetails();
            //Members mem = new Members();
            bool t = _fdl.AddMemberDetail(m1);
            if (t == true)
            {
                Response.Redirect("ThankYouMember.aspx");
            }
            else
            {
                Response.Write(t);
            }
        }
        catch (Exception e1)
        {
            Response.Write(e1.ToString());
        }
    }
}