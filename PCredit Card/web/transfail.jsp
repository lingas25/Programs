<%-- 
    Document   : transfail
    Created on : 10 Mar, 2013, 11:55:26 AM
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
        <h2>Re-Enter your Card Details Properly</h2><br>
        <h2>Your Card may be blocked</h2><br>
        <h2>Please Check your Mail and Mobile</h2><br>
    </center>
    </body>
</html>
