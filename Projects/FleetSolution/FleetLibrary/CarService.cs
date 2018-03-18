using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for CarService
/// </summary>
public class CarService
{
    string _carNo;
    string _serviceDate;
    string _returnDate;

    public string ReturnDate
    {
        get { return _returnDate; }
        set { _returnDate = value; }
    }

    public string CarNo
    {
        get { return _carNo; }
        set { _carNo = value; }
    }

    public string ServiceDate
    {
        get { return _serviceDate; }
        set { _serviceDate = value; }
    }
	public CarService()
	{
		//
		// TODO: Add constructor logic here
		//
	}
}