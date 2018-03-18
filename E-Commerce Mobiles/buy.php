<!DOCTYPE HTML>
<html>
<head>
<script src="login.js"></script>
<script src="link.js"></script>
<script src="buy.js"></script>
<script src="search.js"></script>
	<title>Welcome to The Incredibles Mobile Shopping</title>

		<script type="text/javascript">
			function chan(i)
			{
				i++;
				if(i==7)
					i=1;
				f=document.frm;
				document.getElementById("navil").innerHTML="<img src='img/"+i+".jpg'/>";
				setTimeout("chan("+i+")",3000);	
			}
</script>
<style>
.ou{ float:right;height:498px;width:1125px;}
.page{width:100%; height:100%;margin:0px 0px 0px 0px;color:#ffffff;}
.banner1{height:140px;color:#69c9d4;}
.banner2{height:50px;}
.menu {width:450px;}
hr{border:4px solid #69C9D4;}		
.menu li {padding:0 15px 23px 15px; display:inline; list-style:none;}
.menu li a:hover { color: #55A4AE;}
.menu li.current_page_item a {background-color:#4EB1BA; padding:6px 11px; letter-spacing:-1px; 
font: bold 0.89em'CartoGothicStdBook',  Arial, Helvetica, sans-serif; text-transform: uppercase; 
color: #fff; -moz-border-radius: 7px;  -webkit-border-radius: 7px;   border-radius: 7px;}
.menu li a {color: #eee;  font: bold 0.89em 'SansationRegular', georgia; text-transform: uppercase; text-decoration: none; }
#su{ color: #000000;}
.Connect { float:left; color: #000000; font:  1.4em   Arial, Helvetica, sans-serif; margin-top:0.8em; margin-bottom:1.3em; text-shadow: 1px 1px 0  #092f37;} 
#SocialLinks {width:520px; float:right; margin-top:1.3em; margin-right:0;}		
#SocialLinks li {padding:0 0px 23px 29px; display:inline; list-style:none;  }		
#SocialLinks a:hover { color: #fff; text-shadow: 1px 1px 0  #092f37;  }
#SocialLinks  li a {color: #092f37; text-shadow: 1px 1px 0  #7DDAEE;  font: 1.2em 'SansationBold', "Trebuchet MS", Arial, Helvetica, sans-serif; text-transform: uppercase; text-decoration: none; letter-spacing:-1px;}
.copyright{ clear: both; text-align: center; color: #000000; font: 13px  Verdana, Arial, Helvetica, sans-serif; margin-bottom: 15px ;} 
.container{height:500px;margin:0px 0px 0px 0px; color:#000000}
.navil{float:left;height:500px;width:200px;}
.navir{float:right;height:497px;width:300px;}
.footer{ background:#69c9d4;height:70px;margin:0px 0px 0px 0px;}
.wid{width:100px}	
a{text-decoration:none;color:#0a82c5}
body{background: #f0f8ff;}
#Logo { width:270px;}
</style>
</head>
<body>
<div class="page">
<div class="bg">
<div class="banner1" align="center"><img src="img/banner.jpg" />
</div>
<hr/>
<center>
<div class="menu">
<ul>
<li class="current_page_item"><td><a href="javascript:link('home')">Home</a></td></li>
<li  class="current_page_item"><td><a href="javascript:link('contact')">Contact Us</a></td></li>
<li  class="current_page_item"><td><a href="javascript:link('product')">Products</a></td></li>
<li  class="current_page_item" id="lgot"><td><a href="logout.php">Logout</a></td></li>
</ul>
</div>
</center>
<hr/>
<div class="container">
<div class="navil" id="navil"></div>
<div class="ou" id="cr">
<?php
session_start();
$sum=0;
$p=$_GET['ch'];
$n=count($p);
echo "<center><h1>Bill</h1><br/><h3>";
$con = mysql_connect("localhost","root","");
mysql_select_db("mobile", $con);
echo "you have purchased ";
$nam=$_SESSION['uname'];


for($i=0;$i<$n;$i++)
{
	$sql=mysql_query("select * from product where mid='$p[$i]'");
	$row = mysql_fetch_array($sql);
	echo $row['mname'].", ";
	$sum=$sum+$row['price'];
	$prod=$prod.$row['mname'].", ";
	
} 

echo ".<br/> You have to pay Rs.".$sum." at the time of product delivery";
$str="insert into bill(name,product,amount) values('$nam','$prod','$sum')"; 
echo "<br/><br/><i>Thank You. Visit Us Again.</i></h3></center>";
mysql_query($str,$con);
mysql_close($con);
?>

</div>

	
</div>
<div class="footer" align="center"><div class="ContentArea">
<p class="Connect">Lets Connect</p>
<ul id="SocialLinks">
 
        <li><a href="mailto:myfone@gmail.com">Email</a></li>          
        <li><a href="http://twitter.com/myfone">Twitter </a></li>
		<li><a href="http://facebook.com/my.fone">Facebook </a> </li>
        <li><a href="http://pinterest.com/myfone/"> Pinterest </a> </li>
	    </ul>
		
<div class="copyright">Copyright ©2013 Personal Website of myfone. All rights reserved.	Powered by the Wordpress. </div>
</div>
</div>
</div>
</div>
	<script type="text/javascript">
		chan(0);
	</script>
</body>
</html>