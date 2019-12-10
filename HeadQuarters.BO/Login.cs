using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.Common;
using HeadQuarters.DL;

namespace HeadQuarters.BO
{
    public class LoginAuthentication
    {
        private string pass;
        private string user;

        public virtual string Password
        {
            get { return pass; }
            set { pass = value; }
        }

        public virtual string UserName
        {
            get { return user; }
            set { user = value; }
        }



        public string GetLoginInfo(string connString, string username)
        {
            try
            {
                string pass = "";
                DbDataReader reader = null;
                DbHelper.ConnectionString = connString;
                DbConnection conn = DbHelper.GetConnection();
                conn.Open();

                string query = "select password from Employee where username='" + username + "'";
                reader = DbHelper.ExecuteReader(ref conn, CommandType.Text, query, null);

                if (reader.Read())
                {
                    pass = reader[0].ToString();

                }
                reader.Close();
                conn.Close();
                return pass;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }


 
    }
}

