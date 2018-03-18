<?php
	session_start();

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
		echo "logout";
	}
?>