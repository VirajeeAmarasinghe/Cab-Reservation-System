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
    public partial class ClientFeedback : System.Web.UI.Page
    {
        string connString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            Validator v=new Validator();
            if(!v.isPresent(txtContent)){
                lbl_error_message.Text = "Fill Content Field!";
            }else if(!v.isPresent(txtClientName)){
                lbl_error_message.Text = "Fill Name Field!";
            }else if (!v.isPresent(txtEmail)){
                lbl_error_message.Text = "Fill Email Address!";
            }else {
                if (!v.isValidEmail(txtEmail.Text)){
                    lbl_error_message.Text = "Enter Valid Email!";
                }else {
                    try
                    {
                        DateTime localDate = DateTime.Now;
                        FeedbackClass feed = new FeedbackClass(txtContent.Text,localDate,txtClientName.Text,txtEmail.Text);
                        if (feed.AddFeedback(connString))
                        {
                            lbl_error_message.Text = "Inserted Successfully";
                            txtClientName.Text = "";
                            txtEmail.Text = "";
                            txtContent.Text = "";
                        }
                        else
                        {
                            lbl_error_message.Text = "Sorry,Error Occurred";
                        }
                    }
                    catch (Exception ex)
                    {

                        lbl_error_message.Text = ex.Message;
                    }
                }
            }
        }
    }
}