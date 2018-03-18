<%-- 
    Document   : limit
    Created on : 7 Jun, 2013, 12:13:50 AM
    Author     : sony
--%>

<%@page session="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% response.setHeader("Refresh", "10;url=card.jsp"); %>.
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Transaction Failed</title>
    </head>
    <body>
    <center>
        <h1>Transaction Failed</h1><hr><br>
        <h2>The page will be automatically rediredted in 10sec</h2></br>
        <h2>Your Card limit is Exceeded</h2><br>
        <h2>To enjoy Shopping please pay your bill</h2><br>
        <h2>amount before the due date</h2><br>
    </center>
    </body>
</html>

