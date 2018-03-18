function buycheck()
{
	var flag=0;
	f=document.frm;
	alert(f);
	alert(f.ch);
	for(i=0;i<f.ch.length;i++)
	{
		if(f.ch[i].checked)
		{
			flag=1;
			break;
		}
	}
	if(flag==0)
		return false;
	return true;
}