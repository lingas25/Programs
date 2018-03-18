var a;
function refre()
{
a=get();

a.open("GET","refresh.php",true);
a.onreadystatechange=function()
	{
	
		if(a.readyState==4 && a.status==200)
		{
				if(a.responseText!="logout")
				{
					document.getElementById('cr').innerHTML=a.responseText;
					document.getElementById("lgot").style.display="inline";
				}
		}
	}
	a.send(null); 
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