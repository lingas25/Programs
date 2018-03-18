using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for AddOnSelected
/// </summary>
public class AddOnSelected
{
    int _addOnSelectedId;
    int _addOnId;
    int _pricePerDay;

    public AddOnSelected()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public int AddOnSelectedId
    {
        get { return _addOnSelectedId; }
        set { _addOnSelectedId = value; }
    }
    public int AddOnId
    {
        get { return _addOnId; }
        set { _addOnId = value; }
    }
    public int PricePerDay1
    {
        get { return _pricePerDay; }
        set { _pricePerDay = value; }
    }
	
}