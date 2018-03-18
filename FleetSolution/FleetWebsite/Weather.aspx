<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Weather.aspx.cs" Inherits="FleetWebsite_Weather1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form id="form1" runat="server">
    <table style="width: 100%">
        <tr>
            <td style="width: 471px; color: #3399FF; font-weight: bold;" bgcolor="White">
                Click on the City below to check Weather...</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 471px">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 471px">
                <asp:HyperLink ID="HyperLink10" runat="server" 
                    NavigateUrl="http://in.weather.com/weather/today-Mumbai-INXX0087">Mumbai</asp:HyperLink>
                
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 471px">
                <asp:HyperLink ID="HyperLink11" runat="server" 
                    NavigateUrl="http://in.weather.com/weather/today/INXX0202:1:IN">Chennai</asp:HyperLink>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 471px">
                <asp:HyperLink ID="HyperLink12" runat="server" 
                    NavigateUrl="http://in.weather.com/weather/today-Bangalore-INXX0012:1:IN">Bengaluru</asp:HyperLink>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 471px; height: 23px;">
                <asp:HyperLink ID="HyperLink13" runat="server" 
                    NavigateUrl="http://in.weather.com/weather/today/INXX0038:1:IN">New Delhi</asp:HyperLink>
            </td>
            <td style="height: 23px">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 471px">
                <asp:HyperLink ID="HyperLink14" runat="server" 
                    NavigateUrl="http://in.weather.com/weather/today/INXX0300:1:IN">Kolkata</asp:HyperLink>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 471px">
                <asp:HyperLink ID="HyperLink15" runat="server" 
                    NavigateUrl="http://in.weather.com/weather/today/INXX0169:1:IN">Panaji</asp:HyperLink>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 471px">
                <asp:HyperLink ID="HyperLink16" runat="server" 
                    NavigateUrl="http://in.weather.com/weather/today/INXX0125:1:IN">Trivandrum</asp:HyperLink>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 471px">
                <asp:HyperLink ID="HyperLink17" runat="server" 
                    NavigateUrl="http://in.weather.com/weather/today/INXX0203:1:IN">Agra</asp:HyperLink>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 471px">
                <asp:HyperLink ID="HyperLink18" runat="server" 
                    NavigateUrl="http://in.weather.com/weather/today/INXX0057:1:IN">Hyderabad</asp:HyperLink>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 471px">
                <asp:HyperLink ID="HyperLink19" runat="server" 
                    NavigateUrl="http://in.weather.com/weather/today/INXX8716:1:IN">Jaipur</asp:HyperLink>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 471px">
                <asp:HyperLink ID="HyperLink20" runat="server" 
                    NavigateUrl="http://in.weather.com/weather/today/INXX0001:1:IN">Ahmedabad</asp:HyperLink>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 471px">
                <asp:HyperLink ID="HyperLink21" runat="server" 
                    NavigateUrl="http://in.weather.com/weather/today/INXX0049:1:IN">Gangtok</asp:HyperLink>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 471px">
                <asp:HyperLink ID="HyperLink22" runat="server" 
                    NavigateUrl="http://in.weather.com/weather/today/INXX0058:1:IN">Indore</asp:HyperLink>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 471px">
                <asp:HyperLink ID="HyperLink23" runat="server" 
                    NavigateUrl="http://in.weather.com/weather/today/INXX0185:1:IN">Chandigarh</asp:HyperLink>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 471px">
                
                <asp:HyperLink ID="HyperLink25" runat="server" 
                    NavigateUrl="http://in.weather.com/weather/today/INXX0152:1:IN">Ranchi</asp:HyperLink>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 471px">
                &nbsp;</td>
            <td style="color: #009933; font-weight: bold">
                <asp:HyperLink ID="HyperLink26" runat="server" 
                    NavigateUrl="~/FleetWebsite/Default.aspx">Rent A Car Now....!!!</asp:HyperLink>
            </td>
        </tr>
    </table>
    </form>
</asp:Content>

