<?php
	$cname=$_POST['cname'];
	$mid=$_POST['mid'];
	$moname=$_POST['moname'];
	$price=(int)$_POST['price'];
	$str="uploaded/".$mid.".jpg";
	move_uploaded_file($_FILES['image']['tmp_name'],$str);
	$con = mysql_connect("localhost","root","");
	mysql_select_db("mobile", $con);
	$qur="insert into product(mid,mname,brand,image,price) values('$mid','$moname','$cname','$str',$price)";
	mysql_query($qur);
echo <<<end
<!DOCTYPE html>
<html>
   <head></head>
   <body>
     <img style="width: 100%;" src="$str?v=<?php echo rand(0,1000) // rand() prevents the browser from displaying a previously cached image ?>"/>
   </body>
</html>
end;
?>