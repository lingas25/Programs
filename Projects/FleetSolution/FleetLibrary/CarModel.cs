using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for CarModel
/// </summary>
public class CarModel
{
    int _carModelID;
    string _modelName;
    string _brandName;
    int _totalCars;
    int _carTypeID;

    public int CarTypeID
    {
        get { return _carTypeID; }
        set { _carTypeID = value; }
    }
    

    public int TotalCars
    {
        get { return _totalCars; }
        set { _totalCars = value; }
    }

    public string BrandName
    {
        get { return _brandName; }
        set { _brandName = value; }
    }
    public int CarModelID
    {
        get { return _carModelID; }
        set { _carModelID = value; }
    }
    public string ModelName
    {
        get { return _modelName; }
        set { _modelName = value; }
    }
	public CarModel()
	{
		//
		// TODO: Add constructor logic here
		//
	}
}