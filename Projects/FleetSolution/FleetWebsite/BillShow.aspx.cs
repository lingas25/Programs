using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FleetLibrary;

public partial class BillShow : System.Web.UI.Page
{

    FleetDL _fdl = new FleetDL();
    FleetLibrary.Bill b = new FleetLibrary.Bill(); 
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Session["UserType"].ToString().Equals("S"))
            Response.Redirect("Default.aspx");
        BillPanel.Visible = false;
    }
    protected void SearchButton_Click(object sender, EventArgs e)
    {
        string str = BillIdTextBox.Text;
        b =_fdl.BillIdSearch(str);
        
        if (b!=null)
        {

            ErrorMessageLabel.Text = "ID found";
            BillPanel.Visible = true;
          //  string[] str1=b.PickDate.Split(' ');
            PickUpTextBox.Text = b.PickDate;
            PickUpAtTextBox.Text = b.PickAt;
            ReturnTextBox.Text = Convert.ToString(DateTime.Now.ToShortDateString());
            ReturnAtTextBox.Text = Session["HubCode"].ToString();
            CarNoTextBox.Text = b.CarNo;
            CarTypeIdTextBox.Text = Convert.ToString(b.CarTypeID);
        //   FuelStatusTextBox.Text = Convert.ToString(b.FuelStatus);          
        }
        else
            ErrorMessageLabel.Text = "ID not found";
    }
    protected void DoneButton_Click(object sender, EventArgs e)
    {
        int amount = 0;
        int dec;
        BillPanel.Visible = true;
        DateTime d1 = DateTime.Parse(PickUpTextBox.Text);
        DateTime d2 = DateTime.Parse(ReturnTextBox.Text);
        //Label1.Text = ((d2 - d1).Days).ToString();
        b = _fdl.BillIdSearch(BillIdTextBox.Text.ToString());
        decimal PrevFuelStatus = b.FuelStatus;
        decimal CurrentFuelStatus = Convert.ToDecimal(FuelStatusTextBox.Text);
        decimal FuelPrice = Convert.ToDecimal(FuelPriceTextBox.Text);
        decimal FuelAmount=0;
        if (CurrentFuelStatus < PrevFuelStatus)
            FuelAmount = (PrevFuelStatus - CurrentFuelStatus) * FuelPrice;
        else
            FuelAmount = 0;
        int days = Convert.ToInt32((d2 - d1).Days);
        decimal addonSelectedAmount = _fdl.GetSelectedAddOnAmount(b.BillId);
        if (days >= 30)
        {
            dec = days % 30;
            amount = dec * b.Monthly;
            days = days - (dec * 30);            
        }
        if (days >= 7)
        {
            dec = days % 7;
            amount = dec * b.Weekly;
            days = days - (dec * 7);
        }
        amount += days * b.Daily;
        amount += Convert.ToInt32(addonSelectedAmount);
        b.EstimatedAmount = amount;
        b.FirstName = Session["HubCode"].ToString();
        if (_fdl.UpdateBill(b))
        {
            Session["Amount"] = amount.ToString();
            Session["BillID"] = b.BillId.ToString();
        }
        Response.Redirect("Bill.aspx");
    }
}