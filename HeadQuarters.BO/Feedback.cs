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
   public class Feedback
    {
       public virtual int feedback_id
       {
            get;
            set;
       }
       public virtual string content
       {
           get;
           set;
       }
       public virtual DateTime date_and_time
       {
           get;
           set;
       }
       public virtual string client_name
       {
           get;
           set;
       }
       public virtual string email
       {
           get;
           set;
       }

       public bool AddFeedback(string connString)
       {
           try
           {
               //feedback_id is auto incremented
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

       public bool RemoveFeedback(string connString)
       {
           try
           {
               string query = "Delete from Feedback where feedback_id=@feedback_id";
               DbHelper.ConnectionString = connString;
               DbParameter[] paraArray = new DbParameter[1];
               paraArray[0] = (DbParameter)DbHelper.CreateParameter("@feedback_id", DbType.Int32,feedback_id);
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

       public List<Feedback> GetFeedbackInfo(String connString)
       {
           try
           {
               List<Feedback> feedbackList = new List<Feedback>();
               DbDataReader reader = null;
               DbHelper.ConnectionString = connString;
               DbConnection conn = DbHelper.GetConnection();
               conn.Open();

               string query = "select feedback_id,content,date_and_time,client_name,email from Feedback";
               if (feedback_id != null)
               {
                   query += " where feedback_id=@feedback_id";
                   DbParameter[] paraArray = new DbParameter[1];
                   paraArray[0] = (DbParameter)DbHelper.CreateParameter("@feedback_id", DbType.Int32,feedback_id);

                   reader = DbHelper.ExecuteReader(ref conn, CommandType.Text, query, paraArray);
               }
               else
               {
                   reader = DbHelper.ExecuteReader(ref conn, CommandType.Text, query, null);

               }
               while (reader.Read())
               {
                   Feedback f = new Feedback();
                   f.feedback_id = Convert.ToInt32(reader[0].ToString());
                   f.content = reader[1].ToString();
                   f.date_and_time = Convert.ToDateTime(reader[2].ToString());
                   f.client_name =reader[3].ToString();
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
    }
}
