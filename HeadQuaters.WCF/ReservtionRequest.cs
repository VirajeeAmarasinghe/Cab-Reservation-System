using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Data;
using System.Data.Common;
using HeadQuarters.DL;

namespace HeadQuaters.WCF
{
    class ReservtionRequest : IReservation
    {
        public int GetBranchID(string connString, string location, string query2)
        {
            try
            {
                int id = 0;
                DbDataReader reader = null;
                DbHelper.ConnectionString = connString;
                DbConnection conn = DbHelper.GetConnection();
                conn.Open();

                string query = query2;


                reader = DbHelper.ExecuteReader(ref conn, CommandType.Text, query, null);


                while (reader.Read())
                {
                    id = Convert.ToInt32(reader[0].ToString());

                }
                reader.Close();
                conn.Close();
                return id;
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public int GetMaxClientID(string connString, string query2)
        {
            try
            {
                int maxClientID = 0;
                DbDataReader reader = null;
                DbHelper.ConnectionString = connString;
                DbConnection conn = DbHelper.GetConnection();
                conn.Open();

                string query = query2;
                reader = DbHelper.ExecuteReader(ref conn, CommandType.Text, query, null);
                if (reader.Read())
                {
                    maxClientID = Convert.ToInt32(reader[0].ToString());
                }
                reader.Close();
                conn.Close();
                return maxClientID;
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public Employee DispatchDriver(string connString, DateTime pickUpDateTime, DateTime dropDateTime, string location)
        {
            try
            {
                List<int> allTheDrivers = new List<int>();
                List<int> notEverDispatchedDrivers = new List<int>();
                List<int> selectedDrivers = new List<int>();

                DbDataReader reader = null;
                DbHelper.ConnectionString = connString;
                DbConnection conn = DbHelper.GetConnection();
                conn.Open();
                string query1 = "select employee_id from Employee WHERE branch_id=(select branch_id from Branch where location='" + location + "') AND job_id=3";
                reader = DbHelper.ExecuteReader(ref conn, CommandType.Text, query1, null);
                while (reader.Read())
                {
                    allTheDrivers.Add(Convert.ToInt32(reader[0].ToString()));
                }
                string query2 = "select * from Reservation where employee_id=@employee_id";
                DbParameter[] paraArray = new DbParameter[1];
                foreach (int id in allTheDrivers)
                {
                    paraArray[0] = (DbParameter)DbHelper.CreateParameter("@employee_id", DbType.Int32, id);
                    reader = DbHelper.ExecuteReader(ref conn, CommandType.Text, query2, paraArray);
                    if (reader.Read())
                    {

                    }
                    else
                    {
                        notEverDispatchedDrivers.Add(id);
                    }
                }

                if (notEverDispatchedDrivers.Count == 0)
                {
                    List<int> driverIds = new List<int>();
                    List<int> driverIds2 = new List<int>();
                    DateTime endTime = dropDateTime.AddHours(2);
                    string query4 = "select employee_id from Reservation where drop_date_time<='" + pickUpDateTime.ToString() + "' AND branch_id=(select branch_id from Branch where location='" + location + "')";
                    reader = DbHelper.ExecuteReader(ref conn, CommandType.Text, query4, null);
                    if (reader.Read())
                    {
                        while (reader.Read())
                        {
                            driverIds.Add(Convert.ToInt32(reader[0].ToString()));
                        }
                        string query5 = "select employee_id from Reservation where pick_up_date_time>='" + endTime.ToString() + "'AND branch_id=(select branch_id from Branch where location='" + location + "')";
                        reader = DbHelper.ExecuteReader(ref conn, CommandType.Text, query5, null);
                        while (reader.Read())
                        {
                            driverIds2.Add(Convert.ToInt32(reader[0].ToString()));
                        }
                        foreach (int ID1 in driverIds)
                        {
                            foreach (int ID2 in driverIds2)
                            {
                                if (ID1 == ID2)
                                {
                                    selectedDrivers.Add(ID1);
                                }
                            }
                        }
                        foreach (int ID3 in selectedDrivers)
                        {
                            string query6 = "select count(*) from Reservation where CONVERT(pick_up_date_time,GETDATE())='" + pickUpDateTime.Date.ToString() + "'AND employee_id='" + ID3 + "'AND branch_id=(select branch_id from Branch where location='" + location + "')";
                            reader = DbHelper.ExecuteReader(ref conn, CommandType.Text, query6, null);
                            int count = 0;
                            while (reader.Read())
                            {
                                count = Convert.ToInt32(reader[0].ToString());
                            }
                            if (count < 10)
                            {
                                string query7 = "select first_name,last_name,contact_number from Employee where employee_id='" + ID3 + "'";
                                reader = DbHelper.ExecuteReader(ref conn, CommandType.Text, query7, null);
                                if (reader.Read())
                                {
                                    Employee e = new Employee();
                                    e.employee_id = ID3;
                                    e.first_name = reader[0].ToString();
                                    e.last_name = reader[1].ToString();
                                    e.contact_number = reader[2].ToString();
                                    return e;
                                }
                            }
                        }
                    }
                    else
                    {
                        string query8 = "select employee_id from Reservation where pick_up_date_time>='" + endTime.ToString() + "'AND branch_id=(select branch_id from Branch where location='" + location + "')";
                        reader = DbHelper.ExecuteReader(ref conn, CommandType.Text, query8, null);
                        while (reader.Read())
                        {
                            selectedDrivers.Add(Convert.ToInt32(reader[0].ToString()));
                        }
                        foreach (int ID3 in selectedDrivers)
                        {
                            string query6 = "select count(*) from Reservation where CONVERT(pick_up_date_time,GETDATE())='" + pickUpDateTime.Date.ToString() + "'AND employee_id='" + ID3 + "'";
                            reader = DbHelper.ExecuteReader(ref conn, CommandType.Text, query6, null);
                            int count = 0;
                            while (reader.Read())
                            {
                                count = Convert.ToInt32(reader[0].ToString());
                            }
                            if (count < 10)
                            {
                                string query7 = "select first_name,last_name,contact_number from Employee where employee_id='" + ID3 + "'";
                                reader = DbHelper.ExecuteReader(ref conn, CommandType.Text, query7, null);
                                if (reader.Read())
                                {
                                    Employee e = new Employee();
                                    e.employee_id = ID3;
                                    e.first_name = reader[0].ToString();
                                    e.last_name = reader[1].ToString();
                                    e.contact_number = reader[2].ToString();
                                    return e;
                                }
                            }
                            else
                            {
                                Employee e = null;
                                return e;
                            }
                        }
                    }

                }
                else
                {
                    foreach (int id in notEverDispatchedDrivers)
                    {
                        string query3 = "select first_name,last_name,contact_number from Employee where employee_id='" + id + "'";
                        reader = DbHelper.ExecuteReader(ref conn, CommandType.Text, query3, null);
                        if (reader.Read())
                        {
                            Employee e = new Employee();
                            e.employee_id = id;
                            e.first_name = reader[0].ToString();
                            e.last_name = reader[1].ToString();
                            e.contact_number = reader[2].ToString();
                            return e;
                        }
                    }
                }
                Employee em = null;
                reader.Close();
                conn.Close();
                return em;
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }

        public Cab DispatchCab(string connString, DateTime pickUpDateTime, DateTime dropDateTime, string type, string location)
        {
            try
            {


                List<int> allTheCabs = new List<int>();
                List<int> notEverDispatchedCabs = new List<int>();
                List<int> selectedCabs = new List<int>();
                DbDataReader reader = null;
                DbHelper.ConnectionString = connString;
                DbConnection conn = DbHelper.GetConnection();
                conn.Open();
                string query1 = "select cab_id from Cab where type_id=(select type_id from Type where type='" + type + "') AND branch_id=(select branch_id from Branch where location='" + location + "')";
                reader = DbHelper.ExecuteReader(ref conn, CommandType.Text, query1, null);
                while (reader.Read())
                {
                    allTheCabs.Add(Convert.ToInt32(reader[0].ToString()));
                }
                string query2 = "select * from Reservation where cab_id=@cab_id";
                DbParameter[] paraArray = new DbParameter[1];
                foreach (int id in allTheCabs)
                {
                    paraArray[0] = (DbParameter)DbHelper.CreateParameter("@cab_id", DbType.Int32, id);
                    reader = DbHelper.ExecuteReader(ref conn, CommandType.Text, query2, paraArray);
                    if (reader.Read())
                    {

                    }
                    else
                    {
                        notEverDispatchedCabs.Add(id);
                    }
                }

                if (notEverDispatchedCabs.Count == 0)
                {

                    List<int> driverIds = new List<int>();
                    List<int> driverIds2 = new List<int>();

                    DateTime endTime = dropDateTime.AddHours(2);

                    string query4 = "select cab_id from Reservation where drop_date_time<='" + pickUpDateTime.ToString() + "'AND branch_id=(select branch_id from Branch where location='" + location + "') AND cab_id in (select cab_id from Cab where type_id=(select type_id from Type where type='" + type + "'))";
                    reader = DbHelper.ExecuteReader(ref conn, CommandType.Text, query4, null);
                    if (reader.Read())
                    {
                        while (reader.Read())
                        {
                            driverIds.Add(Convert.ToInt32(reader[0].ToString()));
                        }
                        string query5 = "select cab_id from Reservation where pick_up_date_time>='" + endTime.ToString() + "'AND branch_id=(select branch_id from Branch where location='" + location + "')AND cab_id in (select cab_id from Cab where type_id=(select type_id from Type where type='" + type + "'))";
                        reader = DbHelper.ExecuteReader(ref conn, CommandType.Text, query5, null);
                        while (reader.Read())
                        {
                            driverIds2.Add(Convert.ToInt32(reader[0].ToString()));
                        }
                        foreach (int ID1 in driverIds)
                        {
                            foreach (int ID2 in driverIds2)
                            {
                                if (ID1 == ID2)
                                {
                                    selectedCabs.Add(ID1);
                                }
                            }
                        }
                        foreach (int ID3 in selectedCabs)
                        {
                            string query6 = "select count(*) from Reservation where CONVERT(pick_up_date_time,GETDATE())='" + pickUpDateTime.Date.ToString() + "'AND cab_id='" + ID3 + "'";
                            reader = DbHelper.ExecuteReader(ref conn, CommandType.Text, query6, null);
                            int count = 0;
                            while (reader.Read())
                            {
                                count = Convert.ToInt32(reader[0].ToString());
                            }
                            if (count < 10)
                            {
                                string query7 = "select cab_registration_no from Cab where cab_id='" + ID3 + "'";
                                reader = DbHelper.ExecuteReader(ref conn, CommandType.Text, query7, null);
                                if (reader.Read())
                                {
                                    Cab c = new Cab();
                                    c.cab_id = ID3;
                                    c.cab_registration_no = reader[0].ToString();
                                    return c;
                                }
                            }
                        }
                    }
                    else
                    {
                        string query8 = "select cab_id from Reservation where pick_up_date_time>='" + endTime.ToString() + "'AND branch_id=(select branch_id from Branch where location='" + location + "')AND cab_id in (select cab_id from Cab where type_id=(select type_id from Type where type='" + type + "'))";
                        reader = DbHelper.ExecuteReader(ref conn, CommandType.Text, query8, null);
                        while (reader.Read())
                        {
                            selectedCabs.Add(Convert.ToInt32(reader[0].ToString()));
                        }
                        foreach (int ID3 in selectedCabs)
                        {
                            string query6 = "select count(*) from Reservation where CONVERT(pick_up_date_time,GETDATE())='" + pickUpDateTime.Date.ToString() + "'AND cab_id='" + ID3 + "'";
                            reader = DbHelper.ExecuteReader(ref conn, CommandType.Text, query6, null);
                            int count = 0;
                            while (reader.Read())
                            {
                                count = Convert.ToInt32(reader[0].ToString());
                            }
                            if (count < 10)
                            {
                                string query7 = "select cab_registration_no from Cab where cab_id='" + ID3 + "'";
                                reader = DbHelper.ExecuteReader(ref conn, CommandType.Text, query7, null);
                                if (reader.Read())
                                {
                                    Cab c = new Cab();
                                    c.cab_id = ID3;
                                    c.cab_registration_no = reader[0].ToString();
                                    return c;
                                }
                            }
                            else
                            {
                                Cab c = null;
                                return c;
                            }
                        }
                    }

                }
                else
                {
                    foreach (int id in notEverDispatchedCabs)
                    {
                        string query3 = "select cab_registration_no from Cab where cab_id='" + id + "'";
                        reader = DbHelper.ExecuteReader(ref conn, CommandType.Text, query3, null);
                        while (reader.Read())
                        {
                            Cab c = new Cab();
                            c.cab_id = id;
                            c.cab_registration_no = reader[0].ToString();
                            return c;
                        }
                    }
                }
                Cab cab = null;
                reader.Close();
                conn.Close();
                return cab;
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }

        public bool AddClient(string connString,Client c)
        {
            try
            {
                //no need of insert client id->becuase it is auto incremented

                string query = "INSERT INTO Client(first_name,last_name,contact_no,email)" +
                "VALUES(@first_name,@last_name,@contact_no,@email)";
                DbHelper.ConnectionString = connString;
                DbParameter[] paraArray = new DbParameter[4];
                paraArray[0] = (DbParameter)DbHelper.CreateParameter("@first_name", DbType.String, c.first_name);
                paraArray[1] = (DbParameter)DbHelper.CreateParameter("@last_name", DbType.String, c.last_name);
                paraArray[2] = (DbParameter)DbHelper.CreateParameter("@contact_no", DbType.String, c.contact_number);
                paraArray[3] = (DbParameter)DbHelper.CreateParameter("@email", DbType.String, c.email);


                if (DbHelper.ExecuteNonQuery(CommandType.Text, query, paraArray) > 0)
                    return true;
                else
                    return false;
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public bool AddReservationAsPartner(string connString,Reservation r)
        {
            try
            {
                //reservation_id is auto incremented

                string query = "INSERT INTO Reservation" +
                "(pick_up_address,destination,pick_up_date_time,drop_date_time" +
                ",branch_id,employee_id," +
                "partner_id,cab_id)VALUES" +
                "(@pick_up_address,@destination,@pick_up_date_time,@drop_date_time" +
                ",@branch_id,@employee_id," +
                "@partner_id,@cab_id)";
                DbHelper.ConnectionString = connString;
                DbParameter[] paraArray = new DbParameter[8];
                paraArray[0] = (DbParameter)DbHelper.CreateParameter("@pick_up_address", DbType.String,r. pick_up_address);
                paraArray[1] = (DbParameter)DbHelper.CreateParameter("@destination", DbType.String, r.destination);
                paraArray[2] = (DbParameter)DbHelper.CreateParameter("@pick_up_date_time", DbType.DateTime, r.pick_up_date_time);
                paraArray[3] = (DbParameter)DbHelper.CreateParameter("@drop_date_time", DbType.DateTime, r.drop_date_time);
                paraArray[4] = (DbParameter)DbHelper.CreateParameter("@branch_id", DbType.Int32, r.branch_id);
                paraArray[5] = (DbParameter)DbHelper.CreateParameter("@employee_id", DbType.Int32, r.employee_id);
                paraArray[6] = (DbParameter)DbHelper.CreateParameter("@partner_id", DbType.Int32, r.client_id);
                paraArray[7] = (DbParameter)DbHelper.CreateParameter("@cab_id", DbType.Int32, r.cab_id);


                if (DbHelper.ExecuteNonQuery(CommandType.Text, query, paraArray) > 0)
                    return true;
                else
                    return false;
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public int GetMaxReservationID(string connString)
        {
            try
            {
                int maxReservationID = 0;
                DbDataReader reader = null;
                DbHelper.ConnectionString = connString;
                DbConnection conn = DbHelper.GetConnection();
                conn.Open();

                string query = "select MAX(reservation_id)as MaxID from Reservation";
                reader = DbHelper.ExecuteReader(ref conn, CommandType.Text, query, null);
                if (reader.Read())
                {
                    maxReservationID = Convert.ToInt32(reader[0].ToString());
                }
                reader.Close();
                conn.Close();
                return maxReservationID;
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public List<Settings> GetTypeInfo(String connString, int typeID)
        {
            try
            {
                List<Settings> typeList = new List<Settings>();
                DbDataReader reader = null;
                DbHelper.ConnectionString = connString;
                DbConnection conn = DbHelper.GetConnection();
                conn.Open();

                string query = "select type_id,type,km_rate,hourly_rate from Type";
                if (typeID != 0)
                {
                    query += " where type_id=@type_id";
                    DbParameter[] paraArray = new DbParameter[1];
                    paraArray[0] = (DbParameter)DbHelper.CreateParameter("@type_id", DbType.Int32, typeID);

                    reader = DbHelper.ExecuteReader(ref conn, CommandType.Text, query, paraArray);
                }
                else
                {
                    reader = DbHelper.ExecuteReader(ref conn, CommandType.Text, query, null);

                }
                while (reader.Read())
                {
                    Settings s = new Settings();
                    s.type_id = Convert.ToInt32(reader[0].ToString());
                    s.type = reader[1].ToString();
                    s.km_rate = Convert.ToDecimal(reader[2].ToString());
                    s.hourly_rate = Convert.ToDecimal(reader[3].ToString());

                    typeList.Add(s);
                }
                reader.Close();
                conn.Close();
                return typeList;
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }


    }
}
