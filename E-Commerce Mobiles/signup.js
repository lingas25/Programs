var user="";
function check()
{
	flag=0;
	f=document.frm;
	if(f.t1.value.length==0)
	{	
		document.getElementById("d1").innerHTML="PLEASE ENTER YOUR NAME";
		flag=1;
	}		 
	if(f.t2.value.length==0)
	{
		document.getElementById("d2").innerHTML="PLEASE ENTER YOUR USER ID";
		flag=1;
	}
	if(f.t2.value==user)
	{
		document.getElementById("d2").innerHTML="PLEASE ENTER DIFFERENT USER ID";
		flag=1;
	}
	if(f.t3.value.length==0)
	{
		document.getElementById("d3").innerHTML="PLEASE ENTER VALID PASSWORD";
		flag=1;
	}
	if(flag==1)
		return;
	userinsert();
}

function userinsert()
{
	name=document.frm.t1.value;
	user=document.frm.t2.value;
	passw=document.frm.t3.value;
	xmlreq=loadxmlobj();
	xmlreq.onreadystatechange= usercret;
	url="key="+2+"&user="+user+"&name="+name+"&passw="+passw;
	xmlreq.open("POST","signup.php",true);
	xmlreq.setRequestHeader('Content-Type','application/x-www-form-urlencoded'); 
	xmlreq.send(url);
}
			
function cle()
{	

f=document.frm;

document.getElementById("d1").innerHTML="                  ";
document.getElementById("d2").innerHTML="                  ";
document.getElementById("d3").innerHTML="                  ";
document.frm.t1.value="";
document.frm.t2.value="";
document.frm.t3.value="";
}


function onfo()
{
document.getElementById("d1").innerHTML="                  ";
}

function onfo1()
{

document.getElementById("d2").innerHTML="                  ";
}

function onfo2()
{

document.getElementById("d3").innerHTML="                  ";
}

function usercheck()
{
	user=document.frm.t2.value;
	xmlreq=loadxmlobj();
	xmlreq.onreadystatechange= loadfile;
	xmlreq.open("GET","signup.php?key="+1+"&user="+user);
	xmlreq.send(null);
}
function loadxmlobj()
{
	xmlreq=null;
	try
	{
		xmlreq=new XMLHttpRequest();
	}
	catch(e)
	{
		try
		{
			xmlreq=new ActiveXObject();
		}
		catch(e)
		{
			alert("Object Cannot be Created");
		}
	}
	return xmlreq;
}
function loadfile()
{
	if(xmlreq.readyState==4 && xmlreq.status==200)
	{
		document.getElementById('d2').innerHTML=xmlreq.responseText;
		if(xmlreq.responseText=="ID available!")
			user="";
	}
}
function usercret()
{
	if(xmlreq.readyState==4 && xmlreq.status==200)
	{
		document.getElementById('cent').innerHTML=xmlreq.responseText;
		setTimeout('Redirect()', 5000);
	}
}
function Redirect()
{
    window.location="index.html";
}






