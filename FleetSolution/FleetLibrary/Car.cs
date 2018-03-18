using System;
using System.Collections.Generic;
using System.Collections;
using System.Linq;
using System.Web;
using System.Data.SqlClient;

/// <summary>
/// Summary description for Car
/// </summary>
public class Car
{
    SqlConnection _carConnection;
    SqlCommand _carCommand;
    SqlDataReader _carReader;
    public Car()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public List<CarDetails> GetCarData()
    {
        CarDetails carDetails = new CarDetails();
        _carConnection = new SqlConnection("Data Source=.; Initial Catalog=Fleet; Integrated Security=true;");
        _carCommand = new SqlCommand("select cartypeid, count(cartypeid)'Count' from carmodel,carselect where carmodel.carmodelid=carselect.carmodelid and hubcode='I1'and carselect.Status='Available'group by cartypeid", _carConnection);
        _carConnection.Open();
        _carReader = _carCommand.ExecuteReader();

        Hashtable hashTable = new Hashtable();
        while (_carReader.Read())
            hashTable.Add(_carReader.GetInt32(0), _carReader.GetInt32(1));
        _carConnection.Close();

        _carCommand = new SqlCommand("select * from cartype", _carConnection);
        _carConnection.Open();
        _carReader = _carCommand.ExecuteReader();
        List<CarDetails> list = new List<CarDetails>();
        while (_carReader.Read())
        {
            carDetails = new CarDetails();
            carDetails.CarTypeId = _carReader.GetInt32(0);
            carDetails.CarType = _carReader.GetString(1);
            carDetails.Url = _carReader.GetString(2);
            carDetails.Daily = _carReader.GetInt32(3);
            carDetails.Monthly = _carReader.GetInt32(4);
            carDetails.Weekly = _carReader.GetInt32(5);
            if (hashTable[_carReader.GetInt32(0) as object] != null)
                carDetails.NoOfCars = (int)hashTable[_carReader.GetInt32(0) as object];
            list.Add(carDetails);
        }
        _carConnection.Close();
        return list;
    }
}
