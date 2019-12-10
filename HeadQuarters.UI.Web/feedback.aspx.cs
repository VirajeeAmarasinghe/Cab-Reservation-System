using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HeadQuarters.BO;
using System.Configuration;

namespace HeadQuarters.UI.Web
{
    public partial class feedback : System.Web.UI.Page
    {
        string connString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            string clientName = txtClientName.Text;
            string email = txtEmail.Text;
            string feedback = txtFeed.Text;
            DateTime now = DateTime.Now;
            FeedbackClass f = new FeedbackClass();
            f.client_name = clientName;
            f.email = email;
            f.content = feedback;
            f.date_and_time = now;
            f.AddFeedback(connString);
            txtClientName.Text = "";
            txtEmail.Text = "";
            txtFeed.Text = "";
        }
    }
}