
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace FleetLibrary
{
    public class BookingDetails
    {
        int _bookingID;
        int _carTypeID;
        int _daily;
        int _monthly;
        int _weekly;
        string _memberID;
        string _bookingDate;
        string _pickDate;
        string _pickTime;
        string _pickAt;
        string _returnDate;
        string _returnTime;
        string _returnAt;
        int _estimatedAmount;
        string _firstName;
        string _lastName;
        string _address1;
        string _address2;
        string _birthDate;
        string _emailId;
        string _state;
        string _city;
        int _zip;
        long _phone;
        long _mobile;
        string _dLicenseNo;
        string _dIssuedBy;
        string _dLicenseValidThrough;
        string _idpNo;
        string _idpIssuedBy;
        string _idpValidThrough;
        string _passportNo;
        string _pIssuedBy;
        string _pValidThrough;
        
        public int BookingID
        {
            get { return _bookingID; }
            set { _bookingID = value; }
        }

        public string BirthDate
        {
            get { return _birthDate; }
            set { _birthDate = value; }
        }

        public int CarTypeID
        {
            get { return _carTypeID; }
            set { _carTypeID = value; }
        }
        

        public int Daily
        {
            get { return _daily; }
            set { _daily = value; }
        }
        

        public int Monthly
        {
            get { return _monthly; }
            set { _monthly = value; }
        }
        

        public int Weekly
        {
            get { return _weekly; }
            set { _weekly = value; }
        }
        

        public string MemberID
        {
            get { return _memberID; }
            set { _memberID = value; }
        }
        

        public string BookingDate
        {
            get { return _bookingDate; }
            set { _bookingDate = value; }
        }
        

        public string PickDate
        {
            get { return _pickDate; }
            set { _pickDate = value; }
        }
        

        public string PickTime
        {
            get { return _pickTime; }
            set { _pickTime = value; }
        }
        
        public string PickAt
        {
            get { return _pickAt; }
            set { _pickAt = value; }
        }
        

        public string ReturnDate
        {
            get { return _returnDate; }
            set { _returnDate = value; }
        }
        

        public string ReturnTime
        {
            get { return _returnTime; }
            set { _returnTime = value; }
        }
        

        public string ReturnAt
        {
            get { return _returnAt; }
            set { _returnAt = value; }
        }
        
        public int EstimatedAmount
        {
            get { return _estimatedAmount; }
            set { _estimatedAmount = value; }
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
        
        public string EmailId
        {
            get { return _emailId; }
            set { _emailId = value; }
        }
      

        public string State
        {
            get { return _state; }
            set { _state = value; }
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
        

        public string DLicenseNo
        {
            get { return _dLicenseNo; }
            set { _dLicenseNo = value; }
        }
        

        public string DIssuedBy
        {
            get { return _dIssuedBy; }
            set { _dIssuedBy = value; }
        }
        
        public string DLicenseValidThrough
        {
            get { return _dLicenseValidThrough; }
            set { _dLicenseValidThrough = value; }
        }
        

        public string IdpNo
        {
            get { return _idpNo; }
            set { _idpNo = value; }
        }
        

        public string IdpIssuedBy
        {
            get { return _idpIssuedBy; }
            set { _idpIssuedBy = value; }
        }
        

        public string IdpValidThrough
        {
            get { return _idpValidThrough; }
            set { _idpValidThrough = value; }
        }
       

        public string PassportNo
        {
            get { return _passportNo; }
            set { _passportNo = value; }
        }
        

        public string PIssuedBy
        {
            get { return _pIssuedBy; }
            set { _pIssuedBy = value; }
        }
        

        public string PValidThrough
        {
            get { return _pValidThrough; }
            set { _pValidThrough = value; }
        }

    }
}
