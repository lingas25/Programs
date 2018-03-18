<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="StaffLogin.aspx.cs" Inherits="StaffLogin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form id="form2" runat="server">
    <table style="width: 100%">
        <tr>
            <td>
                <asp:Label ID="MembershipNoLabel" runat="server" Text="UserName"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="MembershipNoTextBox" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="PasswordLabel" runat="server" Text="Password"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="PasswordTextBox" runat="server" TextMode="Password"></asp:TextBox>
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
                <asp:Button ID="LoginButton" runat="server" onclick="LoginButton_Click" 
                    Text="Login" />
            </td>
            <td>
                <asp:Button ID="CancelButton" runat="server" Text="Cancel" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Label ID="MessageLabel" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
    </form>
</asp:Content>

