function check()
{ 
	flag=0;
	f=document.frm;
	if(f.cname.value.length==0)
	{	
		document.getElementById("t1").innerHTML="PLEASE ENTER COMPANY NAME";
		flag=1;
	}		 
	if(f.mid.value.length==0)
	{
		document.getElementById("t2").innerHTML="PLEASE ENTER MOBILE ID";
		flag=1;
	}
	if(f.moname.value.length==0)
	{
		document.getElementById("t3").innerHTML="PLEASE ENTER MODEL NAME";
		flag=1;
	}
	if(f.price.value.length==0)
	{
		document.getElementById("t4").innerHTML="PLEASE ENTER PRICE";
		flag=1;
	}
	if(f.image.value.length==0)
	{
		document.getElementById("t5").innerHTML="PLEASE SELECT YOUR PATH";
		flag=1;
	}
	
	if(flag==1)
		return false;
	
	return true;
}
function cle()
{	

f=document.frm;

document.getElementById("t1").innerHTML="                  ";
document.getElementById("t2").innerHTML="                  ";
document.getElementById("t3").innerHTML="                  ";
document.getElementById("t4").innerHTML="                  ";
document.getElementById("t5").innerHTML="                  ";
document.frm.cname.value="";
document.frm.mid.value="";
document.frm.moname.value="";
document.frm.image.value="";
document.frm.price.value="";
}


function onfo()
{
document.getElementById("t1").innerHTML="                  ";
}

function onfo1()
{

document.getElementById("t2").innerHTML="                  ";
}

function onfo2()
{

document.getElementById("t3").innerHTML="                  ";
}
function onfo3()
{

document.getElementById("t4").innerHTML="                  ";
}
function onfo4()
{

document.getElementById("t5").innerHTML="                  ";
}