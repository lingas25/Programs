<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="BillShow.aspx.cs" Inherits="BillShow" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<form runat="server">
<center>
Enter Billing ID:<asp:TextBox runat="server" ID="BillIdTextBox" /><asp:Label runat="server" ID="ErrorMessageLabel" /> <br/>
<asp:Button runat="server" ID="SearchButton" Text="Search" 
        onclick="SearchButton_Click"/>
</center>

<asp:Panel runat="server" ID="BillPanel">
<center>Billing Form</center>
<table style="width: 40%" align="center">
        
        <tr>
            <td>Pick-Up:</td>
            <td>
            <asp:TextBox runat="server" ID="PickUpTextBox"></asp:TextBox></td>
        </tr>
        <tr>
            <td>Pick-Up at:</td>
            <td>
            <asp:TextBox runat="server" ID="PickUpAtTextBox"></asp:TextBox></td>
        </tr>
        <tr>
            <td>Return:</td>
            <td>
            <asp:TextBox runat="server" ID="ReturnTextBox"></asp:TextBox></td>
        </tr>
        <tr>
            <td>Return at:</td>
            <td>
            <asp:TextBox runat="server" ID="ReturnAtTextBox"></asp:TextBox></td>
        </tr>
         <tr>
            <td>Car No:</td>
            <td>
            <asp:TextBox runat="server" ID="CarNoTextBox"></asp:TextBox></td>
        </tr>
        <tr>
            <td>Car Type ID:</td>
            <td>
            <asp:TextBox runat="server" ID="CarTypeIdTextBox"></asp:TextBox></td>
        </tr>
        <tr>
            <td>Fuel Status:</td>
            <td>
            <asp:TextBox runat="server" ID="FuelStatusTextBox"></asp:TextBox></td>
        </tr>
         <tr>
        <td>FuelPrice</td>
        <td>
        <asp:TextBox runat="server" ID="FuelPriceTextBox"></asp:TextBox></td>
        </tr>
        <tr>
        <td></td>
        <td>
        <asp:Button runat="server" ID="DoneButton" Text="Done" onclick="DoneButton_Click"></asp:Button>
            </td>
        </tr>

    </table>
    </asp:Panel>
 </form>
</asp:Content>

