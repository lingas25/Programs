<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="BillSearch.aspx.cs" Inherits="BillSearch" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form id="form1" runat="server">
    <asp:Panel ID="Panel1" runat="server" Height="500px">
        <asp:Panel ID="Panel2" runat="server" Height="100px">
            <table style="width: 87%">
                <tr>
                    <td style="width: 480px; text-align:center; height: 39px;">
                        <asp:Label ID="BillIDLabel" runat="server" Text="BillID" Font-Bold="True"></asp:Label>
                    </td>
                    <td style="text-align:center; height: 39px;">
                        <asp:DropDownList ID="BillIdDropDownList" runat="server" 
                            DataSourceID="BillSearchSqlDataSource" DataTextField="BillId" 
                            DataValueField="BillId">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align:center">
                        <asp:Button ID="BillSearchButton" runat="server" 
                            onclick="BillSearchButton_Click" Text="Bill Search" />
                    </td>
                </tr>
            </table>
        </asp:Panel>
        <asp:Panel ID="Panel3" runat="server" Height="439px">
            <br />
            <table style="width: 87%">
                <tr>
                    <td style="width: 442px; text-align:center">
                        <asp:DetailsView ID="Bill1DetailsView" runat="server" AutoGenerateRows="False" 
                            DataSourceID="Bill1SqlDataSource" Height="50px" Width="284px" 
                            Font-Bold="True">
                            <Fields>
                                <asp:BoundField DataField="CarNo" HeaderText="CarNo" SortExpression="CarNo" />
                                <asp:BoundField DataField="Daily" HeaderText="Daily" SortExpression="Daily" />
                                <asp:BoundField DataField="Monthly" HeaderText="Monthly" 
                                    SortExpression="Monthly" />
                                <asp:BoundField DataField="Weekly" HeaderText="Weekly" 
                                    SortExpression="Weekly" />
                                <asp:BoundField DataField="BookingDate" HeaderText="BookingDate" 
                                    SortExpression="BookingDate" />
                                <asp:BoundField DataField="PickDate" HeaderText="PickDate" 
                                    SortExpression="PickDate" />
                                <asp:BoundField DataField="PickAt" HeaderText="PickAt" 
                                    SortExpression="PickAt" />
                                <asp:BoundField DataField="ReturnDate" HeaderText="ReturnDate" 
                                    SortExpression="ReturnDate" />
                                <asp:BoundField DataField="ReturnAt" HeaderText="ReturnAt" 
                                    SortExpression="ReturnAt" />
                                <asp:BoundField DataField="EstimatedAmount" HeaderText="EstimatedAmount" 
                                    SortExpression="EstimatedAmount" />
                            </Fields>
                        </asp:DetailsView>
                    </td>
                    <td style="width: 301px;text-align:center">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:DetailsView ID="Bill2DetailsView" runat="server" AutoGenerateRows="False" 
                            DataSourceID="Bill2SqlDataSource" Height="50px" 
                            onpageindexchanging="Bill2DetailsView_PageIndexChanging" 
                            style="margin-top: 0px" Width="125px" Font-Bold="True">
                            <Fields>
                                <asp:BoundField DataField="FirstName" HeaderText="FirstName" 
                                    SortExpression="FirstName" />
                                <asp:BoundField DataField="LastName" HeaderText="LastName" 
                                    SortExpression="LastName" />
                                <asp:BoundField DataField="BirthDate" HeaderText="BirthDate" 
                                    SortExpression="BirthDate" />
                                <asp:BoundField DataField="Addr1" HeaderText="Addr1" SortExpression="Addr1" />
                                <asp:BoundField DataField="EmailId" HeaderText="EmailId" 
                                    SortExpression="EmailId" />
                                <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" />
                                <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
                                <asp:BoundField DataField="Zip" HeaderText="Zip" SortExpression="Zip" />
                                <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
                                <asp:BoundField DataField="Mobile" HeaderText="Mobile" 
                                    SortExpression="Mobile" />
                            </Fields>
                        </asp:DetailsView>
                    </td>
                    <td style="text-align:center">
                        <asp:DetailsView ID="Bill3DetailsView" runat="server" AutoGenerateRows="False" 
                            DataSourceID="Bill3SqlDataSource" Height="50px" Width="125px" 
                            Font-Bold="True">
                            <Fields>
                                <asp:BoundField DataField="BillId" HeaderText="BillId" 
                                    SortExpression="BillId" />
                                <asp:BoundField DataField="DlicenseNo" HeaderText="DlicenseNo" 
                                    SortExpression="DlicenseNo" />
                                <asp:BoundField DataField="DIssuedBy" 
                                    HeaderText="DIssuedBy" SortExpression="DIssuedBy" />
                                <asp:BoundField DataField="DLicenseValidThrough" 
                                    HeaderText="DLicenseValidThrough" SortExpression="DLicenseValidThrough" />
                                <asp:BoundField DataField="IDPNo" HeaderText="IDPNo" 
                                    SortExpression="IDPNo" />
                                <asp:BoundField DataField="IDPIssuedBy" HeaderText="IDPIssuedBy" 
                                    SortExpression="IDPIssuedBy" />
                                <asp:BoundField DataField="IDPValidThru" HeaderText="IDPValidThru" 
                                    SortExpression="IDPValidThru" />
                                <asp:BoundField DataField="PassportNo" HeaderText="PassportNo" 
                                    SortExpression="PassportNo" />
                                <asp:BoundField DataField="PValidThru" HeaderText="PValidThru" 
                                    SortExpression="PValidThru" />
                                <asp:BoundField DataField="PIssued_by" HeaderText="PIssued_by" 
                                    SortExpression="PIssued_by" />
                            </Fields>
                        </asp:DetailsView>
                    </td>
                </tr>
            </table>
            <br />
            <asp:SqlDataSource ID="Bill1SqlDataSource" runat="server" 
                ConnectionString="<%$ ConnectionStrings:FleetConnectionString %>" 
                
                
                SelectCommand="SELECT [CarNo], [Daily], [Monthly], [Weekly], [BookingDate], [PickDate], [PickAt], [ReturnDate], [ReturnAt], [EstimatedAmount] FROM [Bill]">
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="Bill2SqlDataSource" runat="server" 
                ConnectionString="<%$ ConnectionStrings:FleetConnectionString %>" 
                SelectCommand="SELECT [FirstName], [LastName], [BirthDate], [Addr1], [EmailId], [State], [City], [Zip], [Phone], [Mobile] FROM [Bill] WHERE ([BillId] = @BillId)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="BillIdDropDownList" Name="BillId" 
                        PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="Bill3SqlDataSource" runat="server" 
                ConnectionString="<%$ ConnectionStrings:FleetConnectionString %>" 
                
                SelectCommand="SELECT [BillId], [DlicenseNo], [DIssuedBy], [DLicenseValidThrough], [IDPNo], [IDPIssuedBy], [IDPValidThru], [PassportNo], [PValidThru], [PIssued_by] FROM [Bill] WHERE ([BillId] = @BillId)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="BillIdDropDownList" Name="BillId" 
                        PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="BillSearchSqlDataSource" runat="server" 
                ConnectionString="<%$ ConnectionStrings:FleetConnectionString %>" 
                SelectCommand="SELECT [BillId] FROM [Bill]"></asp:SqlDataSource>
        </asp:Panel>
    </asp:Panel>
    </form>
</asp:Content>

