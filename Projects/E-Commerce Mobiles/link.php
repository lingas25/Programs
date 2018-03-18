<?php
session_start();
$l=$_GET['q'];
if($l=="product")
{
$con = mysql_connect("localhost","root","");
mysql_select_db("mobile", $con);
$result = mysql_query("SELECT * FROM product");
echo "<form action='buy.php' name='frm'>";
echo "<center><table border='2' cellspacing='10'>";
echo "<tr>";
echo "<th>Company Name</th>";
echo "<th>Mobile Id</th>";
echo "<th>Model Name</th>";
echo "<th>Price</th>";
echo "<th>Image</th>";
echo "<th>CheckBox</th>";
echo "</tr>";

while($row=mysql_fetch_array($result))
{
	echo "<tr>";
	echo "<td>"; echo $row['brand']; echo "</td>";
	echo "<td>"; echo $row['mid']; echo "</td>";
	echo "<td>"; echo $row['mname']; echo "</td>";
	echo "<td>"; echo $row['price']; echo "</td>";
	echo "<td>"; echo "<img width='50' height='50' src='".$row['image']."'>"; echo "</td>";
	echo "<td>"; echo "<input type='checkbox' name='ch[]' value='".$row['mid']."'/>"; echo "</td>";
	echo "</tr>";
}
if($_SESSION['utype']=='E' || $_SESSION['utype']=='U')
	echo "</table><br/><br/><input type='submit' value='Buy' /></form></center>";
else
	echo "</table><br/><br/></form></center>";
mysql_close($con);
}
else if($l=="contact")
{

include "contact.html";
}
else if($l=="home")
{
	if($_SESSION['utype']=="U")
	{
		include "search.html";
	}
	else if($_SESSION['utype']=="E")
	{
		include "mob.html";
	}
	else 
	{
		session_destroy();
		echo "logout";
	}
}


?>