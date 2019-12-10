using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Runtime.Serialization;
using System.ServiceModel;
using HeadQuarters.BO;


namespace HeadQuaters.WCF
{
    [ServiceContract]
    interface IReservation
    {
        [OperationContract]
        int GetBranchID(string connString, string location,string query);

        [OperationContract]
        int GetMaxClientID(string connString,string query2);

        [OperationContract]
        Employee DispatchDriver(string connString, DateTime pickUpDateTime, DateTime dropDateTime, string location);

        [OperationContract]
        Cab DispatchCab(string connString, DateTime pickUpDateTime, DateTime dropDateTime, string type, string location);

        [OperationContract]
        bool AddClient(string connString, Client c);

        [OperationContract]
        bool AddReservationAsPartner(string connString,Reservation r);

        [OperationContract]
        int GetMaxReservationID(string connString);

        [OperationContract]
        List<Settings> GetTypeInfo(String connString,int typeID);
    }
}
