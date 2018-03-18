<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="HandOverCheckBooking.aspx.cs" Inherits="HandOverCheckBooking" %>


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
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="CheckButton" runat="server" onclick="CheckButton_Click" 
                    Text="Check Booking" />
            </td>
            <td>
                <asp:Button ID="ResetButton" runat="server" onclick="ResetButton_Click" 
                    Text="Reset" Width="126px" />
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

