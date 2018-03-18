using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace FleetLibrary
{
    public class FleetDL
    {
        SqlConnection _fleetCon;
        SqlCommand _fleetCMD;
        DataTable AirportTable;

        public FleetDL()
        {
            try
            {
                _fleetCon = new SqlConnection("Data Source=.; Initial Catalog=Fleet; Integrated Security=true;");
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.StackTrace);
            }
        } 

        public List<State> GetState()
        {
            _fleetCMD = new SqlCommand("select * from State", _fleetCon);
            _fleetCon.Open();
            List<State> stateCollection = new List<State>();
            SqlDataReader stateReader = _fleetCMD.ExecuteReader();
            while (stateReader.Read())
            {

                int stateID = (int)stateReader.GetValue(0);

                string stateName = (string)stateReader.GetValue(1);
                stateCollection.Add(new State { StateID = stateID, StateName = stateName });
            }
            stateReader.Close();
            _fleetCon.Close();
            return stateCollection;
        }

        #region GetCity
        public List<City> GetCity(string state)
        {
            _fleetCon.Open();
            _fleetCMD = new SqlCommand("select StateID from State where StateName='" + state + "' order by StateName", _fleetCon);
            SqlDataReader stateReader = _fleetCMD.ExecuteReader();
            stateReader.Read();
            int stateID = stateReader.GetInt32(0);
            stateReader.Close();

            _fleetCMD = new SqlCommand("select * from City where StateID=" + stateID + "order by CityName", _fleetCon);

            List<City> cityCollection = new List<City>();
            SqlDataReader cityReader = _fleetCMD.ExecuteReader();
            while (cityReader.Read())
            {
                int cityId = cityReader.GetInt32(0);
                int stateId = cityReader.GetInt32(1);
                string cityName = cityReader.GetString(2);
                cityCollection.Add(new City { CityID = cityId, StateID = stateId, CityName = cityName });
            }
            cityReader.Close();
            _fleetCon.Close();
            return cityCollection;
        }
        #endregion

        #region GetAddOns
        public List<AddOn> GetAddons()
        {
            _fleetCMD = new SqlCommand("select * from Addon", _fleetCon);
            _fleetCon.Open();
            List<AddOn> addOnCollection = new List<AddOn>();
            SqlDataReader addonReader = _fleetCMD.ExecuteReader();
            while (addonReader.Read())
            {
                int addID = (int)addonReader.GetValue(0);
                string addName = (string)addonReader.GetValue(1);
                int pricePerDay = addonReader.GetInt32(2);
                addOnCollection.Add(new AddOn { AddonID = addID, Name = addName, PricePerDay = pricePerDay });
            }
            _fleetCon.Close();
            return addOnCollection;
        } 
        #endregion

        #region GetAirport
        public DataTable GetAirport(string city)
        {
            SqlDataAdapter fleetAdapt = new SqlDataAdapter("select * from Airports where HubCode in (select HubCode from Hub where City='" + city + "')", _fleetCon);
            AirportTable = new DataTable();
            fleetAdapt.Fill(AirportTable);
            return AirportTable;

        }
        #endregion

        public List<Hub> GetHubs(string city)
        {
            List<Hub> hubCollection = new List<Hub>();
            _fleetCMD = new SqlCommand("select * from Hub where City='" + city + "'", _fleetCon);
            _fleetCon.Open();
            SqlDataReader hubReader = _fleetCMD.ExecuteReader();
            while (hubReader.Read())
            {
                hubCollection.Add(new Hub { HubCode = hubReader.GetString(0), Name = hubReader.GetString(1), Address = hubReader.GetString(2), Phone = hubReader.GetInt32(3), Sun = hubReader.GetString(4), MonFri = hubReader.GetString(5), Sat = hubReader.GetString(6), City = hubReader.GetString(7) });
            }
            hubReader.Close();
            return hubCollection;
        }

        public Hub GetHubsIDWise(string hubcode)
        {
    
            _fleetCMD = new SqlCommand("select * from Hub where HubCode='" + hubcode + "'", _fleetCon);
            _fleetCon.Open();
            SqlDataReader hubReader = _fleetCMD.ExecuteReader();
           hubReader.Read();
             Hub h=   new Hub { HubCode = hubReader.GetString(0), Name = hubReader.GetString(1), Address = hubReader.GetString(2), Phone = hubReader.GetInt32(3), Sun = hubReader.GetString(4), MonFri = hubReader.GetString(5), Sat = hubReader.GetString(6), City = hubReader.GetString(7) };
            hubReader.Close();
            _fleetCon.Close();
            return h;
        }

        public bool AddMemberDetail(Members memberInfo)
        {
            bool success = false;
            try
            {
                _fleetCon.Open();

                //_fleetCMD = new SqlCommand("INSERT INTO Members(FirstName,LastName,Address1,Address2,EmailId,State,City,Zip,homePhone,Mobile,DrivingLicenseNo,DIssuedBy,DValidThrough,IdpNo,IdpIssuedBy,IDPValidThrough,PassportNo,PIssuedBy,PValidThrough,BirthDate,PreferredCar) VALUES('dsa','asd','pune','mumbai','a@a.com','maha','pune',123456,1234567890,1232123652,'12ds12','2020-12-12','2012-12-12','fgdg23','2020-12-12','2020-12-12','131sxs','2020-12-12','2020-12-12','2020-12-12','compact');", _fleetCon);

                SqlCommand _fleetCMD = new SqlCommand("INSERT INTO Members(FirstName,LastName,MemberID,Password,Address1,Address2,EmailId,State,City,Zip,homePhone,Mobile,DrivingLicenseNo,DIssuedBy,DValidThrough,IdpNo,IdpIssuedBy,IDPValidThrough,PassportNo,PIssuedBy,PValidThrough,BirthDate,PreferredCar) VALUES(@FirstName,@LastName,@UserName,@Password,@Address1,@Address2,@EmailId,@State,@City,@Zip,@Phone,@Mobile,@DLicenseNo,@DIssuedBy,@DLicenseValidThrough,@IdpNo,@IdpIssuedBy,@IdpValidThrough,@PassportNo,@PIssuedBy,@PValidThrough,@BirthDate,@PreferredCar)", _fleetCon);

                _fleetCMD.Parameters.AddWithValue("@FirstName", memberInfo.FirstName);
                _fleetCMD.Parameters.AddWithValue("@LastName", memberInfo.LastName);
                _fleetCMD.Parameters.AddWithValue("@UserName", memberInfo.MemberID);
                _fleetCMD.Parameters.AddWithValue("@Password", memberInfo.LastName);
                _fleetCMD.Parameters.AddWithValue("@Address1", memberInfo.Address1);
                _fleetCMD.Parameters.AddWithValue("@Address2", memberInfo.Address2);
                _fleetCMD.Parameters.AddWithValue("@EmailId", memberInfo.EmailID);
                _fleetCMD.Parameters.AddWithValue("@State", memberInfo.State);
                _fleetCMD.Parameters.AddWithValue("@City", memberInfo.City);
                _fleetCMD.Parameters.AddWithValue("@Zip", memberInfo.Zip);
                _fleetCMD.Parameters.AddWithValue("@Phone", memberInfo.Phone);
                _fleetCMD.Parameters.AddWithValue("@Mobile", memberInfo.Mobile);
                _fleetCMD.Parameters.AddWithValue("@DLicenseNo", memberInfo.DLicense);
                _fleetCMD.Parameters.AddWithValue("@DIssuedBy", memberInfo.DlIssuedBy);
                _fleetCMD.Parameters.AddWithValue("@DLicenseValidThrough", memberInfo.DLValidThrough);
                _fleetCMD.Parameters.AddWithValue("@IdpNo", memberInfo.IdpNo);
                _fleetCMD.Parameters.AddWithValue("@IdpIssuedBy", memberInfo.IdpIssuedBy);
                _fleetCMD.Parameters.AddWithValue("@IdpValidThrough", memberInfo.InValidThru);
                _fleetCMD.Parameters.AddWithValue("@PassportNo", memberInfo.PassportNo);
                _fleetCMD.Parameters.AddWithValue("@PIssuedBy", memberInfo.PnIssuedBy);
                _fleetCMD.Parameters.AddWithValue("@PValidThrough", memberInfo.PnValidThru);
                _fleetCMD.Parameters.AddWithValue("@BirthDate", memberInfo.BirthDate);
                _fleetCMD.Parameters.AddWithValue("@PreferredCar", memberInfo.PreferredCarType);

                if (_fleetCMD.ExecuteNonQuery() > 0)
                {
                    success = true;
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.StackTrace);
            }
            finally
            {
                _fleetCon.Close();
            }

            return success;
        }

        public string GetStaffHubCode(string staffUserName)
        {
            _fleetCMD = new SqlCommand("select HubCode from StaffLogin where UserName='" + staffUserName + "'", _fleetCon);
            _fleetCon.Open();
            string staffHubCode = (string)_fleetCMD.ExecuteScalar();
            return staffHubCode;
        } 

        public CarType GetCarTypeObject(int carTypeID)
        {
            string str = "select * from CarType where CarTypeID=" + carTypeID;
            _fleetCMD = new SqlCommand(str, _fleetCon);
            _fleetCon.Open();
             SqlDataReader CarReader = _fleetCMD.ExecuteReader();
             CarReader.Read();
             CarType ct = new CarType { CarTypeId = CarReader.GetInt32(0), CarType1 = CarReader.GetString(1), Url = CarReader.GetString(2), Daily = CarReader.GetInt32(3), Monthly = CarReader.GetInt32(4), Weekly = CarReader.GetInt32(5) };
             _fleetCon.Close();
            return ct;
        } 

        public int GetCarTypeID(string carTypeName)
        {
            string str = "select CarTypeID from CarType where CarType='" + carTypeName + "'";
            _fleetCMD = new SqlCommand(str, _fleetCon);
            _fleetCon.Open();
            int n = Convert.ToInt32(_fleetCMD.ExecuteScalar());
            return n;
        } 

        public Members OnLoginSuccess(string MemberID)
        {
            Members memberObj = new Members();
            try
            {
                _fleetCon.Open();

                _fleetCMD = new SqlCommand("select * from Members where MemberID='" + MemberID + "'", _fleetCon);
                SqlDataReader memberinfo = _fleetCMD.ExecuteReader();
                while (memberinfo.Read())
                {
                    memberObj.MemberID = MemberID;
                    memberObj.FirstName = memberinfo["FirstName"].ToString();
                    memberObj.LastName = memberinfo["LastName"].ToString();
                    memberObj.Address1 = memberinfo["Address1"].ToString();
                    memberObj.Address2 = memberinfo["Address2"].ToString();
                    memberObj.EmailID = memberinfo["EmailId"].ToString();
                    memberObj.State = memberinfo["State"].ToString();
                    memberObj.City = memberinfo["City"].ToString();
                    memberObj.Zip = Convert.ToInt32(memberinfo["Zip"]);
                    memberObj.Phone = Convert.ToInt64(memberinfo["HomePhone"]);
                    memberObj.Mobile = Convert.ToInt64(memberinfo["Mobile"]);
                    memberObj.DLicense = memberinfo["DrivingLicenseNo"].ToString();
                    memberObj.DlIssuedBy = memberinfo["DIssuedBy"].ToString();
                    memberObj.DLValidThrough = memberinfo["DValidThrough"].ToString();
                    memberObj.IdpNo = memberinfo["IDPNo"].ToString();
                    memberObj.IdpIssuedBy = memberinfo["IDPIssuedBy"].ToString();
                    memberObj.InValidThru = memberinfo["IDPValidThrough"].ToString();
                    memberObj.PassportNo = memberinfo["PassportNo"].ToString();
                    memberObj.PnIssuedBy = memberinfo["PIssuedBy"].ToString();
                    memberObj.PnValidThru = memberinfo["PValidThrough"].ToString();
                    memberObj.BirthDate = memberinfo["BirthDate"].ToString();
                }
                memberinfo.Close();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.StackTrace);
            }
            finally
            {
                _fleetCon.Close();
            }

            return memberObj;
        }

        public AddOn GetAddOnObject(int addOnId)
        {
            AddOn ao = null;
            try
            {
                _fleetCMD = new SqlCommand("select * from Addon where AddonID=" + addOnId, _fleetCon);
                _fleetCon.Open();
                SqlDataReader addonReader = _fleetCMD.ExecuteReader();
                addonReader.Read();
                ao= new AddOn { AddonID = addonReader.GetInt32(0), Name = addonReader.GetString(1), PricePerDay = addonReader.GetInt32(2) };
                _fleetCon.Close();
            }
            catch (Exception ex2)
            {

                Console.WriteLine(ex2.StackTrace);
            }
            return ao;
        }

        public bool AddBookingDetails(BookingDetails bookingCustInfo)
          {
              bool success = false;
              SqlCommand _fleetCMD = null;
              try
              {
                  _fleetCon.Open();
                  //_fleetCMD = new SqlCommand("INSERT INTO BookingDetails(CarTypeID,Daily,Weekly,Monthly,MemberID,PickDate,PickTime,PickAt,ReturnDate,ReturnTime,ReturnAt,EstimatedAmount,FirstName,LastName,Address1,Address2,EmailId,State,City,Zip,Phone,Mobile,DLicenseNo,DIssuedBy,DLicenseValidThrough,IdpNo,IdpIssuedBy,IDPValidThru,PassportNo,PIssued_by,PValidThru,BirthDate) VALUES(1,12,78,200,'kj','2014-2-2','8:00am','l1','2014-2-2','8:00pm','l1',350,'dsa','asd','pune','mumbai','a@a.com','maha','pune',123456,1234567890,1232123652,'12ds12','2020-12-12','2012-12-12','fgdg23','2020-12-12','2020-12-12','131sxs','2020-12-12','2020-12-12','2020-12-12')", _fleetCon);
                  if (bookingCustInfo.MemberID != null)
                  {
                      _fleetCMD = new SqlCommand("INSERT INTO BookingDetails(CarTypeID,Daily,Weekly,Monthly,MemberID,BookingDate,PickDate,PickTime,PickAt,ReturnDate,ReturnTime,ReturnAt,EstimatedAmount,FirstName,LastName,Address1,Address2,EmailId,State,City,Zip,Phone,Mobile,DLicenseNo,DIssuedBy,DLicenseValidThrough,IdpNo,IdpIssuedBy,IDPValidThru,PassportNo,PIssued_by,PValidThru,BirthDate) VALUES(@CarTypeID,@Daily,@Weekly,@Monthly,@MemberID,@BookingDate,@PickDate,@PickTime,@PickAt,@ReturnDate,@ReturnTime,@ReturnAt,@EstimatedAmount,@FirstName,@LastName,@Address1,@Address2,@EmailId,@State,@City,@Zip,@Phone,@Mobile,@DLicenseNo,@DIssuedBy,@DLicenseValidThrough,@IdpNo,@IdpIssuedBy,@IdpValidThrough,@PassportNo,@PIssuedBy,@PValidThrough,@BirthDate)", _fleetCon);
                  }
                  else
                  {
                      _fleetCMD = new SqlCommand("INSERT INTO BookingDetails(CarTypeID,Daily,Weekly,Monthly,BookingDate,PickDate,PickTime,PickAt,ReturnDate,ReturnTime,ReturnAt,EstimatedAmount,FirstName,LastName,Address1,Address2,EmailId,State,City,Zip,Phone,Mobile,DLicenseNo,DIssuedBy,DLicenseValidThrough,IdpNo,IdpIssuedBy,IDPValidThru,PassportNo,PIssued_by,PValidThru,BirthDate) VALUES(@CarTypeID,@Daily,@Weekly,@Monthly,@BookingDate,@PickDate,@PickTime,@PickAt,@ReturnDate,@ReturnTime,@ReturnAt,@EstimatedAmount,@FirstName,@LastName,@Address1,@Address2,@EmailId,@State,@City,@Zip,@Phone,@Mobile,@DLicenseNo,@DIssuedBy,@DLicenseValidThrough,@IdpNo,@IdpIssuedBy,@IdpValidThrough,@PassportNo,@PIssuedBy,@PValidThrough,@BirthDate)", _fleetCon);
                  }
                  _fleetCMD.Parameters.AddWithValue("@CarTypeID", bookingCustInfo.CarTypeID);
                  _fleetCMD.Parameters.AddWithValue("@Daily", bookingCustInfo.Daily);
                  _fleetCMD.Parameters.AddWithValue("@Weekly", bookingCustInfo.Weekly);
                  _fleetCMD.Parameters.AddWithValue("@Monthly", bookingCustInfo.Monthly);
                  if (bookingCustInfo.MemberID != null)
                      _fleetCMD.Parameters.AddWithValue("@MemberID", bookingCustInfo.MemberID);
                  _fleetCMD.Parameters.AddWithValue("@BookingDate", bookingCustInfo.BookingDate);
                  _fleetCMD.Parameters.AddWithValue("@PickDate", bookingCustInfo.PickDate);
                  _fleetCMD.Parameters.AddWithValue("@PickTime", bookingCustInfo.PickTime);
                  _fleetCMD.Parameters.AddWithValue("@PickAt", bookingCustInfo.PickAt);
                  _fleetCMD.Parameters.AddWithValue("@ReturnDate", bookingCustInfo.ReturnDate);
                  _fleetCMD.Parameters.AddWithValue("@ReturnTime", bookingCustInfo.ReturnAt);
                  _fleetCMD.Parameters.AddWithValue("@ReturnAt", bookingCustInfo.ReturnTime);
                  _fleetCMD.Parameters.AddWithValue("@EstimatedAmount", bookingCustInfo.EstimatedAmount);
                  _fleetCMD.Parameters.AddWithValue("@FirstName", bookingCustInfo.FirstName);
                  _fleetCMD.Parameters.AddWithValue("@LastName", bookingCustInfo.LastName);
                  _fleetCMD.Parameters.AddWithValue("@Address1", bookingCustInfo.Address1);
                  _fleetCMD.Parameters.AddWithValue("@Address2", bookingCustInfo.Address2);
                  _fleetCMD.Parameters.AddWithValue("@EmailId", bookingCustInfo.EmailId);
                  _fleetCMD.Parameters.AddWithValue("@State", bookingCustInfo.State);
                  _fleetCMD.Parameters.AddWithValue("@City", bookingCustInfo.City);
                  _fleetCMD.Parameters.AddWithValue("@Zip", bookingCustInfo.Zip);
                  _fleetCMD.Parameters.AddWithValue("@Phone", bookingCustInfo.Phone);
                  _fleetCMD.Parameters.AddWithValue("@Mobile", bookingCustInfo.Mobile);
                  _fleetCMD.Parameters.AddWithValue("@DLicenseNo", bookingCustInfo.DLicenseNo);
                  _fleetCMD.Parameters.AddWithValue("@DIssuedBy", bookingCustInfo.DIssuedBy);
                  _fleetCMD.Parameters.AddWithValue("@DLicenseValidThrough", bookingCustInfo.DLicenseValidThrough);
                  _fleetCMD.Parameters.AddWithValue("@IdpNo", bookingCustInfo.IdpNo);
                  _fleetCMD.Parameters.AddWithValue("@IdpIssuedBy", bookingCustInfo.IdpIssuedBy);
                  _fleetCMD.Parameters.AddWithValue("@IdpValidThrough", bookingCustInfo.IdpValidThrough);
                  _fleetCMD.Parameters.AddWithValue("@PassportNo", bookingCustInfo.PassportNo);
                  _fleetCMD.Parameters.AddWithValue("@PIssuedBy", bookingCustInfo.PIssuedBy);
                  _fleetCMD.Parameters.AddWithValue("@PValidThrough", bookingCustInfo.PValidThrough);
                  _fleetCMD.Parameters.AddWithValue("@BirthDate", bookingCustInfo.BirthDate);

                  if (_fleetCMD.ExecuteNonQuery() > 0)
                  {
                      success = true;
                  }
              }
              catch (Exception ex)
              {
                  Console.WriteLine(ex.ToString());
              }
              finally
              {
                  _fleetCon.Close();
              }

              return success;
          }

        public bool AddSelectedAddons(List<AddOn> list)
        {
              SqlCommand _fleetCMD = null;
              try
              {
                  _fleetCon.Open();
                  _fleetCMD = new SqlCommand("select max(BookingID) from BookingDetails", _fleetCon);
                  int id = Convert.ToInt32(_fleetCMD.ExecuteScalar());
                  
                  foreach (AddOn item in list)
                  {
                      Console.WriteLine("Inside List" + id + item.Name);
                      _fleetCMD = new SqlCommand("insert into AddonSelected values(@SelectedID,@AddonID,@Price)", _fleetCon);
                      _fleetCMD.Parameters.AddWithValue("@SelectedID", id);
                      _fleetCMD.Parameters.AddWithValue("@AddonID", item.AddonID);
                      _fleetCMD.Parameters.AddWithValue("@Price", item.PricePerDay);
                      _fleetCMD.ExecuteScalar();
                  }
                  
              }
              catch (Exception e)
              {
                  Console.WriteLine(e.ToString());
                  return false;
              }
              return true;
        }

        public List<AddOn> GetSelectedAddons(int id)
        {
            _fleetCon.Open();
            List<AddOn> list = new List<AddOn>();
            _fleetCMD = new SqlCommand("select * from addonselected where AddOnSelectedID=" + id, _fleetCon);
            SqlDataReader dataReader = _fleetCMD.ExecuteReader();
            AddOn a = null;
            while(dataReader.Read())
            {
                a = new AddOn();
                a.AddonID = dataReader.GetInt32(1);
                a.PricePerDay = dataReader.GetInt32(2);
                list.Add(a);
            }
            _fleetCon.Close();
            return list;
        }

        public bool AddBillDetails(Bill bill)
        {
            bool success = false;
            SqlCommand _fleetCMD = null;
            try
            {
                _fleetCon.Open();
                if (bill.MemberID != null)
                {
                    _fleetCMD = new SqlCommand("INSERT INTO bill(BillId,FuelStatus,CarNo,CarTypeID,Daily,Weekly,Monthly,MemberID,BookingDate,PickDate,PickTime,PickAt,EstimatedAmount,FirstName,LastName,Addr1,Addr2,EmailId,State,City,Zip,Phone,Mobile,DLicenseNo,DIssuedBy,DLicenseValidThrough,IdpNo,IdpIssuedBy,IDPValidThru,PassportNo,PIssued_by,PValidThru,BirthDate) VALUES(@BillId,@FuelStatus,@CarNo,@CarTypeID,@Daily,@Weekly,@Monthly,@MemberID,@BookingDate,@PickDate,@PickTime,@PickAt,@EstimatedAmount,@FirstName,@LastName,@Address1,@Address2,@EmailId,@State,@City,@Zip,@Phone,@Mobile,@DLicenseNo,@DIssuedBy,@DLicenseValidThrough,@IdpNo,@IdpIssuedBy,@IdpValidThrough,@PassportNo,@PIssuedBy,@PValidThrough,@BirthDate)", _fleetCon);
                }
                else
                {
                    _fleetCMD = new SqlCommand("INSERT INTO bill(BillId,FuelStatus,CarNo,CarTypeID,Daily,Weekly,Monthly,BookingDate,PickDate,PickTime,PickAt,EstimatedAmount,FirstName,LastName,Addr1,Addr2,EmailId,State,City,Zip,Phone,Mobile,DLicenseNo,DIssuedBy,DLicenseValidThrough,IdpNo,IdpIssuedBy,IDPValidThru,PassportNo,PIssued_by,PValidThru,BirthDate) VALUES(@BillId,@FuelStatus,@CarNo,@CarTypeID,@Daily,@Weekly,@Monthly,@BookingDate,@PickDate,@PickTime,@PickAt,@EstimatedAmount,@FirstName,@LastName,@Address1,@Address2,@EmailId,@State,@City,@Zip,@Phone,@Mobile,@DLicenseNo,@DIssuedBy,@DLicenseValidThrough,@IdpNo,@IdpIssuedBy,@IdpValidThrough,@PassportNo,@PIssuedBy,@PValidThrough,@BirthDate)", _fleetCon);
                }
                _fleetCMD.Parameters.AddWithValue("@BillId", bill.BillId);
                _fleetCMD.Parameters.AddWithValue("@FuelStatus", bill.FuelStatus);
                _fleetCMD.Parameters.AddWithValue("@CarNo", bill.CarNo);
                _fleetCMD.Parameters.AddWithValue("@CarTypeID", bill.CarTypeID);
                _fleetCMD.Parameters.AddWithValue("@Daily", bill.Daily);
                _fleetCMD.Parameters.AddWithValue("@Weekly", bill.Weekly);
                _fleetCMD.Parameters.AddWithValue("@Monthly", bill.Monthly);
                if (bill.MemberID != null)
                    _fleetCMD.Parameters.AddWithValue("@MemberID", bill.MemberID);
                _fleetCMD.Parameters.AddWithValue("@BookingDate", bill.BookingDate);
                _fleetCMD.Parameters.AddWithValue("@PickDate", bill.PickDate);
                _fleetCMD.Parameters.AddWithValue("@PickTime", bill.PickTime);
                _fleetCMD.Parameters.AddWithValue("@PickAt", bill.PickAt);
                _fleetCMD.Parameters.AddWithValue("@EstimatedAmount", bill.EstimatedAmount);
                _fleetCMD.Parameters.AddWithValue("@FirstName", bill.FirstName);
                _fleetCMD.Parameters.AddWithValue("@LastName", bill.LastName);
                _fleetCMD.Parameters.AddWithValue("@Address1", bill.Address1);
                _fleetCMD.Parameters.AddWithValue("@Address2", bill.Address2);
                _fleetCMD.Parameters.AddWithValue("@EmailId", bill.EmailId);
                _fleetCMD.Parameters.AddWithValue("@State", bill.State);
                _fleetCMD.Parameters.AddWithValue("@City", bill.City);
                _fleetCMD.Parameters.AddWithValue("@Zip", bill.Zip);
                _fleetCMD.Parameters.AddWithValue("@Phone", bill.Phone);
                _fleetCMD.Parameters.AddWithValue("@Mobile", bill.Mobile);
                _fleetCMD.Parameters.AddWithValue("@DLicenseNo", bill.DLicenseNo);
                _fleetCMD.Parameters.AddWithValue("@DIssuedBy", bill.DIssuedBy);
                _fleetCMD.Parameters.AddWithValue("@DLicenseValidThrough", bill.DLicenseValidThrough);
                _fleetCMD.Parameters.AddWithValue("@IdpNo", bill.IdpNo);
                _fleetCMD.Parameters.AddWithValue("@IdpIssuedBy", bill.IdpIssuedBy);
                _fleetCMD.Parameters.AddWithValue("@IdpValidThrough", bill.IdpValidThrough);
                _fleetCMD.Parameters.AddWithValue("@PassportNo", bill.PassportNo);
                _fleetCMD.Parameters.AddWithValue("@PIssuedBy", bill.PIssuedBy);
                _fleetCMD.Parameters.AddWithValue("@PValidThrough", bill.PValidThrough);
                _fleetCMD.Parameters.AddWithValue("@BirthDate", bill.BirthDate);

                if (_fleetCMD.ExecuteNonQuery() > 0)
                {
                    _fleetCMD = new SqlCommand("delete from BookingDetails where BookingID=" + bill.BillId, _fleetCon);
                    if (_fleetCMD.ExecuteNonQuery() > 0)
                        success = true;
                    else
                        success = false;
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.ToString());
            }
            finally
            {
                _fleetCon.Close();
            }

            return success;
        }
        
        public BookingDetails GetBookingObject(int BookingId)
          {
              BookingDetails BookingObj = new BookingDetails();
              try
              {
                  _fleetCon.Open();

                  _fleetCMD = new SqlCommand("select * from BookingDetails where BookingID=" + BookingId, _fleetCon);
                  SqlDataReader bookinginfo = _fleetCMD.ExecuteReader();
                  while (bookinginfo.Read())
                  {
                      BookingObj.CarTypeID = Convert.ToInt32(bookinginfo["CarTypeID"].ToString());
                      BookingObj.Daily  = Convert.ToInt32(bookinginfo["Daily"].ToString());
                      BookingObj.Weekly = Convert.ToInt32(bookinginfo["Weekly"].ToString());
                      BookingObj.Monthly = Convert.ToInt32(bookinginfo["Monthly"].ToString());
                      if (bookinginfo["MemberID"] != null)
                            BookingObj.MemberID = bookinginfo["MemberID"].ToString();
                      BookingObj.BookingDate = bookinginfo["BookingDate"].ToString();
                      BookingObj.PickDate = bookinginfo["PickDate"].ToString();
                      BookingObj.PickTime = bookinginfo["PickTime"].ToString();
                      BookingObj.PickAt = bookinginfo["PickAt"].ToString();
                      BookingObj.ReturnDate = bookinginfo["ReturnDate"].ToString();
                      BookingObj.ReturnAt = bookinginfo["ReturnAt"].ToString();
                      BookingObj.ReturnTime = bookinginfo["ReturnTime"].ToString();
                      BookingObj.EstimatedAmount = Convert.ToInt32(bookinginfo["EstimatedAmount"].ToString());
                      BookingObj.FirstName = bookinginfo["FirstName"].ToString();
                      BookingObj.LastName = bookinginfo["LastName"].ToString();
                      BookingObj.Address1 = bookinginfo["Address1"].ToString();
                      BookingObj.Address2 = bookinginfo["Address2"].ToString();
                      BookingObj.EmailId = bookinginfo["EmailId"].ToString();
                      BookingObj.State = bookinginfo["State"].ToString();
                      BookingObj.City = bookinginfo["City"].ToString();
                      BookingObj.Zip = Convert.ToInt32(bookinginfo["Zip"]);
                      BookingObj.Phone = Convert.ToInt64(bookinginfo["Phone"]);
                      BookingObj.Mobile = Convert.ToInt64(bookinginfo["Mobile"]);
                      BookingObj.DLicenseNo = bookinginfo["DlicenseNo"].ToString();
                      BookingObj.DIssuedBy = bookinginfo["DIssuedBy"].ToString();
                      BookingObj.DLicenseValidThrough = bookinginfo["DlicenseValidThrough"].ToString();
                      BookingObj.IdpNo = bookinginfo["IDPNo"].ToString();
                      BookingObj.IdpIssuedBy = bookinginfo["IDPIssuedBy"].ToString();
                      BookingObj.IdpValidThrough = bookinginfo["IDPValidThru"].ToString();
                      BookingObj.PassportNo = bookinginfo["PassportNo"].ToString();
                      BookingObj.PIssuedBy = bookinginfo["PIssued_by"].ToString();
                      BookingObj.PValidThrough = bookinginfo["PValidThru"].ToString();
                      BookingObj.BirthDate = bookinginfo["BirthDate"].ToString();
                      BookingObj.PickDate = bookinginfo["PickDate"].ToString();
                      BookingObj.PickAt = bookinginfo["PickAt"].ToString();
                      BookingObj.PickTime = bookinginfo["PickTime"].ToString();
                      BookingObj.ReturnDate = bookinginfo["PickDate"].ToString();
                      BookingObj.ReturnTime = bookinginfo["ReturnTime"].ToString();
                      BookingObj.ReturnAt = bookinginfo["ReturnAt"].ToString();
                      BookingObj.CarTypeID = Convert.ToInt32(bookinginfo["CarTypeID"].ToString());
                  }
                 
              }
              catch (Exception ex)
              {
                  Console.WriteLine(ex.StackTrace);
              }
              finally
              {
                  _fleetCon.Close();
              }

              return BookingObj;
          }

        public string[] GetHubAddresses(string pickHubCode, string returnHubCode)
          {
              string[] str = new string[2];
              _fleetCon = new SqlConnection("Data Source=.; Initial Catalog=Fleet; Integrated Security=true;");
              try
              {
                  _fleetCon.Open();
                  _fleetCMD = new SqlCommand("Select Address from Hub where HubCode='" + pickHubCode + "'", _fleetCon);

                  SqlDataReader dataReader = _fleetCMD.ExecuteReader();
                  while(dataReader.Read())
                  {
                      str[0] = dataReader["Address"].ToString();
                  }
                  dataReader.Close();
                  _fleetCMD = new SqlCommand("Select Address from Hub where HubCode='" + returnHubCode + "'", _fleetCon);
                  dataReader = _fleetCMD.ExecuteReader();
                  while (dataReader.Read())
                  {
                      str[1] = dataReader["Address"].ToString();
                  }
                  dataReader.Close();
              }
              catch (Exception e)
              {
                  Console.WriteLine(e.ToString());
              }
              _fleetCon.Close();
              return str;              
          }

        public bool CheckBookingData(string Id)
          {
              _fleetCMD = new SqlCommand("select count(*) from BookingDetails where BookingID=" + Convert.ToInt32(Id), _fleetCon);
              _fleetCon.Open();
              int a = (int)_fleetCMD.ExecuteScalar();
              _fleetCon.Close();
              if (a == 1)
                  return true;
              else
                  return false;
          }

        public bool CancelBookingData(string Id)
          {
              _fleetCMD = new SqlCommand("select count(*) from BookingDetails where BookingID=" + Convert.ToInt32(Id), _fleetCon);
              _fleetCon.Open();
              int a = (int)_fleetCMD.ExecuteScalar();
              _fleetCon.Close();
              if (a == 1)
              {
                  _fleetCMD = new SqlCommand("delete from BookingDetails where BookingID=" + Convert.ToInt32(Id), _fleetCon);
                  _fleetCon.Open();
                  _fleetCMD.ExecuteScalar();
                  _fleetCon.Close();
                  return true;
              }
              else
                  return false;

          }

        public Bill BillIdSearch(string Id)
          {
              Bill BillObj = new Bill();
              _fleetCMD = new SqlCommand("select count(*) from Bill where BillId=" + Convert.ToInt32(Id), _fleetCon);
              _fleetCon.Open();
              int a = (int)_fleetCMD.ExecuteScalar();
              _fleetCon.Close();
              if (a >= 1)
              {

                  try
                  {
                      _fleetCMD = new SqlCommand("select * from Bill where BillId=" + Convert.ToInt32(Id), _fleetCon);
                      _fleetCon.Open();
                      SqlDataReader billreader = _fleetCMD.ExecuteReader();
                      while (billreader.Read())
                      {
                          BillObj.BillId = Convert.ToInt32(billreader["BillId"]);
                          BillObj.PickDate = billreader["PickDate"].ToString();
                          BillObj.PickAt = billreader["PickAt"].ToString();
                          BillObj.Daily = Convert.ToInt32(billreader["Daily"].ToString());
                          BillObj.Weekly = Convert.ToInt32(billreader["Weekly"].ToString());
                          BillObj.Monthly = Convert.ToInt32(billreader["Monthly"].ToString());
                          BillObj.CarNo = billreader["CarNo"].ToString();
                          BillObj.CarTypeID = Convert.ToInt32(billreader["CarTypeId"]);
                          BillObj.FuelStatus = Convert.ToDecimal(billreader["FuelStatus"]);

                      }
                  }
                  catch (Exception ex)
                  {
                      Console.WriteLine(ex.StackTrace);
                  }
                  finally
                  {
                      _fleetCon.Close();
                  }

                  return BillObj;
              }
              else
                  return null;
          }

        public bool UpdateBill(Bill bill)
        {
            _fleetCon.Open();
            _fleetCMD = new SqlCommand("update bill set ReturnDate=@ReturnDate,ReturnTime=@ReturnTime,ReturnAt=@ReturnAt where BillId=@BillId", _fleetCon);
            _fleetCMD.Parameters.AddWithValue("@BillId", bill.BillId);
            _fleetCMD.Parameters.AddWithValue("@ReturnDate", DateTime.Now.ToShortDateString());
            _fleetCMD.Parameters.AddWithValue("@ReturnTime", DateTime.Now.ToShortTimeString());
            _fleetCMD.Parameters.AddWithValue("@ReturnAt", bill.FirstName);
            if (_fleetCMD.ExecuteNonQuery() > 0)
            {
                _fleetCon.Close();
                return true;
            }
            _fleetCon.Close();
            return false;
        }

        public decimal GetSelectedAddOnAmount(int BillId)
        {
            decimal amt = 0;
            try
            {
                _fleetCMD = new SqlCommand("select sum(PricePerDay) from AddOnSelected where AddOnSelectedID=" + Convert.ToInt32(BillId) + "group by AddOnSelectedID", _fleetCon);
                _fleetCon.Open();
                amt = Convert.ToDecimal(_fleetCMD.ExecuteScalar());
            }
            catch (Exception ex)
            {

                Console.WriteLine(ex.ToString());
            }
            finally
            {
                _fleetCon.Close();
            }

            return amt;
        }

        public List<string> GetCarNo(int carTypeID, string hubCode)
        {
            List<string> list = new List<string>();
            _fleetCMD = new SqlCommand("select carno from carselect where carmodelid in(select CarModelID from CarModel where CarTypeID=@CarTypeID) and Status = 'Available' and HubCode=@HubCode", _fleetCon);
            _fleetCon.Open();
            _fleetCMD.Parameters.AddWithValue("@CarTypeID",carTypeID);
            _fleetCMD.Parameters.AddWithValue("@HubCode", hubCode);
            SqlDataReader dataReader = _fleetCMD.ExecuteReader();
            while(dataReader.Read())
                list.Add(dataReader.GetString(0));
            _fleetCon.Close();
            return list;
        }

        public int GetBookingID()
        {
            _fleetCMD = new SqlCommand("select max(BookingID) from BookingDetails", _fleetCon);
            _fleetCon.Open();
            int cnt = Convert.ToInt32(_fleetCMD.ExecuteScalar());
            return cnt;
        }
    }
}

