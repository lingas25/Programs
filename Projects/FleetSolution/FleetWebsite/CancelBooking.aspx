<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CancelBooking.aspx.cs" Inherits="CancelBooking" %>
<%@ Import Namespace="FleetLibrary"%>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <form id="form1" runat="server">
    <table style="width: 40%" align="center">
        <tr>
            <td>
                Enter Booking No.</td>
            <td>
                <asp:TextBox ID="BookingNoTextBox" runat="server"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="ErrorMessageLabel" runat="server" ForeColor="Red"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="BookingNoTextBox" ErrorMessage="Enter Booking Number" 
                    ForeColor="#990099"></asp:RequiredFieldValidator>
            </td>
        </tr>
    
        <tr>
         <td>
            </td>
            <td>
                <asp:Button ID="CancelBookingButton" runat="server" Text="Cancel Booking" 
                    onclick="CancelBookingButton_Click" />
               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="ResetButton" runat="server" onclick="ResetButton_Click" Text="Reset" Width="66px" />
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
 </form>
</asp:Content>

