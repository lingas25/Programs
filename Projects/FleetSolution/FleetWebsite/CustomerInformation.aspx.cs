using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using FleetLibrary;

public partial class MemberShipRegistration : System.Web.UI.Page
{
        SqlConnection _fleetCon;
        SqlCommand _fleetCMD;
        List<AddOn> AddOns;
        FleetDL _fdl;
            
    protected void Page_Load(object sender, EventArgs e)
    {
        _fdl = new FleetDL();
        int amount = 0, cnt = 0;
        int[] addOnPrice = new Int32[100];

        if (!Session["UserType"].ToString().Equals("G"))
            LoginPanel.Visible = false;

        #region If not Post Back
        if (!IsPostBack)
        {
            CityDropDownList.Items.Add("select");
            StateDropDownList.AutoPostBack = true;
            _fdl = new FleetDL();
            List<State> stateCollection = _fdl.GetState();

            foreach (State s in stateCollection)
            {
                StateDropDownList.Items.Add(s.StateName);
                StateDropDownList.DataBind();
            }
        } 
        #endregion


        #region if (Session["MemberInfo"] != null)
        if (Session["MemberInfo"] != null)
        {
            Members bd = Session["MemberInfo"] as Members;
            FirstNameTextBox.Text = bd.FirstName;
            LastNameTextBox.Text = bd.LastName;
            Address1TextBox.Text = bd.Address1;
            Address2TextBox.Text = bd.Address2;
            EmailIdTextBox.Text = bd.EmailID;
            StateDropDownList.SelectedValue = bd.State;
            _fdl = new FleetDL();
            List<City> cityCollection = _fdl.GetCity(StateDropDownList.SelectedValue);
            CityDropDownList.Items.Clear();

            foreach (City c in cityCollection)
            {
                CityDropDownList.Items.Add(c.CityName);
                CityDropDownList.DataBind();
            }
            CityDropDownList.SelectedValue = bd.City;
            ZipTextBox.Text = (bd.Zip).ToString();
            HomePhoneTextBox.Text = (bd.Phone).ToString();
            MobileNumberTextBox.Text = (bd.Mobile).ToString();
            DLicenseNoTextBox.Text = bd.DLicense;
            DIssuedByTextBox.Text = bd.DlIssuedBy;
            DValidThroughTextBox.Text = bd.DLValidThrough;
            IdpNumberTextBox.Text = bd.IdpNo;
            IdpIssuedByTextBox.Text = bd.IdpIssuedBy;
            IdpValidThroughTextBox.Text = bd.InValidThru;
            PassportNumberTextBox.Text = bd.PassportNo;
            PIssuedByTextBox.Text = bd.PnIssuedBy;
            PValidThroughTextBox.Text = bd.PnValidThru;
            DateOfBirthTextBox.Text = bd.BirthDate;
        } 
        #endregion

        #region Populating Booking details on left
        BookingDetails bdObj = Session["BookingDetails"] as BookingDetails;
        Hub h = _fdl.GetHubsIDWise(bdObj.PickAt);
        PickUpAtLabel.Text = h.Address;
        h = _fdl.GetHubsIDWise(bdObj.ReturnAt);
        ReturnAtLabel.Text = h.Address;
        PickUpLabel.Text = bdObj.PickDate;
        PickTimeLabel.Text = bdObj.PickTime;
        ReturnLabel.Text = bdObj.ReturnDate;
        ReturnTimeLabel.Text = bdObj.ReturnTime;
        CarType ct = _fdl.GetCarTypeObject(bdObj.CarTypeID);
        VehicleSelectedLabel.Text = ct.CarType1;
        Session["CarTypeObject"]=ct;   //car type object stored in session
        #endregion

        #region Addons Selected
        AddOns = new List<AddOn>();

        if (Session["AddOnsSelected"] != null)
        {
            AddOns = (List<AddOn>)Session["AddOnsSelected"];
            foreach (AddOn a in AddOns)
            {
                AddOnLabel.Text = AddOnLabel.Text + " " + a.Name;
                if (a.Name.Equals("Child Seat"))
                {
                    addOnPrice[cnt] = a.PricePerDay;
                    cnt++;                    
                    ChildSeatCountLabel.Text = Session["ChildSeat"].ToString();
                }
            }
        }

        if (Request["Addon"] != null)
        {
            string addon = Request["Addon"];
            string[] s1 = addon.Split(',');

            foreach (string item in s1)
            {
                AddOn ao = _fdl.GetAddOnObject(Convert.ToInt32(item[0].ToString()));
                AddOnLabel.Text = AddOnLabel.Text + " " + ao.Name;
                if (ao.Name.Equals("Child Seat"))
                {
                    addOnPrice[cnt] = ao.PricePerDay;
                    cnt++;    
                    ChildSeatCountLabel.Text = Request["AddOnDropDownList"].ToString();
                    Session["ChildSeat"] = Request["AddOnDropDownList"];
                }
                AddOns.Add(ao);
            }
            Session["AddOnsSelected"] = AddOns;
        }
        #endregion

        #region Estimated Amount Calculation
            int dec = 0;
            DateTime d1 = DateTime.Parse(PickUpLabel.Text);
            DateTime d2 = DateTime.Parse(ReturnLabel.Text);
            int days = Convert.ToInt32((d2 - d1).Days);
            if (days >= 30)
            {
                dec = days % 30;
                amount = dec * bdObj.Monthly;
                days = days - (dec * 30);
                foreach (AddOn item in AddOns)
                {
                    amount += dec * item.PricePerDay;
                }
            }
            if (days >= 7)
            {
                dec = days % 7;
                amount = dec * bdObj.Weekly;
                days = days - (dec * 7);
                foreach (AddOn item in AddOns)
                {
                    amount += dec * item.PricePerDay;
                }
            }
            amount += days * bdObj.Daily;
            foreach (AddOn item in AddOns)
            {
                amount += days * item.PricePerDay;
            }

        EstimatedAmountTextBox.Text = amount.ToString(); 
        #endregion
    }        
    
    protected void StateDropDownList_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            _fdl = new FleetDL();
            List<City> cityCollection = _fdl.GetCity(StateDropDownList.SelectedValue);
            CityDropDownList.Items.Clear();

            foreach (City c in cityCollection)
            {
                CityDropDownList.Items.Add(c.CityName);
                CityDropDownList.DataBind();
            }
        }
        catch (Exception ex1)
        {

            Response.Write(ex1.ToString());
        }
    }

    protected void ContinueBookingButton_Click(object sender, EventArgs e)
    {
        int flag = 0, cnt;
        try
        {
            BookingDetails bdObj = Session["BookingDetails"] as BookingDetails;
            
            BookingDetails bookingCustInfo = new BookingDetails
            {
                PickDate = PickUpLabel.Text,
                PickTime = PickTimeLabel.Text,
                PickAt = PickUpAtLabel.Text,
                ReturnDate = ReturnLabel.Text,
                ReturnTime = ReturnTimeLabel.Text,
                ReturnAt = ReturnAtLabel.Text,
                CarTypeID = bdObj.CarTypeID,
                EstimatedAmount = Convert.ToInt32(EstimatedAmountTextBox.Text.ToString()),
                Daily = bdObj.Daily,
                Weekly = bdObj.Weekly,
                Monthly = bdObj.Monthly,
                BookingDate = DateTime.Now.ToShortDateString(),
                FirstName = FirstNameTextBox.Text,
                LastName = LastNameTextBox.Text,
                Address1 = Address1TextBox.Text,
                Address2 = Address2TextBox.Text,
                EmailId = EmailIdTextBox.Text,
                State = StateDropDownList.Text,
                City = CityDropDownList.Text,
                Zip = Convert.ToInt32(ZipTextBox.Text),
                Phone = Convert.ToInt64(HomePhoneTextBox.Text),
                Mobile = Convert.ToInt64(MobileNumberTextBox.Text.ToString().Trim()),
                DLicenseNo = DLicenseNoTextBox.Text,
                DIssuedBy = DIssuedByTextBox.Text,
                DLicenseValidThrough = DValidThroughTextBox.Text,
                IdpNo = IdpNumberTextBox.Text,
                IdpIssuedBy = IdpIssuedByTextBox.Text,
                IdpValidThrough = IdpValidThroughTextBox.Text,
                PassportNo = PassportNumberTextBox.Text,
                PIssuedBy = PIssuedByTextBox.Text,
                PValidThrough = PValidThroughTextBox.Text,
                BirthDate = DateOfBirthTextBox.Text
            };
            //BookingDetails sessionBooking = Session["BookingDetails"] as BookingDetails;
            Members bd = null;
            if (Session["MemberInfo"] != null)
            {
                bd = Session["MemberInfo"] as Members;
                bookingCustInfo.MemberID = bd.MemberID.ToString();
            }
            _fdl.AddBookingDetails(bookingCustInfo);
            //Label1.Text = _fdl.AddBookingDetails(bookingCustInfo, sessionBooking).ToString();
            List<AddOn> selectedAddon = new List<AddOn>();
            AddOn child = null;
            foreach (AddOn a in AddOns)
            {
                selectedAddon.Add(a);
                if (a.Name.Equals("Child Seat"))
                {
                    flag = 1;
                    child = a;
                }
            }
            if (flag == 1)
            {
                cnt = Convert.ToInt32(Session["ChildSeat"].ToString());
                for (int i = 0; i < cnt - 1; i++)
                    selectedAddon.Add(child);
            }
            _fdl.AddSelectedAddons(selectedAddon).ToString();
                bookingCustInfo = null;
            }
            catch (Exception e1)
            {
                Response.Write(e1.ToString());
            }
        //Session["BookingDetails"] = bookingCustInfo;
        Response.Redirect("ConfirmedBooking.aspx");
           }

    protected void CancelButton_Click(object sender, EventArgs e)
    {

    }    
}