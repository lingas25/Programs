using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for CarType
/// </summary>
public class CarDetails
{
    int _carTypeId;
    string _carType;
    string _url;
    int _daily;
    int _monthly;
    int _weekly;
    int _noOfCars;
    public int Weekly
    {
        get { return _weekly; }
        set { _weekly = value; }
    }

    public int Monthly
    {
        get { return _monthly; }
        set { _monthly = value; }
    }

    public int Daily
    {
        get { return _daily; }
        set { _daily = value; }
    }
    public string Url
    {
        get { return _url; }
        set { _url = value; }
    }
    public int CarTypeId
    {
        get { return _carTypeId; }
        set { _carTypeId = value; }
    }
    public string CarType
    {
        get { return _carType; }
        set { _carType = value; }
    }
    public int NoOfCars {
        get { return _noOfCars; }
        set { _noOfCars = value;  }
    }
	public CarDetails()
	{
		//
		// TODO: Add constructor logic here
		//
	}
}