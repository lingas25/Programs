<%-- 
    Document   : sony
    Created on : 3 Mar, 2013, 9:17:16 PM
    Author     : sony
--%>

<%@ page session="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sony Tablet</title>
        <script type="text/javascript" src="../menu/dmenu.js"></script>
        <noscript><link type="text/css" href="../menu/style.css" rel="stylesheet"></noscript>
        <style>
            *{margin: 0px;
              padding:0px}
            </style>  
            <script type= "text/javascript" src = "sony.js"></script>
        </head>
        <body>
            <form method="post" action="TDetails.jsp" name="sony">
                <table width="100%" cellpadding="0" cellspacing="10">
                    <tr>
                        <td width="100%" align="center">
                            <table width="1200px" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td height="20px" bgcolor="#C0D7E8">
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" height="33px" valign="top" style="background: url(../menu/normal_back.png) repeat-x">
                                    <!-- Deluxe Menu -->
                                    <!-- Code for Deluxe Menu Items. Generated by Deluxe Tuner -->
                                    <ul id="blueMenu">
                                        <li class="istylei0"><a href="../tablet.jsp">Home</a></li>
                                        <li class="istylei0"><a href="tabdetails.jsp">Products</a></li>
                                        <li class="istylei0"><a href="software.jsp">Software</a></li>
                                        <li class="istylei0"><a href="support.jsp">Support</a>                                            
                                        <li class="istylei0"><a href="contact.jsp">Contact Us</a></li>
                                    </ul>
                                    <!-- End of Code for Deluxe Menu Items -->
                                    <script type="text/javascript" src="../menu/data.js"></script>
                                </td>
                            </tr>
                            <tr>
                                <td height="10px" bgcolor="#649DC8" style='font-size: 1px;'>
                                </td>
                            </tr>                            
                        </table>
                    </td>
                </tr>
            </table>
            <center>
                <img src="../images/sony.jpg" height="150" width="200"/>
                </br></br>                
                <img src="../images/SonyTablet.jpg" height="300" width="600">&nbsp;&nbsp;
                <img src="../images/SonyTablet1.jpg" height="300" width="600"></br></br>     
                <img src="../images/sonytab.jpg">&nbsp;&nbsp;&nbsp;&nbsp;
                <img src="../images/sonytabpro.jpg"></br></br>
                <hr></br></br>
                <table>
                    <tr>
                        <td>Model </td>
                        <td><select onchange="print_storage('storage', this.selectedIndex);prices();" id="model" name ="model"></select></td>
                    </tr>
                    <tr>
                        <td>Storage</td>
                        <td><select name ="storage" id ="storage" onchange="prices();"></select></td>
                    </tr>      
                    <tr>
                        <td>Price</td>
                        <td><input type="text" name="price" id="price" readonly="true"></td>
                    </tr>
                </table></br></br>
                <input type="submit" value="Submit"></br></br>
                <script language="javascript">print_model("model");
                            print_storage("storage", 0);
                            prices();</script>
            </center>        
                <input type="hidden" name="product" value= "Sony">
        </form>
    </body>
</html>
