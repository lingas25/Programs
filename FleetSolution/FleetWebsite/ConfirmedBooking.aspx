<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ConfirmedBooking.aspx.cs" Inherits="ConfirmedBooking" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <form id="form1" runat="server">
    <table style="width: 64%">
        <tr>
            <td colspan="2" style="text-align:center">
                <asp:Label ID="Label1" runat="server" Text="Confirmed Booking" Font-Bold="True" 
                    Font-Size="XX-Large"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="text-align:center">
                <asp:Label ID="Label2" runat="server" Text="Booking ID" Font-Bold="True"></asp:Label>
            </td>
            <td style="text-align:center">
                <asp:Label ID="BookingIdLabel" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="2" style="text-align:center">
                <asp:Label ID="Label4" runat="server" Text="Thank You" Font-Bold="True" 
                    Font-Size="X-Large"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="2" style="text-align:center">
                <asp:Label ID="Label5" runat="server" Text="Visit us Again" Font-Bold="True" 
                    Font-Size="Large"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="2" style="text-align:center">
                <asp:Label ID="Label6" runat="server" Text="Happy Journey" Font-Bold="True" 
                    Font-Size="X-Large"></asp:Label>
            </td>
        </tr>
    </table>
    </form>
    
</asp:Content>

