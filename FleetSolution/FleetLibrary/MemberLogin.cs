using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for MemberLogin
/// </summary>
public class MemberLogin
{
    int _memberID;
    int _memberNo;
    string _password;

    public int MemberID
    {
        get { return _memberID; }
        set { _memberID = value; }
    }

    public int MemberNo
    {
        get { return _memberNo; }
        set { _memberNo = value; }
    }
    

    public string Password
    {
        get { return _password; }
        set { _password = value; }
    }

	public MemberLogin()
	{

		//
		// TODO: Add constructor logic here
		//
	}
}