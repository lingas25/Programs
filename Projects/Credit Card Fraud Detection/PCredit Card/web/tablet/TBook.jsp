<%-- 
    Document   : TBook
    Created on : 7 Mar, 2013, 5:27:15 PM
    Author     : sony
--%>

<%@ page session="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% String model = request.getParameter("model");
    String storage = request.getParameter("storage");
    String price = request.getParameter("price");
    String product = request.getParameter("product");
    String firstname = request.getParameter("firstname");
    String lastname = request.getParameter("lastname");
    String dob = request.getParameter("d");
    dob = dob + "/" + request.getParameter("m");
    dob = dob + "/" + request.getParameter("y");
    String email = request.getParameter("email");
    String add = request.getParameter("add");
    String mob = request.getParameter("mob");
    String age = request.getParameter("age");
    String gender = request.getParameter("gender");
    if(gender.equals("1"))
        gender="Male";
    else
        gender="Female";
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Plane Book Details</title>
    </head>
    <body>
        <form name="pdetails" action="../card.jsp" method="post">
            <center>
                <h1>Details</h1><br>
                <hr><br>
                <table border="1" width="50%" cellspacing="10" cellpadding="0">
                    <tr>
                        <td>Model</td>
                        <td><%= model %></td>
                        <td>Product</td>
                        <td><%= product %></td>
                    </tr>                
                    <tr>
                        <td>Price</td>
                        <td><%= price %></td>
                        <td>Storage</td>
                        <td><%= storage %></td>                        
                    </tr>
                    <tr>
                        <td>First Name</td>
                        <td><%= firstname%></td>
                        <td>Last Name</td>
                        <td><%= lastname%></td>
                    </tr>
                    <tr>
                        <td>Gender</td>
                        <td><%= gender%></td>
                        <td>Age</td>
                        <td><%= age%></td>
                    </tr>
                    <tr>
                        <td>Mobile</td>
                        <td><%= mob%></td>
                        <td>Email</td>
                        <td><%= email%></td>
                    </tr>
                </table><br>
                <input type="Submit" value="Pay">
            </center>
                    <input type="hidden" name="total" value="<%= price%>">
            <input type="hidden" name="state" value="el">
            <input type="hidden" name="mname" value="Tablet Shop">
        </form>
    </body>
</html>