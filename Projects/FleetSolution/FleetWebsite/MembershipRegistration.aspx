<%@ Page Language="C#" Debug="true" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MembershipRegistration.aspx.cs" Inherits="MembershipRegistration" %>

<asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <form id="form2" runat="server">


<div class="con">

<table align="center" cellspacing="10">
<tr>
<td style="height: 59px"><label>Name:</label></td>
<td colspan="3" style="height: 59px">
    <asp:TextBox ID="FirstNameTextBox" runat="server" Width="193px"></asp:TextBox>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="LastNameTextBox" runat="server" style="margin-left: 0px" 
        Width="206px"></asp:TextBox>
    <br />
    &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator4" 
        runat="server" ControlToValidate="FirstNameTextBox" 
        ErrorMessage="Numbers not allowed!" ForeColor="Red" 
        ValidationExpression="^[a-zA-Z\s]+$"></asp:RegularExpressionValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
        ErrorMessage="Required" ControlToValidate="FirstNameTextBox" 
        BorderColor="Red" ForeColor="Red"></asp:RequiredFieldValidator>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
        ErrorMessage="Required" ControlToValidate="LastNameTextBox" 
        ForeColor="Red"></asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" 
        ControlToValidate="LastNameTextBox" ErrorMessage="Numbers not allowed!" 
        ForeColor="Red" ValidationExpression="^[a-zA-Z\s]+$"></asp:RegularExpressionValidator>
    </td>
    </tr>
    <tr>
    <td>
        <asp:Label ID="Label1" runat="server" Text="User Name:"></asp:Label>
        </td><td>
            <asp:TextBox ID="UserNameTextBox" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" 
                ControlToValidate="UserNameTextBox" ErrorMessage="numbers not allowed!" 
                ForeColor="Red"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
    <td style="height: 35px">
        <asp:Label ID="Label2" runat="server" Text="Password:"></asp:Label>
        </td><td style="height: 35px">
            <asp:TextBox ID="PasswordTextBox" runat="server" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" 
                ControlToValidate="PasswordTextBox" 
                ErrorMessage="password should not be blank!" ForeColor="Red"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
    <td>
        <asp:Label ID="Label3" runat="server" Text="Retype Password:"></asp:Label>
        </td><td>
            <asp:TextBox ID="ReTypePasswordTextBox" runat="server" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator20" runat="server" 
                ControlToValidate="ReTypePasswordTextBox" 
                ErrorMessage="Retype password should not be blank!" ForeColor="Red"></asp:RequiredFieldValidator>
            <asp:CompareValidator ID="CompareValidator1" runat="server" 
                ControlToCompare="PasswordTextBox" ControlToValidate="ReTypePasswordTextBox" 
                ErrorMessage="password should be same" ForeColor="Red"></asp:CompareValidator>
        </td>
    </tr>
<tr><td><label>Address-1</label></td>
<td style="width:98px">
    <asp:TextBox ID="Address1TextBox" runat="server" Width="184px"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
        ErrorMessage="Required" ControlToValidate="Address1TextBox" 
        ForeColor="Red"></asp:RequiredFieldValidator>
    </td>
</tr>
<tr><td><label>Address-2</label></td>
<td style="width: 98px">
    <asp:TextBox ID="Address2TextBox" runat="server" Width="187px"></asp:TextBox>
    </td>
</tr>
<tr>
<td><label>Email-id</label></td>
<td style="width: 98px">
    <asp:TextBox ID="EmailIDTextBox" runat="server"></asp:TextBox>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
        ErrorMessage="Invalid ID " 
        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
        ControlToValidate="EmailIDTextBox" ForeColor="Red"></asp:RegularExpressionValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
        ErrorMessage="Required" ControlToValidate="EmailIDTextBox" ForeColor="Red"></asp:RequiredFieldValidator>
    </td>
</tr>
<tr>
<td style="height: 55px">State</td>
<td style="height: 55px; width: 98px;">
        <asp:DropDownList ID="StateDropDownList" runat="server" AutoPostBack="True">
            <asp:ListItem>mh</asp:ListItem>
            <asp:ListItem>mp</asp:ListItem>
        </asp:DropDownList>
    </td>

<td style="width: 125px; height: 55px">
    <label>City:</label></td>
<td style="width: 178px; height: 55px;">
    <asp:DropDownList ID="CityDropDownList" runat="server">
        <asp:ListItem>mumbai</asp:ListItem>
        <asp:ListItem>pune</asp:ListItem>
    </asp:DropDownList>
    </td>
    <td> : <label>ZIP:</label></td>
    <td> 
        <asp:TextBox ID="ZipTextBox" runat="server"></asp:TextBox>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
        ErrorMessage="Zipcode invalid!" ValidationExpression="\d{6}" 
        ControlToValidate="ZipTextBox" ForeColor="Red"></asp:RegularExpressionValidator>
    </td>
    </tr>

<tr><td><label>Home phone:</label></td>
<td style="width: 98px">
    <asp:TextBox ID="HomePhoneTextBox" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
        ErrorMessage="Required" ControlToValidate="HomePhoneTextBox" 
        ForeColor="Red"></asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" 
        ControlToValidate="HomePhoneTextBox" ErrorMessage="Home Phone invalid!" 
        ForeColor="Red" ValidationExpression="\d{10}"></asp:RegularExpressionValidator>
    </td>

<td style="width: 125px"><label>CELL:</label></td>
<td style="width: 178px">
    <asp:TextBox ID="CellTextBox" runat="server"></asp:TextBox>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" 
        ControlToValidate="CellTextBox" ErrorMessage="Cell No invalid! " ForeColor="Red" 
        ValidationExpression="\d{10}"></asp:RegularExpressionValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" 
        ControlToValidate="CellTextBox" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>
    </td>
</tr>

<tr><td><label>Driving license:</label></td>
<td style="width: 98px">
    <asp:TextBox ID="DrivingLiscenseTextBox" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
        ControlToValidate="DrivingLiscenseTextBox" ErrorMessage="Required" 
        ForeColor="Red"></asp:RequiredFieldValidator>
    </td>

<td style="width: 125px"><label>Issued by</label></td>
<td style="width: 178px">
    <asp:TextBox ID="DLIssuedByTextBox" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" 
        ControlToValidate="DLIssuedByTextBox" ErrorMessage="Required" 
        ForeColor="Red"></asp:RequiredFieldValidator>
    </td>

<td><label>Valid through:</label></td>
<td style="width: 170px">
    <asp:TextBox ID="DLValidThroughTextBox" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" 
        ControlToValidate="DLValidThroughTextBox" ErrorMessage="Required" 
        ForeColor="Red"></asp:RequiredFieldValidator>
    </td>
</tr>

<tr><td style="height: 55px"><label>IDP NO:</label></td>
<td style="height: 55px; width: 98px">
    <asp:TextBox ID="IDPNoTextBox" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
        ControlToValidate="IDPNoTextBox" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>
    </td>

<td style="width: 125px; height: 55px;"><label>Issued by:</label></td>
<td style="width: 178px; height: 55px;">
    <asp:TextBox ID="INIssuedByTextBox" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" 
        ControlToValidate="INIssuedByTextBox" ErrorMessage="Required" 
        ForeColor="Red"></asp:RequiredFieldValidator>
    </td>

<td style="height: 55px"><label>Valid through:</label></td>
<td style="height: 55px; width: 170px">
    <asp:TextBox ID="INValidThroughTextBox" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" 
        ControlToValidate="INValidThroughTextBox" ErrorMessage="Required" 
        ForeColor="Red"></asp:RequiredFieldValidator>
    </td>
</tr>

<tr><td><label>Passport No:</label></td>
<td style="width: 98px">
    <asp:TextBox ID="PassportNoTextBox" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" 
        ControlToValidate="PassportNoTextBox" ErrorMessage="Required" 
        ForeColor="Red"></asp:RequiredFieldValidator>
    </td>

<td style="width: 125px"><label>Issued by:</label></td>
<td style="width: 178px">
    <asp:TextBox ID="PNIssuedByTextBox" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" 
        ControlToValidate="PNIssuedByTextBox" ErrorMessage="Required" 
        ForeColor="Red"></asp:RequiredFieldValidator>
    </td>

<td><label>Valid through:</label></td>
<td style="width: 170px">
    <asp:TextBox ID="PNValidThroughTextBox" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" 
        ControlToValidate="PNValidThroughTextBox" ErrorMessage="Required" 
        ForeColor="Red"></asp:RequiredFieldValidator>
    </td>
</tr>

<tr><td><label>Birth date:</label></td>
<td style="width: 98px">
    <asp:TextBox ID="BirthDateTextBox" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
        ControlToValidate="BirthDateTextBox" ErrorMessage="Required" 
        ForeColor="Red"></asp:RequiredFieldValidator>
    </td>

<td style="width: 125px"><label>Preffered car type:</label></td>
<td style="width: 178px">
    <asp:DropDownList ID="PrefferedCarDropDownList" runat="server">
        <asp:ListItem>small</asp:ListItem>
        <asp:ListItem>compact</asp:ListItem>
    </asp:DropDownList>
&nbsp;</td>
</tr>

<tr><td>&nbsp;</td>
<td style="width: 98px">
    &nbsp;</td>

<td style="width: 125px">
    <asp:Button ID="SubmitButton" runat="server" Text="Submit" 
        onclick="SubmitButton_Click" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td style="width: 178px">
    <asp:Button ID="CancelButton" runat="server" Text="Cancel" />
    
    </td>
</tr>

</table>
<br/>
<br/>


</div>
    </form>
    <script type="text/javascript">

        $(function () {
            $("#ContentPlaceHolder1_DLIssuedByTextBox").datepicker({
                defaultDate: "+1w",
                changeMonth: true,
                changeYear: true,
                onClose: function (selectedDate) {
                    $("#ContentPlaceHolder1_DLValidThroughTextBox").datepicker("option", "minDate", selectedDate);
                }
            });

            $("#ContentPlaceHolder1_DLValidThroughTextBox").datepicker({
                defaultDate: "+1w",
                changeMonth: true,
                changeYear: true,
                onClose: function (selectedDate) {
                    $("#ContentPlaceHolder1_DLIssuedByTextBox").datepicker("option", "maxDate", selectedDate);
                }
            });
        });

        $(function () {
            $("#ContentPlaceHolder1_INIssuedByTextBox").datepicker({
                defaultDate: "+1w",
                changeMonth: true,
                changeYear: true,
                onClose: function (selectedDate) {
                    $("#ContentPlaceHolder1_INValidThroughTextBox").datepicker("option", "minDate", selectedDate);
                }
            });

            $("#ContentPlaceHolder1_INValidThroughTextBox").datepicker({
                defaultDate: "+1w",
                changeMonth: true,
                changeYear: true,
                onClose: function (selectedDate) {
                    $("#ContentPlaceHolder1_INIssuedByTextBox").datepicker("option", "maxDate", selectedDate);
                }
            });
        });

        $(function () {
            $("#ContentPlaceHolder1_PNIssuedByTextBox").datepicker({
                defaultDate: "+1w",
                changeMonth: true,
                changeYear: true,
                onClose: function (selectedDate) {
                    $("#ContentPlaceHolder1_PNValidThroughTextBox").datepicker("option", "minDate", selectedDate);
                }
            });

            $("#ContentPlaceHolder1_PNValidThroughTextBox").datepicker({
                defaultDate: "+1w",
                changeMonth: true,
                changeYear: true,
                onClose: function (selectedDate) {
                    $("#ContentPlaceHolder1_PNIssuedByTextBox").datepicker("option", "maxDate", selectedDate);
                }
            });
        });
        $(function () {
            $("#ContentPlaceHolder1_BirthDateTextBox").datepicker({
                defaultDate: "+1w",
                changeMonth: true,
                changeYear: true,
        });

        });
</script>
</asp:Content>