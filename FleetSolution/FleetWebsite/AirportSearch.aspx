<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" MaintainScrollPositionOnPostback="true"
    CodeFile="AirportSearch.aspx.cs" Inherits="AirportSearch" EnableViewStateMac="false" %>

<asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 34%;
        }
        .auto-style2 {
            height: 42px;
        }
        .auto-style3 {
            height: 34px;
        }
        .auto-style4 {
            height: 32px;
        }
        .auto-style5 {
            height: 34px;
            width: 206px;
        }
        .auto-style6 {
            height: 32px;
            width: 206px;
        }
        .auto-style7 {
            width: 206px;
            height: 30px;
        }
        .auto-style8 {
            height: 30px;
        }
    </style>
    <form id="form1" runat="server">
    <div>
    
        <table class="auto-style1">
            <tr>
                <td colspan="2" style="text-align:center" class="auto-style2">
                    <asp:Label ID="FindAirportLabel" runat="server" ClientIDMode="AutoID" Font-Bold="False" Font-Size="X-Large" Text="Find Airport"></asp:Label>
                </td>
            </tr>
                <tr>
                <td style="text-align:center" class="auto-style6">
                    <asp:Label ID="StateLabel" runat="server" Text="State"></asp:Label>
                </td>
                <td style="text-align:center" class="auto-style4">
                    <asp:DropDownList ID="StateDropDownList" runat="server" OnSelectedIndexChanged="StateDropDownList_SelectedIndexChanged"  AutoPostBack="True">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td style="text-align:center" class="auto-style5">
                    <asp:Label ID="CityLabel" runat="server" Text="City"></asp:Label>
                </td>
                <td style="text-align:center" class="auto-style3">
                    <asp:DropDownList ID="CityDropDownList" runat="server" style="margin-bottom: 0px" OnSelectedIndexChanged="CityDropDownList_SelectedIndexChanged" AutoPostBack="True">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td style="text-align:center" class="auto-style5">
                    <asp:Label ID="AirportLabel" runat="server" Text="Airport"></asp:Label>
                </td>
                <td style="text-align:center" class="auto-style3">
                    <asp:DropDownList ID="AirportDropDownList" runat="server">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td style="text-align:center" class="auto-style7">
                    <asp:Button ID="SubmitButton" runat="server" Text="Submit" OnClick="SubmitButton_Click" />
                </td>
                <td style="text-align:center" class="auto-style8">
                    <asp:Button ID="CancelButton" runat="server" Text="Cancel" />
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</asp:Content>