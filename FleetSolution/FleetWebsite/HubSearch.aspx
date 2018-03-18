<%@ Page Language="C#" AutoEventWireup="true" CodeFile="HubSearch.aspx.cs" Inherits="HubSearch" MasterPageFile="~/MasterPage.master" EnableViewStateMac="false" %>
<%@ Import Namespace="FleetLibrary"%>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <form id="form1" runat="server" action="Default.aspx">
    <div>
    <h1><u>Location Selection</u></h1>
    <h2>Select a Pick-up/Return Location.</h2>
        <%
        FleetDL _fdl = new FleetDL();
      string city = Request["city"];
      List<Hub> hubCollection = _fdl.GetHubs(city); 
        %>
    <h3>Your location description <%=Request["city"] %>has <%= hubCollection.Count() %>matches. please select one.</h3>
   
    <table id="tb1"  cellpadding="10" cellspacing="10">
     
        <%
            for (int i = 0; i < hubCollection.Count(); i++)
            {
        %>
        <tr>
                <td><%= "<input type='radio' name='rd' value='"+hubCollection[i].HubCode+"'/>" %></td>
                <td><%=hubCollection[i].Name + "<br>" + hubCollection[i].Address + "<br>" + hubCollection[i].Phone + "<br>Sun  " + hubCollection[i].Sun + "; Mon-Fri  " + hubCollection[i].MonFri + "; <br>Sat  " + hubCollection[i].Sat%> </td>
                </tr>
        <%     
            }
         %>
      
      <tr>
      <td>
          <asp:Button ID="SelectHubButton" runat="server" Text="Select Hub" />&nbsp;&nbsp;&nbsp; 
          </td>
      <td> <asp:Button ID="HubSearchCancel" runat="server" Text="Cancel" 
              onclick="HubSearchCancel_Click" /></td> 
       </tr>
    </table>
    </div>
    </form>

    </asp:Content>
   
