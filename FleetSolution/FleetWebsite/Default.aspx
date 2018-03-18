<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" MaintainScrollPositionOnPostback="true"
    CodeFile="Default.aspx.cs" Inherits="_Default" EnableViewStateMac="false" %>

<asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form2" runat="server">
    <table>
        <tr>
            <td style="width: 326px">
                <h1>
                    <u>Make Reservation</u></h1>

                <table cellpadding="2px" width="400px">
                    <tr>
                        <th colspan="3" align="left">
                            Rental Date and Time
                        </th>
                        <th colspan="3" align="left">
                            Return Date and Time
                        </th>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <asp:TextBox ID="RentalDateTimeTextBox" runat="server" Width="128px"></asp:TextBox>
                            <asp:HiddenField ID="HiddenField1" runat="server" />
                        </td>
                        <td colspan="3">
                            <asp:TextBox ID="ReturnDateTimeTextBox" runat="server"></asp:TextBox>
                            <asp:HiddenField ID="HiddenField2" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td rowspan="2">
                            <asp:DropDownList ID="RentalHoursDropDownList" runat="server">
                            </asp:DropDownList>
                        </td>
                        <td rowspan="2">
                            <asp:DropDownList ID="RentalMinutesDropDownList" runat="server">
                            </asp:DropDownList>
                        </td>
                        <td style="width: 118px">
                            <asp:RadioButton ID="RentalAMRadioButton" runat="server" Text="AM" GroupName="RentalAmPm" />
                        </td>
                        <td rowspan="2">
                            <asp:DropDownList ID="ReturnHoursDropDownList" runat="server">
                            </asp:DropDownList>
                        </td>
                        <td rowspan="2">
                            <asp:DropDownList ID="ReturnMinutesDropDownList" runat="server">
                            </asp:DropDownList>
                        </td>
                        <td>
                            <asp:RadioButton ID="ReturnAMRadioButton" runat="server" Text="AM" GroupName="ReturnAmPm" />
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 118px">
                            <asp:RadioButton ID="RentalPMRadioButton" runat="server" Text="PM" GroupName="RentalAmPm" />
                        </td>
                        <td>
                            <asp:RadioButton ID="ReturnPMRadioButton" runat="server" Text="PM" GroupName="ReturnAmPm" />
                        </td>
                    </tr>
    </table>
    <h4>Pick up Location</h4>

    <p>
        <asp:Button ID="PickUpFindAirportButton" runat="server" Text="Find Airport" OnClick="PickUpFindAirportButton_Click" />
    </p>

    <p style="height: 23px">OR</p>

    <p>
   
    
         
         Enter State
        <asp:DropDownList ID="PickUpStateDropDownList" runat="server" AutoPostBack="True"
            OnSelectedIndexChanged="PickUpStateDropDownList_SelectedIndexChanged">
        </asp:DropDownList>
        City
        <asp:DropDownList ID="PickUpCityDropDownList" runat="server" AutoPostBack="True">
        </asp:DropDownList>
        
        
        <asp:Button ID="PickupSearchButton" runat="server" Text="Search" OnClick="PickupSearchButton_Click" />
    </p>

    <p>
        <asp:TextBox ID="PickUpHubCodeTextBox" runat="server" Width="58px"></asp:TextBox>
        &nbsp;&nbsp;&nbsp;
        </p>
    <p>
    
        <asp:CheckBox ID="DifferentLocCheckBox" runat="server" Text="I may enter the car to different location"
            OnCheckedChanged="DifferentLocCheckBox_CheckedChanged" AutoPostBack="True" />

    </p>
    <h4>
        &nbsp;</h4>
    <asp:Panel ID="ReturnPanel" runat="server" Visible="False">
        Return Location<br />
        <br />
        <asp:Button ID="ReturnFindAirportButton" runat="server" Text="Find Airport" OnClick="ReturnFindAirportButton_Click" />
        <br />
        <br />
        OR<br />
        Enter State
        <asp:DropDownList ID="ReturnLocStateDropDownList" runat="server" AutoPostBack="True"
            OnSelectedIndexChanged="ReturnLocStateDropDownList_SelectedIndexChanged">
        </asp:DropDownList>
        City
        <asp:DropDownList ID="ReturnLocCityDropDownList" runat="server" AutoPostBack="True">
        </asp:DropDownList>
        <asp:Button ID="ReturnSearchButton" runat="server" Text="Search" 
            onclick="ReturnSearchButton_Click" />
        <br />
        <br />
        <asp:TextBox ID="ReturnHubCodeTextBox" runat="server" Width="61px"></asp:TextBox>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </asp:Panel>
    <br />
    <center>
        <asp:Button ID="HomeContinueBookingButton" runat="server" Text="Continue Booking"
            Width="129px" OnClick="HomeContinueBookingButton_Click" />
        <br />
        
           
                   
               
                </center>
    </td>
    <td>
        <img src="Images/castrol.jpg" height="300" width="700" align="right" alt="castrol" />
        <img src="Images/tyre.jpg" height="300" width="700" align="right" alt="tyre"/><br/>
    </td>
    </tr>
     </table>
    </form>
    <script type="text/javascript">

        $(function () {
            $("#ContentPlaceHolder1_RentalDateTimeTextBox").datepicker({
                defaultDate: "+1w",
                changeMonth: true,
                changeYear: true,
                altField: '[id$=HiddenField1]',
                onClose: function (selectedDate) {
                    $("#ContentPlaceHolder1_ReturnDateTimeTextBox").datepicker("option", "minDate", selectedDate);
                                                 }
            });
            
            $("#ContentPlaceHolder1_ReturnDateTimeTextBox").datepicker({
                defaultDate: "+1w",
                changeMonth: true,
                changeYear: true,
                altField: '[id$=HiddenField2]',
                onClose: function (selectedDate) {
                    $("#ContentPlaceHolder1_RentalDateTimeTextBox").datepicker("option", "maxDate", selectedDate);
                                                 }
            });

            if ($("[id$=HiddenField1]").attr("Value").length > 0) {
                $("#ContentPlaceHolder1_RentalDateTimeTextBox").datepicker("setDate", new Date($("[id$=HiddenField1]").attr("Value")));
            }
            if ($("[id$=HiddenField2]").attr("Value").length > 0) {
                $("#ContentPlaceHolder1_ReturnDateTimeTextBox").datepicker("setDate", new Date($("[id$=HiddenField2]").attr("Value")));
            }


        });


   

    </script>
</asp:Content>
