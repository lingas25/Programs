<?php
		$key=$_REQUEST['key'];
		$us=$_REQUEST['user'];
		$con = mysql_connect("localhost","root","");
	
		if (!$con)
		{
			die('Could not connect: ' . mysql_error());
			echo "err";
		}
		mysql_select_db("mobile", $con);

		if($key==1)
		{
			$str="SELECT USERID FROM login where userid like '$us'";
		
			$result=mysql_query($str,$con);
			$row=mysql_fetch_array($result);
			if($row['USERID'])
			{
				echo "ID already exists";
			}
			else
				echo "ID available!";
		}
		else
		{
			$name=$_POST['name'];
			$passw=$_POST['passw'];
			$str="insert into login(userid,	name,password,type) values('$us','$name','$passw','U')";
			echo "<center><h2>Detail Info</h2><br/>";	
			echo "<h3>Your Page will be Redirected to Home Page</h3><br/>";
			if(mysql_query($str,$con))
			{
				echo "<h3>Account is Created Successfully<br/>";
				echo "Thank You</h3>";
			}
			else
			{
				echo "<h3>Account Cannot be Created due to Inconvienence<br/>";
				echo "Try After Sometime</h3>";
			}
			echo "</center>";
		}

		mysql_close($con);
?>
