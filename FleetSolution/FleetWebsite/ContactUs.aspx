<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ContactUs.aspx.cs" Inherits="map" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<html>
<head>

<img src="map.jpg" usemap = #imgmap border=0/>
<map name=imgmap>
<area shape=Rect Coords=72,302,98,326 Href="mumbai.aspx" Target="a">
<area shape=Rect Coords=100,65,134,90 Href="jandk.aspx" Target="b" >
<area shape=Rect Coords=88,346,114,312 Href="Pune.aspx" Target="b">
<area shape=Rect Coords=138,178,168,151 Href="Delhi.aspx" Target="b">
<area shape=Rect Coords=339,258,318,283 Href="Kolkata.aspx" Target="b">
</map>


</head>
</html>

</asp:Content>

