using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Members
/// </summary>
public class Members
{
    string _memberID;
    string _firstName;
    string _lastName;
    string _password;
    string _birthDate;
    string _address1;
    string _address2;
    string _emailID;
    string _city;
    int _zip;
    string _state;
    long _phone;
    long _mobile;
    string _dLicense;
    string _dlIssuedBy;
    string _dlValidThrough;
    string _idpNo;
    string _inIssuedBy;
    string _inValidThru;
    string _passportNo;
    string _pnIssuedBy;
    string _pnValidThru;
    string _preferredCarType;

    public string MemberID
    {
        get { return _memberID; }
        set { _memberID = value; }
    }
    

    public string FirstName
    {
        get { return _firstName; }
        set { _firstName = value; }
    }
    

    public string LastName
    {
        get { return _lastName; }
        set { _lastName = value; }
    }

    public string Password
    {
        get { return _password; }
        set { _password = value; }
    }
    public string BirthDate
    {
        get { return _birthDate; }
        set { _birthDate = value; }
    }
    

    public string Address1
    {
        get { return _address1; }
        set { _address1 = value; }
    }
    

    public string Address2
    {
        get { return _address2; }
        set { _address2 = value; }
    }
    

    public string EmailID
    {
        get { return _emailID; }
        set { _emailID = value; }
    }
    

    public string City
    {
        get { return _city; }
        set { _city = value; }
    }
    

    public int Zip
    {
        get { return _zip; }
        set { _zip = value; }
    }
    

    public string State
    {
        get { return _state; }
        set { _state = value; }
    }
    
    public long Phone
    {
        get { return _phone; }
        set { _phone = value; }
    }
   
    public long Mobile
    {
        get { return _mobile; }
        set { _mobile = value; }
    }
   

    public string DLicense
    {
        get { return _dLicense; }
        set { _dLicense = value; }
    }
    

    public string DlIssuedBy
    {
        get { return _dlIssuedBy; }
        set { _dlIssuedBy = value; }
    }
    

    public string DLValidThrough
    {
        get { return _dlValidThrough; }
        set { _dlValidThrough = value; }
    }


    public string IdpNo
    {
        get { return _idpNo; }
        set { _idpNo = value; }
    }
    

    public string IdpIssuedBy
    {
        get { return _inIssuedBy; }
        set { _inIssuedBy = value; }
    }
    
    public string InValidThru
    {
        get { return _inValidThru; }
        set { _inValidThru = value; }
    }

    

    public string PassportNo
    {
        get { return _passportNo; }
        set { _passportNo = value; }
    }
    

    public string PnIssuedBy
    {
        get { return _pnIssuedBy; }
        set { _pnIssuedBy = value; }
    }
    

    public string PnValidThru
    {
        get { return _pnValidThru; }
        set { _pnValidThru = value; }
    }
   

    public string PreferredCarType
    {
        get { return _preferredCarType; }
        set { _preferredCarType = value; }
    }

	public Members()
	{
		//
		// TODO: Add constructor logic here
		//
	}
}