<?php
session_start();
$p=$_POST['p'];
$u=$_POST['u'];


$con = mysql_connect("localhost","root","");
mysql_select_db("mobile", $con);


$result = mysql_query("SELECT * FROM login where userid='$u' and password='$p'");

$row = mysql_fetch_array($result);
$ut=$row['type'];
if($row)
{
$_SESSION['uname']=$u;
$_SESSION['utype']=$ut;
if($_SESSION['utype']=="U")
{
	include "search.html";
}
else
{
	include "mob.html";
}
}
else
{
echo "enter correct username and password";
}
mysql_close($con); 
?>