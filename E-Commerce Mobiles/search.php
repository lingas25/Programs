<?php
$nm=$_GET['q'];

$con=mysql_connect("localhost","root","");
$c=mysql_select_db("mobile",$con);

$q="select * from product where brand like '$nm%' or mid like '$nm'";
$res=mysql_query($q,$con);

echo "<form action='buy.php'>";
echo "<center><table border='2' cellspacing='10'>";
echo "<tr>";
echo "<th>Company Name</th>";
echo "<th>Mobile Id</th>";
echo "<th>Model Name</th>";
echo "<th>Price</th>";
echo "<th>Image</th>";
echo "<th>CheckBox</th>";
echo "</tr>";

while($row=mysql_fetch_array($res))
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
	echo "</table><br/><br/><input type='submit' value='Buy' /></center></form>";

mysql_close($con);
?>
