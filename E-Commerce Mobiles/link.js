var a
function link(str)
{
	a=geto();
	var url="link.php";
	url=url+"?q="+str;

	a.open("GET",url,true);
	a.onreadystatechange=function()
			{
			if(a.readyState==4 && a.status==200)
			{
				if(a.responseText== "logout")
					window.open("index.html","_self");
				else
					 document.getElementById('cr').innerHTML=a.responseText;
			}
	}
	a.send(null); 
}

function geto()
{
var b=null;
	if(window.XMLHttpRequest)
	{
		b=new XMLHttpRequest();
	}
	else if(window.ActiveXObject)
	{
		b=new ActiveXObject(Microsoft.XMLHTTP);
	}
return b;
}