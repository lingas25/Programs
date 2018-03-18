<%-- 
    Document   : transpass
    Created on : 10 Mar, 2013, 12:39:25 PM
    Author     : sony
--%>

<%@page session="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String cardno = (String) session.getAttribute("Card Number");
    String cname = (String) session.getAttribute("Name on Card");
    String date = (String) session.getAttribute("Expiry");
    String total = (String) session.getAttribute("Total");
    int attempt = Integer.parseInt((String) session.getAttribute("Attempt"));
    String cardnumb = "XXXXXXXXXXXX"+cardno.substring(cardno.length()-4);
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Password</title>
    </head>
    <body>
        <form name="pay" action="TransPassword" onsubmit="return check(this);" method="post">
    <center>
        <h1>Password</h1><hr><br>
        <h2>Payment Details</h2><hr><br>
        <% if(attempt>0) {%>
        <h3>Password Entered is wrong Re-Enter</h3>
        <% }%>
        <table>
            <tr>
                <td>Name on Card</td>
                <td><%= cname%></td>
            </tr>
            <tr>
                <td>Card No</td>
                <td><%= cardnumb%></td>
            </tr>
            <tr>
                <td>Expiry</td>
                <td><%= date%></td>
            </tr>
            <tr>
                <td>Amount</td>
                <td><%= total%></td>
            </tr>            
            <tr>
                <td>Password</td>
                <td><input type="password" name="password"></td>
            </tr>
        </table><br>
            <input type="submit" value="Pay">
    </center>
            </form>
    </body>
</html>
