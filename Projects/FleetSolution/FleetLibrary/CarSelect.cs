using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for CarSelect
/// </summary>
public class CarSelect
{
    string _carNo;
    int _carModelId;
    string _hubCode;
    string _status;
    decimal _fuelLevel;
    string _purchasedOn;
    string _lastServiceDate;

    public string LastServiceDate
    {
        get { return _lastServiceDate; }
        set { _lastServiceDate = value; }
    }

    public string CarNo
    {
        get { return _carNo; }
        set { _carNo = value; }
    }

    public int CarModelId
    {
        get { return _carModelId; }
        set { _carModelId = value; }
    }

    public string HubCode
    {
        get { return _hubCode; }
        set { _hubCode = value; }
    }

    public string Status
    {
        get { return _status; }
        set { _status = value; }
    }

    public decimal FuelLevel
    {
        get { return _fuelLevel; }
        set { _fuelLevel = value; }
    }

    public string PurchasedOn
    {
        get { return _purchasedOn; }
        set { _purchasedOn = value; }
    }

	public CarSelect()
	{
		//
		// TODO: Add constructor logic here
		//
	}
}