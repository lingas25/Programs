<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Careers.aspx.cs" Inherits="Careers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form id="form2" runat="server">
    <p>
        <span style="font-size:15pt;">Careers with India drive: Always a step ahead.</span></p>
    <p style="text-align: center;">
        <span style="font-size:15pt;">We see the whole picture.</span></p>
    <p>
        If you are looking for a new opportunity, India Drive could open up a whole new 
        world for you, both nationally and internationally. Founded in 1912 by Martin 
        Sixt, India Drive was one of the world’s first car rental companies. Today, we 
        remain one of the most innovative providers in the industry.<br />
        <br />
        India Drive is a global player with the mindset to match: no limits. India Drive 
        combines global expertise with local presence, and we are always on the lookout 
        for great candidates to strengthen our team. Come and discover the world with 
        us.</p>
    <table style="width: 100%">
        <tr>
            <td>
                CareerId:</td>
            <td>
                <asp:TextBox ID="CareerIdTextBox" runat="server" 
                    ontextchanged="CareerIdTextBox_TextChanged" Width="167px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                Name:</td>
            <td>
                <asp:TextBox ID="NameTextBox" runat="server" Width="167px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                Email:</td>
            <td>
                <asp:TextBox ID="EmailTextBox" runat="server" Width="163px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                Phone:</td>
            <td>
                <asp:TextBox ID="PhoneTextBox" runat="server" Width="162px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                Position for job:</td>
            <td>
                <asp:TextBox ID="PositionForJobTextBox" runat="server" Width="161px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                Highest qualification:</td>
            <td>
                <asp:DropDownList ID="QualificationDropDownList" runat="server">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>
                Resume:</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
    <p>
    </p>
    <p>
    </p>
    </form>
</asp:Content>

