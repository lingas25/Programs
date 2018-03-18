using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for StaffLogin
/// </summary>
public class StaffLogin
{
    string _userName;
    string _password;
    string _hubCode;


    public string UserName
    {
        get { return _userName; }
        set { _userName = value; }
    }

    public string Password
    {
        get { return _password; }
        set { _password = value; }
    }
    

    public string HubCode
    {
        get { return _hubCode; }
        set { _hubCode = value; }
    }


	public StaffLogin()
	{
		//
		// TODO: Add constructor logic here
		//
	}
}