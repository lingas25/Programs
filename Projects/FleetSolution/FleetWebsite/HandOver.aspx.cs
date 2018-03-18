using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using FleetLibrary;

public partial class HandOver : System.Web.UI.Page
{
    FleetDL _fdl = new FleetDL();

    protected void Page_Load(object sender, EventArgs e)
    {
         
       int BookingID = Convert.ToInt32(Session["BookingID"]);
       
       BookingDetails bd= _fdl.GetBookingObject(BookingID);
       bd.BookingID = BookingID; 
       PickAtLabel.Text = bd.PickAt;
       CarType ct = _fdl.GetCarTypeObject(bd.CarTypeID);
       VehicleTypeIdLabel.Text = ct.CarType1;
       EstimatedAmtTextBox.Text = bd.EstimatedAmount.ToString();
       FirstNameTextBox.Text = bd.FirstName;
       LastNameTextox.Text = bd.LastName;
       AddressTextBox.Text = bd.Address1;
       Address1TextBox.Text = bd.Address2;
       EmailIDTextBox.Text = bd.EmailId;
       StateTextBox.Text = bd.State;
       CityTextBox.Text = bd.City;
       ZipTextBox.Text = (bd.Zip).ToString();
       HomePhoneTextBox.Text =(bd.Phone).ToString();
       CellTextBox.Text = (bd.Mobile).ToString();
       DrivingLicenseTextBox.Text = bd.DLicenseNo;
       DLIssuedByTextBox.Text = bd.DIssuedBy;
       DLValidThruTextBox.Text = bd.DLicenseValidThrough;
       IDPNoTextBox.Text = bd.IdpNo;
       INIssuedByTextBox.Text = bd.IdpIssuedBy;
       INValidThruTextBox.Text = bd.IdpValidThrough;
       PassportNoTextBox.Text = bd.PassportNo;
       PNIssuedByTextBox.Text = bd.PIssuedBy;
       PNValidThruTextBox.Text = bd.PValidThrough;
       PickUpDateTextBox.Text = bd.PickDate;
       PickUpTimeTextBox.Text = bd.PickTime;
       List<FleetLibrary.AddOn> list = _fdl.GetSelectedAddons(BookingID);
       foreach (FleetLibrary.AddOn item in list)
       {
           AddOnsLabel.Text += item.AddonID.ToString() + ",";
       }

       List<string> stateCollection = _fdl.GetCarNo(bd.CarTypeID, Session["HubCode"].ToString());
       foreach (string item in stateCollection)
       {
           CarNoDropDownList.Items.Add(item.ToString());
           CarNoDropDownList.DataBind();
       }
       PickAtLabel.Text = Session["HubCode"].ToString();
       PickUpDateTextBox.Text = DateTime.Now.ToShortDateString();
       PickUpTimeTextBox.Text = DateTime.Now.ToShortTimeString();
    }

    protected void AlottedCarButton1_Click(object sender, EventArgs e)
    {
        int BookingID = Convert.ToInt32(Session["BookingID"]);
        BookingDetails bd = _fdl.GetBookingObject(BookingID);
        Bill b = new Bill();
        b.BillId = BookingID;
        b.FuelStatus = Convert.ToDecimal(FuelCapacityDropDownList.SelectedValue);
        b.CarNo = CarNoDropDownList.SelectedValue;
        b.Daily = bd.Daily;
        b.Weekly = bd.Weekly;
        b.Monthly = bd.Monthly;
        b.MemberID = null;
        b.BookingDate = bd.BookingDate;
        b.PickAt = PickAtLabel.Text;
        b.CarTypeID = _fdl.GetCarTypeID(VehicleTypeIdLabel.Text);
        b.EstimatedAmount = Convert.ToInt32(EstimatedAmtTextBox.Text);
        b.FirstName = FirstNameTextBox.Text;
        b.LastName = LastNameTextox.Text;
        b.Address1 = AddressTextBox.Text;
        b.Address2 = Address1TextBox.Text;
        b.EmailId = EmailIDTextBox.Text;
        b.State = StateTextBox.Text;
        b.City = CityTextBox.Text;
        b.Zip = Convert.ToInt32(ZipTextBox.Text.ToString());
        b.Phone = Convert.ToInt64(HomePhoneTextBox.Text);
        b.Mobile = Convert.ToInt64(CellTextBox.Text);
        b.DLicenseNo = DrivingLicenseTextBox.Text;
        b.DIssuedBy = DLIssuedByTextBox.Text;
        b.DLicenseValidThrough = DLValidThruTextBox.Text;
        b.IdpNo = IDPNoTextBox.Text;
        b.IdpIssuedBy = INIssuedByTextBox.Text;
        b.IdpValidThrough = INValidThruTextBox.Text;
        b.PassportNo = PassportNoTextBox.Text;
        b.PIssuedBy = PNIssuedByTextBox.Text;
        b.PValidThrough = PNValidThruTextBox.Text;
        b.PickDate = PickUpDateTextBox.Text;
        b.PickTime = PickUpTimeTextBox.Text;
        b.BirthDate = bd.BirthDate;
        _fdl = new FleetDL();
        Label1.Text = _fdl.AddBillDetails(b).ToString();
    }
}