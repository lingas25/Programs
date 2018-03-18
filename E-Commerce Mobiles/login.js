var a;
function validate(f)
{
	var u=f.u.value;
	var p=f.pw.value;
	if(u=="")
	{
		document.getElementById('vu').innerHTML="type usernme";
	}
	if(p=="")
	{
		document.getElementById('vpw').innerHTML="type pssword";
	}
	if(p!="" && u!="")
	{
		login(f);
	}
}
function login(fr)
{
var u=fr.u.value;
var p=fr.pw.value;
a=get();

a.open("POST","login.php",true);
a.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
a.onreadystatechange=function()
	{
	
		if(a.readyState==4 && a.status==200)
		{
		
			if(a.responseText=="enter correct username and password")
			{
				document.getElementById('vpw').innerHTML=a.responseText;
				document.getElementById('vu').innerHTML="";
			}
			else
			{ 
				document.getElementById('cr').innerHTML=a.responseText;
				document.getElementById("lgot").style.display="inline";
			}
		}
	}
	a.send("u="+u+"&p="+p); 
}
function get()
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