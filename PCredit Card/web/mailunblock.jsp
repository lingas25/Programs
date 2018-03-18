<%-- 
    Document   : mailunblock
    Created on : 9 Mar, 2013, 1:19:54 PM
    Author     : sony
--%>

<%@ page session="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Card Unblock</title>
        <script type= "text/javascript" src="card.js"></script>
    </head>
    <body>
        <form name="creditcard" action="Unblock" onsubmit="return check(this);" method="post">
            <center>
                <h1>ADLV Bank</h1>
                <hr><br>
                <h2>Card Details</h2>
                <table cellspacing="20">
                    <tr>
                        <td>Credit Card No</td>
                        <td><input type="text" name="cardno" id="cardno" maxlength="16" onblur="changeimage(this);"><img src="images/1.jpg" name="cimage"></td>
                    </tr>
                    <tr>
                        <td>Expiry Date</td>
                        <td><SELECT name="m">
                                <OPTION SELECTED value="0">
                                <OPTION value="1">Jan<OPTION value="2">Feb<OPTION value="3">Mar<OPTION value="4">Apr<OPTION value="5">May<OPTION value="6">Jun
                                <OPTION value="7">Jul<OPTION value="8">Aug<OPTION value="9">Sep<OPTION value="10">Oct<OPTION value="11">Nov<OPTION value="12">Dec
                            </SELECT>
                            <SELECT name="y">
                                <OPTION SELECTED value="0">
                                <OPTION value="2013">2013<OPTION value="2014">2014<OPTION value="2015">2015<OPTION value="2016">2016<OPTION value="2017">2017
                                <OPTION value="2018">2018<OPTION value="2019">2019<OPTION value="2020">2020<OPTION value="2021">2021<OPTION value="2022">2022                                                
                            </SELECT></td>
                    </tr>
                    <tr>
                        <td>Name on Card</td>
                        <td><input type="text" name="cname"></td>
                    </tr>
                    <tr>
                        <td>CVV</td>
                        <td><input type="text" name="cvvno" maxlength="3"></td>
                    </tr>
                    <tr>
                        <td>Code</td>
                        <td><input type="text" name="code"></td>
                    </tr>
                </table>
                <input type="submit" value="submit">
            </center>
        </form>
    </body>
</html>
