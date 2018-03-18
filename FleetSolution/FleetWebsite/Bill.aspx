<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Bill.aspx.cs" Inherits="Bill" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form id="form1" runat="server">
    <table style="width: 55%">
        <tr>
            <td colspan="2" style="text-align:center">
                <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="XX-Large" 
                    Text="Bill"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="text-align:center">
                <asp:Label ID="Label2" runat="server" Font-Bold="True" Text="Bill ID"></asp:Label>
            </td>
            <td style="text-align:center">
                <asp:Label ID="BillIDLabel" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="text-align:center">
                <asp:Label ID="Label4" runat="server" Font-Bold="True" Text="Amount"></asp:Label>
            </td>
            <td style="text-align:center">
                <asp:Label ID="AmountLabel" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="2" style="text-align:center">
                <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Size="X-Large" 
                    Text="Thank You"></asp:Label>
            </td>
        </tr>
    </table>
    </form>
</asp:Content>

