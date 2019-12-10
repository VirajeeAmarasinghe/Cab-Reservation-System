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
    public class FeedbackClass
    {
        private int feedBackID;
        private string con;
        private DateTime dateAndTime;
        private string clientName;
        private string emailAdd;

        public virtual int feedback_id
        {
            get { return feedBackID; }
            set { feedBackID = value; }
        }

        public virtual string content
        {
            get { return con; }
            set { con = value; }
        }

        public virtual DateTime date_and_time
        {
            get { return dateAndTime; }
            set { dateAndTime = value; }
        }

        public virtual string client_name
        {
            get { return clientName; }
            set { clientName = value; }
        }

        public virtual string email
        {
            get { return emailAdd; }
            set { emailAdd = value; }
        }

        public FeedbackClass() { }

        public FeedbackClass(string con,DateTime dateTime,string client,string emailAdd) {
            content = con;
            date_and_time = dateTime;
            client_name = client;
            email = emailAdd;
        }

        //get all the complaints and comments

        public List<FeedbackClass> GetFeedbackInfo(string connString)
        {
            try
            {
                List<FeedbackClass> feedbackList = new List<FeedbackClass>();
                DbDataReader reader = null;
                DbHelper.ConnectionString = connString;
                DbConnection conn = DbHelper.GetConnection();
                conn.Open();
                string query = "select feedback_id,content,date_and_time,client_name,email from Feedback";                
                reader = DbHelper.ExecuteReader(ref conn, CommandType.Text, query, null);
                
                while (reader.Read())
                {
                    FeedbackClass f = new FeedbackClass();
                    f.feedback_id = Convert.ToInt32(reader[0].ToString());
                    f.content = reader[1].ToString();
                    f.date_and_time = Convert.ToDateTime(reader[2].ToString());
                    f.client_name = reader[3].ToString();
                    f.email = reader[4].ToString();
                    feedbackList.Add(f);
                }
                reader.Close();
                conn.Close();
                return feedbackList;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        //delete a feedback

        public bool RemoveFeedback(string connString)
        {
            try
            {
                string query = "Delete from Feedback where feedback_id=@feedback_id";
                DbHelper.ConnectionString = connString;
                DbParameter[] paraArray = new DbParameter[1];
                paraArray[0] = (DbParameter)DbHelper.CreateParameter("@feedback_id", DbType.Int32, feedback_id);
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

        //add feedback
        public bool AddFeedback(string connString)
        {
            try
            {
                //no need of insert feedback id->becuase it is auto incremented

                string query = "INSERT INTO Feedback(content,date_and_time,client_name,email)VALUES(@content,@date_and_time,@client_name,@email)";
                DbHelper.ConnectionString = connString;
                DbParameter[] paraArray = new DbParameter[4];
                paraArray[0] = (DbParameter)DbHelper.CreateParameter("@content", DbType.String,content);
                paraArray[1] = (DbParameter)DbHelper.CreateParameter("@date_and_time", DbType.DateTime,date_and_time);
                paraArray[2] = (DbParameter)DbHelper.CreateParameter("@client_name", DbType.String,client_name);
                paraArray[3] = (DbParameter)DbHelper.CreateParameter("@email", DbType.String,email);
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

    }
}
