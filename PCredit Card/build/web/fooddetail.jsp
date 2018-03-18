<%-- 
    Document   : fooddetail
    Created on : 8 Mar, 2013, 8:32:19 PM
    Author     : sony
--%>

<%@ page session="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% String s[] = new String[10];
    String na[] = {"Rice", "", "Dal", "", "Wheat", "", "Sugar", "", "Salt", ""};
    s[0] = request.getParameter("qrice");
    s[1] = request.getParameter("rprice");
    s[2] = request.getParameter("qdal");
    s[3] = request.getParameter("dprice");
    s[4] = request.getParameter("qwheat");
    s[5] = request.getParameter("wprice");
    s[6] = request.getParameter("qsugar");
    s[7] = request.getParameter("sprice");
    s[8] = request.getParameter("qsalt");
    s[9] = request.getParameter("saprice");
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
    if (gender.equals("1")) {
        gender = "Male";
    } else {
        gender = "Female";
    }
    String total;
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Food Details</title>
    </head>
    <body>
        <form name="fooddetails" action="card.jsp" method="post">
            <center>
                <h1>Food Details</h1><br>
                <hr><br>
                <table border="1" width="50%" cellspacing="10" cellpadding="0">
                    <% float j = 0;
                        for (int i = 0; i < 9; i++) {
                            if (s[i] != null) {
                    %>
                    <tr>
                        <td><%= na[i]%></td>
                        <td><%= s[i++] + "Kg"%></td>
                        <td>Price</td>
                        <td><% j = j + Float.parseFloat(s[i]);%><%= s[i]%></td>
                    </tr>
                    <%} else
                                i++;
                        }
                        total = j + "";%>
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
            <input type="hidden" name="total" value="<%= total%>">
            <input type="hidden" name="state" value="gr">
            <input type="hidden" name="mname" value="Food Bazaar">
        </form>
    </body>
</html>