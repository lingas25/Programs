<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CarSelect.aspx.cs" Inherits="CarSelect" EnableViewStateMac="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form id="CarForm" runat="server" action="AddOn.aspx"> 
   <table><tr><th>Select</th><th>Cars</th><th>Car Type</th><th>Price PerDay</th><th>Price PerWeek</th><th>Price PerMonth</th></tr>
    <%
        Car c = new Car();
        List<CarDetails> list = c.GetCarData();
        foreach (CarDetails item in list)
        {
         %>
            <tr>
                <td><%
                                if(item.NoOfCars > 0 )
                                {
                         %>
                    <%= "<input type='radio' name='CarSelectRadio' value='" + item.CarTypeId +"' />" %>
                    <% }
                       else
                       {
                        %>
                    <%= "Sold" %>
                    <% } %>
                </td>
                <td><%= "<img alt='Lingas' src='" + item.Url +"' />" %></td>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%= item.CarType %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%= item.Daily %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%= item.Weekly %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%= item.Monthly %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
            </tr>
    <%
        }
         %>
    </table>
    <asp:Button runat="server" ID="CarSelectContinueButton" Text="Continue Booking" 
        onclick="CarSelectButton_Click" />
      
    </form>
</asp:Content>

