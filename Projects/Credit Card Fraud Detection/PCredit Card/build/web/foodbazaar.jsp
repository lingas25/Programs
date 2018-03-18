<%-- 
    Document   : foodbazaar
    Created on : 7 Mar, 2013, 6:50:02 PM
    Author     : sony
--%>

<%@ page session="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Food Bazaar</title>
        <script type= "text/javascript" src = "foodbazar.js"></script>
    </head>
    <body>
        <form name="foods" action="fooddetail.jsp" onsubmit="return check(this);" method="post">
            <center>
                <h1>Food Bazaar</h1>
                <hr><br>
                <h2>Food Details</h2>
                <table cellspacing="20">
                    <tr>
                        <td>Rice</td>
                        <td><input type="checkbox" name="rice" value="rice" onclick="funrice(this);"></td>
                        <td>Quantity</td>
                        <td><select name="qrice" id="qrice" onchange="funqrice();">
                                <option value="1">1Kg</option>
                                <option value="2">2Kg</option>
                                <option value="3">3Kg</option>
                            </select></td>
                        <td>Price</td>
                        <td><input type="text" name="rprice" readonly="true"></td>
                    </tr>
                    <tr>
                        <td>Dal</td>
                        <td><input type="checkbox" name="dal" value="dal" onclick="fundal(this);"></td>
                        <td>Quantity</td>
                        <td><select name="qdal" id="qdal" onchange="funqdal();">
                                <option value="1">1Kg</option>
                                <option value="2">2Kg</option>
                                <option value="3">3Kg</option>
                            </select></td>
                        <td>Price</td>
                        <td><input type="text" name="dprice" readonly="true"></td>
                    </tr>
                    <tr>
                        <td>Wheat</td>
                        <td><input type="checkbox" name="wheat" value="wheat" onclick="funwheat(this);"></td>
                        <td>Quantity</td>
                        <td><select name="qwheat" id="qwheat" onchange="funqwheat();">
                                <option value="1">1Kg</option>
                                <option value="2">2Kg</option>
                                <option value="3">3Kg</option>
                            </select></td>
                        <td>Price</td>
                        <td><input type="text" name="wprice" readonly="true"></td>
                    </tr>
                    <td>Sugar</td>
                    <td><input type="checkbox" name="sugar" value="sugar" onclick="funsugar(this);"></td>
                    <td>Quantity</td>
                    <td><select name="qsugar" id="qsugar" onchange="funqsugar();">
                            <option value="1">1Kg</option>
                            <option value="2">2Kg</option>
                            <option value="3">3Kg</option>
                        </select></td>
                    <td>Price</td>
                    <td><input type="text" name="sprice" readonly="true"></td>
                    </tr>
                    <td>Salt</td>
                    <td><input type="checkbox" name="salt" value="salt" onclick="funsalt(this);"></td>
                    <td>Quantity</td>
                    <td><select name="qsalt" id="qsalt" onchange="funqsalt();">
                            <option value="1">1Kg</option>
                            <option value="2">2Kg</option>
                            <option value="3">3Kg</option>
                        </select></td>
                    <td>Price</td>
                    <td><input type="text" name="saprice" readonly="true"></td>
                    </tr>
                </table><br>
                <hr><br>
                <h2>Personal Information</h2>
                <table cellspacing="20">
                    <tr>
                        <td>First name :</td>
                        <td><input type="text" name="firstname"></td>
                        <td>Last name :</td>
                        <td><input type="text" name="lastname"></td>
                    </tr>
                    <tr>
                        <td>Date of Birth :</td>
                        <td><SELECT name="d">
                                <OPTION SELECTED value="0">
                                <OPTION value="1">1<OPTION value="2">2<OPTION value="3">3<OPTION value="4">4<OPTION value="5">5<OPTION value="6">6
                                <OPTION value="7">7<OPTION value="8">8<OPTION value="9">9<OPTION value="10">10<OPTION value="11">11<OPTION value="12">12
                                <OPTION value="13">13<OPTION value="14">14<OPTION value="15">15<OPTION value="16">16<OPTION value="17">17<OPTION value="18">18
                                <OPTION value="19">19<OPTION value="20">20<OPTION value="21">21<OPTION value="22">22<OPTION value="23">23<OPTION value="24">24
                                <OPTION value="25">25<OPTION value="26">26<OPTION value="27">27<OPTION value="28">28<OPTION value="29">29<OPTION value="30">30
                                <OPTION value="31">31</SELECT>
                            <SELECT name="m">
                                <OPTION SELECTED value="0">
                                <OPTION value="1">Jan<OPTION value="2">Feb<OPTION value="3">Mar<OPTION value="4">Apr<OPTION value="5">May<OPTION value="6">Jun
                                <OPTION value="7">Jul<OPTION value="8">Aug<OPTION value="9">Sep<OPTION value="10">Oct<OPTION value="11">Nov<OPTION value="12">Dec
                            </SELECT>
                            <SELECT name="y">
                                <OPTION SELECTED value="0">
                                <OPTION value="1984">1984<OPTION value="1985">1985<OPTION value="1986">1986<OPTION value="1987">1987<OPTION value="1988">1988
                                <OPTION value="1989">1989<OPTION value="1990">1990<OPTION value="1991">1991<OPTION value="1992">1992<OPTION value="1993">1993
                                <OPTION value="1994">1994<OPTION value="1995">1995<OPTION value="1996">1996<OPTION value="1997">1997<OPTION value="1998">1998
                                <OPTION value="1999">1999<OPTION value="2000">2000<OPTION value="2001">2001<OPTION value="2002">2002
                            </SELECT> </td>
                        <td>Email :</td>
                        <td><input type="text" name="email" id="email" onblur="return checkEmail();"></td>
                    </tr>
                    <tr>
                        <td>Address :</td>
                        <td><input type="text" name="add"></td>
                        <td>Mobile :</td>
                        <td><input type="text" name="mob" maxlength="10"></td>
                    </tr>
                    <tr>
                        <td>Age :</td>
                        <td><input type="text" name="age" maxlength="2"></td>
                        <td>Gender :</td>
                        <td><SELECT name="gender">
                                <OPTION SELECTED value="0">
                                <OPTION value="1">Male<OPTION value="2">Female
                            </SELECT></td>
                    </tr>
                </table></br>
                <input type="submit" value="Submit"><br>
                <script language="JavaScript">
            start();
                </script>
            </center>            
        </form>        
    </body>
</html>
