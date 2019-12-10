using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using HeadQuarters.BO;

namespace HeadQuarters.UI.Web
{
    public partial class ViewComplaintsAndComments : System.Web.UI.Page
    {
        string connString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            //establishing access priviledges
            if (Session["username"] != null)
            {
                char firstLetter = ((string)Session["username"])[0];
                if (firstLetter == 'd' || firstLetter == 'D')
                {
                    Response.Redirect("permission.aspx", true);
                }
            }
            else
            {
                Response.Redirect("permission.aspx", true);
            }

            if (!Page.IsPostBack)
            {
                LoadFeedback();
            }
        }

        private void LoadFeedback()
        {
            try
            {
                FeedbackClass feedbackObj = new FeedbackClass();
                dgv_feedback.DataSource = feedbackObj.GetFeedbackInfo(connString);
                dgv_feedback.DataBind();
            }
            catch (Exception ex)
            {
                lbl_error_message.Text = ex.Message;               
            }
        }

        protected void dgv_feedback_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int rIndex = Convert.ToInt32(e.CommandArgument);
            GridViewRow row = dgv_feedback .Rows[rIndex];

            if (e.CommandName == "cmdDelete")
            {
                FeedbackClass f = new FeedbackClass();
                f.feedback_id = Convert.ToInt32(((Label)row.Cells[0].Controls[1]).Text);
                if (f.RemoveFeedback(connString))
                {                    
                    LoadFeedback();
                }
                else
                {
                    lbl_error_message.Text = "Sorry,Error Occurred!";
                }
            }
        }

        protected void dgv_feedback_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {

                ImageButton bDelete = (ImageButton)e.Row.Cells[5].Controls[1];
                bDelete.CommandArgument = e.Row.RowIndex.ToString();               

            }
        }
    }
}