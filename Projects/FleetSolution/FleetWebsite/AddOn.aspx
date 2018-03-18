<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AddOn.aspx.cs" Inherits="AddOn" EnableViewStateMac="false" %>
<%@ Import Namespace="FleetLibrary"%>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1><u>Rental Add-Ons</u></h1>
    <form id="form2" runat="server" method="Get" action="CustomerInformation.aspx">
    <table style="width: 100%">
        <tr>
            <td style="width: 158px; height: 23px; font-weight: bold;">
                Rental Add-ons:</td>
            <td style="height: 23px; width: 334px">
                &nbsp;</td>
            <td style="height: 23px; width: 278px">
                &nbsp;</td>
            <td style="height: 23px">
            </td>
        </tr>
        <%
        FleetDL _fdl = new FleetDL();
     
      List<AddOn> AddonCollection = _fdl.GetAddons(); 
        %>       
         <%
             for (int i = 0; i < AddonCollection.Count(); i++)
             {
        %>
         <tr> 
         <td><%= "<input type='checkbox' name='Addon' value=" + AddonCollection[i].AddonID + " id=" + AddonCollection[i].AddonID + "/>"%></td>
         <td><%= AddonCollection[i].Name %></td>
         <td><%=AddonCollection[i].PricePerDay%> </td>
         </tr>
        <%
          }
         %>
         <tr><td>Please enter No. of Seats:</td>
         <td> 
                <select id="AddOnDropDownList" name="AddOnDropDownList">
                    <option Value="1">1</option>
                    <option Value="2">2</option>
                    <option Value="3">3</option>
                    <option Value="4">4</option>
             </select>
             </td></tr> 

           <tr><td>
               <asp:Button ID="AddonContinueButton" runat="server" Text="Continue Button" 
                   onclick="AddonContinueButton_Click"/></td><td>
                   <asp:Button ID="AddonCancelButton" runat="server" Text="Cancel" />&nbsp;
                   </td></tr>
    </table>
    <p>&nbsp;</p>
  
    
    
    </form>
       
</asp:Content>

