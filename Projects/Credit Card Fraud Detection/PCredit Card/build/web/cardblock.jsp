<%-- 
    Document   : cardblock
    Created on : 10 Mar, 2013, 12:35:26 PM
    Author     : sony
--%>

<%@page session="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String cardno = (String) session.getAttribute("Card Number");
    String cname = (String) session.getAttribute("Name on Card");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Card Block</title>
    </head>
    <body>
    <center>
        <h1>Card Blocked</h1><hr><br>
        <h2>Card Details</h2>
        <table>
            <tr>
                <td>Card No</td>
                <td><%= cardno%></td>
            </tr>
            <tr>
                <td>Name on Card</td>
                <td><%= cname%></td>
            </tr>
        </table><br>
        <h2>Your Card is being Blocked</h2>
    </center>
</body>
</html>
