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
    public partial class viewreservationhistory : System.Web.UI.Page
    {
        string connString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] != null)
            {
                char firstLetter = ((string)Session["username"])[0];
                if (firstLetter != 'd' && firstLetter != 'D' && firstLetter != 'a' && firstLetter != 'A')
                {
                    Response.Redirect("permission.aspx", true);
                }
            }
            else
            {
                Response.Redirect("permission.aspx", true);
            }
            LoadReservations();
        }

        private void LoadReservations()
        {
            try
            {
                Reservation r = new Reservation();
                Validator v = new Validator();

                //if (Session["username"] != null)
                //{
                    string user = (string)Session["username"];
                    dgvReservation.DataSource = r.GetReservationAccordingToEmployee(connString, user);
                    dgvReservation.DataBind();
                //}
                //else
                //{
                //    lbl_error_message.Text = "NO data";
                //}

            }
            catch (Exception ex)
            {
                // ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + ex.ToString() + "')", true);
                lbl_error_message.Text = ex.ToString();
            }
        }

        protected void dgvReservation_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int rIndex = Convert.ToInt32(e.CommandArgument);
            GridViewRow rw =dgvReservation.Rows[rIndex];
            if (e.CommandName == "linkButton")
            {
                Reservation r = new Reservation();
                r.reservation_id = Convert.ToInt32(((Label)rw.Cells[0].Controls[1]).Text);
                r.pick_up_address = ((Label)rw.Cells[1].Controls[1]).Text;
                r.destination = ((Label)rw.Cells[2].Controls[1]).Text;
                r.pick_up_date_time = Convert.ToDateTime(((Label)rw.Cells[3].Controls[1]).Text);
                r.drop_date_time = Convert.ToDateTime(((Label)rw.Cells[4].Controls[1]).Text);
                r.distance = Convert.ToDecimal(((Label)rw.Cells[5].Controls[1]).Text);
                if (((Label)rw.Cells[6].Controls[1]).Text != null)
                {
                    r.client_id = Convert.ToInt32(((Label)rw.Cells[6].Controls[1]).Text);
                }
                if (((Label)rw.Cells[7].Controls[1]).Text != null)
                {
                    r.partner_id = Convert.ToInt32(((Label)rw.Cells[7].Controls[1]).Text);
                }
                r.cab_id = Convert.ToInt32(((Label)rw.Cells[8].Controls[1]).Text);
                Session["reservation_details"] = r;
                Response.Redirect("viewmore.aspx", true);
            }
        }

        protected void dgvReservation_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                LinkButton btnViewMore = (LinkButton)e.Row.Cells[9].Controls[1];
                btnViewMore.CommandArgument = e.Row.RowIndex.ToString();
            }
        }
    }
}