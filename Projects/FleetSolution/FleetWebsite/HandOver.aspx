<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="HandOver.aspx.cs" Inherits="HandOver" %>

<script runat="server">

</script>
<asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <form id="form2" runat="server">

<table style="color:#000000" cellspacing="0" cellpadding="5">

<tr>
<td>Pick-Up</td>
<td style="width: 297px">
    <asp:TextBox ID="PickUpDateTextBox" runat="server" ReadOnly="True"></asp:TextBox>
    &nbsp;&nbsp;<asp:TextBox ID="PickUpTimeTextBox" runat="server" ReadOnly="True"></asp:TextBox>
    </td>
<td style="width: 190px">Return:</td>
<td>
    <asp:TextBox ID="ReturnDateTextBox" runat="server" ReadOnly="True"></asp:TextBox>
    &nbsp;&nbsp;<asp:TextBox ID="ReturnTimeTextBox" runat="server" ReadOnly="True"></asp:TextBox>
    </td>
</tr>

<tr>
<td>Pick-up at:</td>
<td style="width: 297px">
    <asp:Label ID="PickAtLabel" runat="server"></asp:Label>
    </td>
<td style="width: 190px">Return at:</td>
<td>
    <asp:Label ID="ReturnAtLabel" runat="server"></asp:Label>
    </td>
</tr>

<tr>
<td>Vehicle Type:</td>
<td style="width: 297px">
    <asp:Label ID="VehicleTypeIdLabel" runat="server"></asp:Label>
    </td>
<td style="width: 190px">Rental AddOns:</td>
<td>
    <asp:Label ID="AddOnsLabel" runat="server"></asp:Label>
    </td>
</tr>

<tr>
<td><label>Name:</label></td><td style="width: 297px">
    <asp:TextBox ID="FirstNameTextBox" runat="server"></asp:TextBox>
    &nbsp;&nbsp;<asp:TextBox ID="LastNameTextox" runat="server"></asp:TextBox>
    <br/></td>
    <td style="width: 190px">
        <asp:Label ID="CarNoLabel" runat="server" Text="Car No"></asp:Label>
    </td>
    <td>
        <asp:DropDownList ID="CarNoDropDownList" runat="server">
        </asp:DropDownList>
    </td>
</tr>

<tr>
<td><label>Address</label></td>
<td style="width: 297px">
    <asp:TextBox ID="AddressTextBox" runat="server" Width="289px"></asp:TextBox>
    </td>
    <td style="width: 190px">
        <asp:Label ID="FuelCapacityLabel" runat="server" Text="Fuel Capacity"></asp:Label>
    </td>
    <td>
        <asp:DropDownList ID="FuelCapacityDropDownList" runat="server">
            <asp:ListItem>0.25</asp:ListItem>
            <asp:ListItem>0.5</asp:ListItem>
            <asp:ListItem>0.75</asp:ListItem>
            <asp:ListItem Value="1"></asp:ListItem>
        </asp:DropDownList>
    </td>
</tr>

<tr>
<td><label>Address-1</label></td>
<td style="width: 297px">
    <asp:TextBox ID="Address1TextBox" runat="server" Width="288px"></asp:TextBox>
    </td></tr>

<tr>
<td><label>Email-ID</label></td>
<td style="width: 297px">
    <asp:TextBox ID="EmailIDTextBox" runat="server" Width="285px"></asp:TextBox>
    </td>
</tr>

<tr>
<td>State</td>
<td style="width: 297px">
    <asp:TextBox ID="StateTextBox" runat="server"></asp:TextBox>
    </td>

    <td style="width: 190px">City</td>
<td>
    <asp:TextBox ID="CityTextBox" runat="server"></asp:TextBox>
    </td>

<td><label>ZIP</label></td>
<td>
    <asp:TextBox ID="ZipTextBox" runat="server"></asp:TextBox>
    </td>
</tr>

<tr>
<td><label>Home Phone</label></td>
<td style="width: 297px">
    <asp:TextBox ID="HomePhoneTextBox" runat="server"></asp:TextBox>
    </td>
<td style="width: 190px"><label>Cell</label></td>
<td>
    <asp:TextBox ID="CellTextBox" runat="server"></asp:TextBox>
    </td>
</tr>

<tr>
<td><label>Driving License</label></td>
<td style="width: 297px">
    <asp:TextBox ID="DrivingLicenseTextBox" runat="server"></asp:TextBox>
    </td>
<td style="width: 190px"><label>Issued By</label></td>
<td>
    <asp:TextBox ID="DLIssuedByTextBox" runat="server"></asp:TextBox>
    </td>
<td><label>valid Thru</label></td>
<td>
    <asp:TextBox ID="DLValidThruTextBox" runat="server"></asp:TextBox>
    </td>
</tr>

<tr>
<td><label>IDP No.</label></td>
<td style="width: 297px">
    <asp:TextBox ID="IDPNoTextBox" runat="server"></asp:TextBox>
    </td>
<td style="width: 190px"><label>Issued By</label></td>
<td>
    <asp:TextBox ID="INIssuedByTextBox" runat="server"></asp:TextBox>
    </td>
<td><label>valid Thru</label></td>
<td>
    <asp:TextBox ID="INValidThruTextBox" runat="server"></asp:TextBox>
    </td>
</tr>

<tr>
<td><label>Passport No.</label></td>
<td style="width: 297px">
    <asp:TextBox ID="PassportNoTextBox" runat="server"></asp:TextBox>
    </td>
<td style="width: 190px"><label>Issued By</label></td>
<td>
    <asp:TextBox ID="PNIssuedByTextBox" runat="server"></asp:TextBox>
    </td>
<td><label>valid Thru</label></td>
<td>
    <asp:TextBox ID="PNValidThruTextBox" runat="server"></asp:TextBox>
    </td>
</tr>

<tr>
<td><label>Estimated Amt.</label></td>
<td style="width: 297px">
    <asp:TextBox ID="EstimatedAmtTextBox" runat="server"></asp:TextBox>
    </td>
</tr>
<br />

<tr>
<td></td><td style="width: 297px"></td><td style="width: 190px">
    <asp:Button ID="AlottedCarButton1" runat="server" 
        onclick="AlottedCarButton1_Click" Text="AlottedCar" Width="93px" />
    &nbsp;
    <asp:Button ID="CancelButton" runat="server" style="margin-left: 24px" 
        Text="Cancel" />
    </td>
</tr>

</table><br />



<br/><br/>

    </form>

    </asp:Content>