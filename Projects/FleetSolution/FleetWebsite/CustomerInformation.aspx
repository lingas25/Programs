<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage.master" CodeFile="CustomerInformation.aspx.cs" Inherits="MemberShipRegistration" EnableViewStateMac="false" %>

<asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    
    <div>
        
        <table style="width:100%;height:258px;">
            <tr>
                <td style="width: 245px;height: 33px;" valign="top">
                    <asp:Panel ID="LoginPanel" runat="server" Visible="true">
                    <table style="width: 100%;border-style: groove">
                        <tr>
                            <td colspan="2" style="text-align:center">
                                <asp:Label ID="MembershipNoLabel" runat="server" Text="MemberShip Login"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 31px; text-align: center" align="center">
                                <a name="GoButton" href="MemberLogin.aspx">Login</a></td>
                        </tr>
                    </table>
                    </asp:Panel>
                     
                </td>
                <td rowspan="2">
                <form id="form2" runat="server">
                   <table style="width: 100%;border-style: groove; height: 524px;">
                        <tr>
                            <td style="width: 164px; height: 45px;">
                                <asp:Label ID="NameLabel" runat="server" Text="Renter's Name"></asp:Label>
                            </td>
                            <td style="width: 149px; height: 45px;">
                                <asp:TextBox ID="FirstNameTextBox" runat="server" Width="199px" placeholder="First Name"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                    ControlToValidate="FirstNameTextBox" ErrorMessage="Enter First Name" 
                                    ForeColor="#CC0000"></asp:RequiredFieldValidator>
                            </td>
                            <td colspan="2" style="height: 45px">
                                <asp:TextBox ID="LastNameTextBox" runat="server" Width="202px" 
                                    placeholder="Last Name" style="margin-left: 0px"></asp:TextBox>
                                <br />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                    ControlToValidate="LastNameTextBox" ErrorMessage="Enter Last Name" 
                                    ForeColor="#CC0000"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 164px;height: 23px;">
                                <asp:Label ID="Address1Label" runat="server" Text="Address 1"></asp:Label>
                            </td>
                            <td style="height: 23px;" colspan="3">
                                <asp:TextBox ID="Address1TextBox" runat="server" Width="198px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                    ControlToValidate="Address1TextBox" ErrorMessage="Enter Required Address" 
                                    ForeColor="#CC0000"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 164px;">
                                <asp:Label ID="Address2Label" runat="server" Text="Address 2"></asp:Label>
                            </td>
                            <td colspan="3">
                                <asp:TextBox ID="Address2TextBox" runat="server" Width="196px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 164px;height: 49px;">
                                <asp:Label ID="EmailIdLabel" runat="server" Text="Email ID:"></asp:Label>
                            </td>
                            <td colspan="3" style="height: 49px;">
                                <asp:TextBox ID="EmailIdTextBox" runat="server" Width="195px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" 
                                    ControlToValidate="EmailIdTextBox" ErrorMessage="Enter Correct Email Id" 
                                    ForeColor="#CC0000"></asp:RequiredFieldValidator>
                                <br />
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                    ControlToValidate="EmailIdTextBox" 
                                    ErrorMessage="Numbers, Alphabets and Special Characters are only allowed" 
                                    ForeColor="#990099" 
                                    ValidationExpression="^([a-zA-Z][\w\.-]*[a-zA-Z0-9]@[a-zA-Z0-9][\w\.-]*[a-zA-Z0-9]\.[a-zA-Z][a-zA-Z\.]*[a-zA-Z]){1,70}$"></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 164px;">
                                <asp:Label ID="StateLabel" runat="server" Text="State"></asp:Label>
                            </td>
                            <td style="width: 149px;">
                                <asp:DropDownList ID="StateDropDownList" runat="server" Height="16px" 
                                    Width="181px" AutoPostBack="True" 
                                    onselectedindexchanged="StateDropDownList_SelectedIndexChanged" >
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" 
                                    ControlToValidate="StateDropDownList" ErrorMessage="Select Proper State" 
                                    ForeColor="#CC0000"></asp:RequiredFieldValidator>
                            </td>
                            <td style="width: 39px;">
                                <asp:Label ID="CityLabel" runat="server" Text="City"></asp:Label>
                            </td>
                            <td style="width: 40px;">
                                <br />
                                <asp:DropDownList ID="CityDropDownList" runat="server" Height="16px" 
                                    Width="137px" 
                                    >
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" 
                                    ControlToValidate="CityDropDownList" ErrorMessage="Enter Proper City" 
                                    ForeColor="#CC0000"></asp:RequiredFieldValidator>
                                <br />
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 164px;height: 26px;">
                                <asp:Label ID="ZipLabel" runat="server" Text="Zip"></asp:Label>
                            </td>
                            <td style="height: 26px;width:149px;">
                                <asp:TextBox ID="ZipTextBox" runat="server" Width="194px" MaxLength="6"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator20" runat="server" 
                                    ControlToValidate="ZipTextBox" ErrorMessage="Enter Zip Code" 
                                    ForeColor="#CC0000"></asp:RequiredFieldValidator>
                                <br />
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" 
                                    ControlToValidate="ZipTextBox" ErrorMessage="Enter min 6 Digit" 
                                    ForeColor="#990099" ValidationExpression="\d{6}"></asp:RegularExpressionValidator>
                            </td>
                            <td style="height: 26px;width: 39px;">
                                &nbsp;</td>
                            <td style="height: 26px; width: 40px;">
                                <br />
                                <br />
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 164px; height: 66px;">
                                <asp:Label ID="HomePhoneLabel" runat="server" Text="Home Phone"></asp:Label>
                            </td>
                            <td style="width: 149px; height: 66px;">
                                <asp:TextBox ID="HomePhoneTextBox" runat="server" Width="190px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                                    ControlToValidate="HomePhoneTextBox" 
                                    ErrorMessage="Enter Home Phone Number" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                            </td>
                            <td style="width: 39px; height: 66px">
                                <asp:Label ID="MobileNoLabel" runat="server" Text="Mobile No."></asp:Label>
                            </td>
                            <td style="width: 40px; height: 66px;">
                                <asp:TextBox ID="MobileNumberTextBox" runat="server" Width="137px" 
                                    MaxLength="10"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" 
                                    ControlToValidate="MobileNumberTextBox" ErrorMessage="Enter Mobile Number" 
                                    ForeColor="#CC0000"></asp:RequiredFieldValidator>
                                <br />
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" 
                                    ControlToValidate="MobileNumberTextBox" ErrorMessage="Enter Upto 10 Digit" 
                                    ForeColor="#990099" ValidationExpression="\d{10}"></asp:RegularExpressionValidator>
                                <br />
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 164px;">
                                <asp:Label ID="LocalDrivingLicLabel" runat="server" 
                                    Text="Local Driving License"></asp:Label>
                            </td>
                            <td style="width: 149px;">
                                <asp:TextBox ID="DLicenseNoTextBox" runat="server" Width="239px" MaxLength="15"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" 
                                    ControlToValidate="DLicenseNoTextBox" 
                                    ErrorMessage="Enter Local Driving Lic." ForeColor="#CC0000"></asp:RequiredFieldValidator>
                                <br />
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" 
                                    ControlToValidate="DLicenseNoTextBox" ErrorMessage="Enter Upto 15 digit" 
                                    ForeColor="#990099" ValidationExpression="\d{15}"></asp:RegularExpressionValidator>
                                <br />
                                <br />
                            </td>
                            <td style="width: 39px">
                                <asp:Label ID="IDPLabel" runat="server" Text="IDP No."></asp:Label>
                            </td>
                            <td style="width: 40px;">
                                <asp:TextBox ID="IdpNumberTextBox" runat="server" Width="138px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 164px;height: 23px;">
                                <asp:Label ID="LocalIssuedByLabel" runat="server" Text="Issued By"></asp:Label>
                            </td>
                            <td style="height: 23px;width: 149px;">
                                <asp:TextBox ID="DIssuedByTextBox" runat="server" Width="238px"></asp:TextBox>
                                <br />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                                    ControlToValidate="DIssuedByTextBox" 
                                    ErrorMessage="Enter Local Driving License Issued Date" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                            </td>
                            <td style="height: 23px;width: 39px;">
                                <asp:Label ID="IDPIssuedByLabel" runat="server" Text="Issued By"></asp:Label>
                            </td>
                            <td style="height:23px; width:40px;">
                                <asp:TextBox ID="IdpIssuedByTextBox" runat="server" Width="140px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 164px;height: 26px;">
                                <asp:Label ID="LocalValidThroughLabel" runat="server" Text="Valid Through"></asp:Label>
                            </td>
                            <td style="height: 26px;width:149px;">
                                <asp:TextBox ID="DValidThroughTextBox" runat="server" Width="237px"></asp:TextBox>
                                <br />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                                    ControlToValidate="DValidThroughTextBox" 
                                    ErrorMessage="Enter Local License Validity Upto" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                            </td>
                            <td style="height: 26px;width: 39px;">
                                <asp:Label ID="IDPValidThroughLabel" runat="server" Text="Valid Through"></asp:Label>
                            </td>
                            <td style="height: 26px; width: 40px;">
                                <asp:TextBox ID="IdpValidThroughTextBox" runat="server" Width="137px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 164px;height: 26px;">
                                <asp:Label ID="PassportNumberLabel" runat="server" Text="Passport No."></asp:Label>
                            </td>
                            <td style="height: 26px;width:149px;">
                                <asp:TextBox ID="PassportNumberTextBox" runat="server" Width="238px"></asp:TextBox>
                            </td>
                            <td style="height: 26px; width: 39px;">
                                <asp:Label ID="ValidLabel" runat="server" Text="Valid"></asp:Label>
                            &nbsp;<br />
                                <asp:Label ID="DateLabel" runat="server" Text="Date"></asp:Label>
                            </td>
                            <td style="height: 26px; width: 40px;">
                                <asp:TextBox ID="PValidThroughTextBox" runat="server" Width="136px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 164px;">
                                <asp:Label ID="IssuedByLabel" runat="server" Text="Issued By"></asp:Label>
                            </td>
                            <td style="width: 149px;">
                                <asp:TextBox ID="PIssuedByTextBox" runat="server" Width="236px"></asp:TextBox>
                            </td>
                            <td style="width: 39px">
                                &nbsp;</td>
                            <td style="width: 40px;">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td style="width: 164px;height: 26px;">
                                <asp:Label ID="DateOfBirthLabel" runat="server" Text="Date Of Birth"></asp:Label>
                            </td>
                            <td style="height: 26px;width:149px;">
                                <asp:TextBox ID="DateOfBirthTextBox" runat="server" Width="236px"></asp:TextBox>
                                <br />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" 
                                    ControlToValidate="DateOfBirthTextBox" 
                                    ErrorMessage="Enter Correct Date Of Birth" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                            </td>
                            <td style="height: 26px; width: 39px;">
                                <asp:Label ID="EstimatedAmountLabel" runat="server" Text="Estimated Amount"></asp:Label>
                                </td>
                            <td style="height: 26px; width: 40px;">
                                <asp:TextBox ID="EstimatedAmountTextBox" runat="server" Enabled="False" 
                                    Width="134px"></asp:TextBox>
                                </td>
                        </tr>
                        <tr>
                            <td style="width: 164px;">
                                &nbsp;</td>
                            <td align="center" style="width: 149px;">
                                <asp:Button ID="ContinueBookingButton" runat="server" Text="Continue Booking" 
                                    onclick="ContinueBookingButton_Click" />
                            </td>
                            <td colspan="2" align="left">
                                <asp:Button ID="CancelButton" runat="server" Text="Cancel" 
                                    onclick="CancelButton_Click" />
                            </td>
                        </tr>
                    </table>
                  </form>
                </td>
            </tr>
            <tr>
                <td style="width: 245px;border-style: groove" valign="top">
                    <center><b><u>Your Booking</u></b></center><br/>
                    <b>Pick-Up:</b><asp:Label ID="PickUpLabel" runat="server"></asp:Label>
                    <br />
                    <asp:Label ID="PickUpTimeLabel" runat="server" Font-Bold="True" 
                        Text="Pick Up Time: "></asp:Label>
                    <asp:Label ID="PickTimeLabel" runat="server"></asp:Label>
                    <br />
                    <b>Pick-Up at:</b><asp:Label ID="PickUpAtLabel" runat="server"></asp:Label>
                    <br />
                    <br />
                    <b>Return:</b><asp:Label ID="ReturnLabel" runat="server"></asp:Label>
                    <br />
                    <asp:Label ID="RetTimeLabel" runat="server" Font-Bold="True" 
                        Text="Return Time:"></asp:Label>
                    <asp:Label ID="ReturnTimeLabel" runat="server"></asp:Label>
                    <br />
                    <b>Return At:</b><asp:Label ID="ReturnAtLabel" runat="server"></asp:Label>
                    <br />
                    <p align="right">&nbsp;</p>
                    <b><u>Selected Vehicle Type</u></b>
                    <br />
                    <asp:Label ID="VehicleSelectedLabel" runat="server"></asp:Label>
                    <br />
                    <p align="right">&nbsp;</p>
                    <b><u>Selected Add-Ons</u></b><br />
                    <p id="addOn">
                        <asp:Label ID="AddOnLabel" runat="server"></asp:Label>
                    </p>
                    <p>
                        <strong>Child Seat: </strong><asp:Label ID="ChildSeatCountLabel" 
                            runat="server">Not Selected</asp:Label>
                    </p>
                    <br />
                    <br />
                    <p align="right">
                        <%--<asp:Button ID="ModifyButton" runat="server" Text="Modify" />--%>
                        <a href="Default.aspx" style="margin-right">Modify</a>
                    </p>
                    </td>

            </tr>
        </table>

    <%--<script src="js/ModalPopupWindow.js" type="text/javascript"></script>
    <script type="text/javascript">
        var modalWin = new CreateModalPopUpObject();
        modalWin.SetLoadingImagePath("Images/loading.gif");
        modalWin.SetCloseButtonImagePath("Images/remove.gif");
        function EnrollNow(msg) {
            modalWin.HideModalPopUp();
            modalWin.ShowMessage(msg, 200, 400, 'User Information', null, null);
        }
        function EnrollLater() {
            modalWin.HideModalPopUp();
            modalWin.ShowMessage(msg, 200, 400, 'User Information', null, null);
        }
        function ShowNewPage() {
            var callbackFunctionArray = new Array(EnrollNow, EnrollLater);
            modalWin.ShowURL('LoginForm.aspx', 240, 350, 'Airport Search', null, callbackFunctionArray);
        }
 </script>--%>
</div>
    
    <script type="text/javascript">

        $(function () {
            $("#ContentPlaceHolder1_DIssuedByTextBox").datepicker({
                defaultDate: "+1w",
                changeMonth: true,
                changeYear: true,
                onClose: function (selectedDate) {
                    $("#ContentPlaceHolder1_DValidThroughTextBox").datepicker("option", "minDate", selectedDate);
                }
            });

            $("#ContentPlaceHolder1_DValidThroughTextBox").datepicker({
                defaultDate: "+1w",
                changeMonth: true,
                changeYear: true,
                onClose: function (selectedDate) {
                    $("#ContentPlaceHolder1_DIssuedByTextBox").datepicker("option", "maxDate", selectedDate);
                }
            });
        });

        $(function () {
            $("#ContentPlaceHolder1_IdpIssuedByTextBox").datepicker({
                defaultDate: "+1w",
                changeMonth: true,
                changeYear: true,
                onClose: function (selectedDate) {
                    $("#ContentPlaceHolder1_IdpValidThroughTextBox").datepicker("option", "minDate", selectedDate);
                }
            });

            $("#ContentPlaceHolder1_IdpValidThroughTextBox").datepicker({
                defaultDate: "+1w",
                changeMonth: true,
                changeYear: true,
                onClose: function (selectedDate) {
                    $("#ContentPlaceHolder1_IdpIssuedByTextBox").datepicker("option", "maxDate", selectedDate);
                }
            });
        });

        $(function () {
            $("#ContentPlaceHolder1_PIssuedByTextBox").datepicker({
                defaultDate: "+1w",
                changeMonth: true,
                changeYear: true,
                onClose: function (selectedDate) {
                    $("#ContentPlaceHolder1_PValidThroughTextBox").datepicker("option", "minDate", selectedDate);
                }
            });

            $("#ContentPlaceHolder1_PValidThroughTextBox").datepicker({
                defaultDate: "+1w",
                changeMonth: true,
                changeYear: true,
                onClose: function (selectedDate) {
                    $("#ContentPlaceHolder1_PIssuedByTextBox").datepicker("option", "maxDate", selectedDate);
                }
            });
        });

         $("#ContentPlaceHolder1_DateOfBirthTextBox").datepicker({
                defaultDate: "+1w",
                changeMonth: true,
                changeYear: true,
            });
        
</script>
</asp:Content>
