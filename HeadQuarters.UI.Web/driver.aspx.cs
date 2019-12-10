using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HeadQuarters.BO;
using System.Configuration;
using System.Collections;

namespace HeadQuarters.UI.Web
{
    public partial class driver : System.Web.UI.Page
    {
        string connString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] != null)
            {
                char firstLetter = ((string)Session["username"])[0];
                if (firstLetter != 'd' && firstLetter != 'D' && firstLetter!='a' && firstLetter!='A')
                {
                    Response.Redirect("permission.aspx", true);
                }
            }
            else
            {
                Response.Redirect("permission.aspx", true);
            }
        }

        protected void btnUpdate_Click1(object sender, EventArgs e)
        {

        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            Validator v=new Validator();
            if (!v.isPresent(txtID))
            {
                lbl_error_message.Text = "Enter Reservation ID!";
            }
            else {
                int reservationID = Convert.ToInt32(txtID.Text);
                Decimal tot = 0;
                Decimal addDis = 0;
                string status = ddl_status.SelectedItem.Text;
                string feed = "";

                if (v.isPresent(txtAddDis))
                {
                    addDis = Convert.ToDecimal(txtAddDis.Text);
                }
                
                if (v.isPresent(txtTot))
                {
                    tot = Convert.ToDecimal(txtTot.Text);
                }
                else {
                    Decimal totDis = 0;
                    Reservation r = new Reservation();
                    Settings s = new Settings();
                    if (v.isPresent(txtAddDis))
                    {
                        totDis = r.GetDistanceAccordingToReservationID(connString, Convert.ToInt32(txtID.Text)) + Convert.ToDecimal(txtAddDis.Text);
                    }
                    else
                    {
                        totDis = r.GetDistanceAccordingToReservationID(connString, Convert.ToInt32(txtID.Text));
                    }
                    Decimal totKmCost = totDis * s.GetKmRateAccordingToReservationID(connString, Convert.ToInt32(txtID.Text));
                    DateTime []h = new DateTime[2];
                    h = r.GetDateTimeAccordingToReservationID(connString, Convert.ToInt32(txtID.Text));
                    DateTime pick = h[0];
                    DateTime drop = h[1];
                    TimeSpan span = drop.Subtract(pick);
                    Decimal totHrs= (Decimal)span.TotalHours;
                    Decimal totHrCost = totHrs * s.GetHrRateAccordingToReservationID(connString, Convert.ToInt32(txtID.Text));
                    tot = totKmCost + totHrCost;
                }
                if(v.isPresent(txtFeedback)){
                    feed = txtFeedback.Text;
                }
                Reservation res = new Reservation();
                res.reservation_id = reservationID;
                res.additional_distance = addDis;
                res.total = tot;
                res.status = status;
                res.feedback = feed;
                if (res.UpdateBillDetails(connString))
                {
                    lbl_error_message.Text = "Updated Successfully!";
                }
                else {
                    lbl_error_message.Text = "Error Occurred!";
                }
            }
        }

        protected void btnTotal_Click(object sender, EventArgs e)
        {
            Decimal totDis=0;
            Decimal totMoney = 0;
            Validator v = new Validator();
            Reservation r=new Reservation();
            Settings s=new Settings();
            if (v.isPresent(txtID))
            {
                if (v.isPresent(txtAddDis))
                {
                    totDis = r.GetDistanceAccordingToReservationID(connString, Convert.ToInt32(txtID.Text)) + Convert.ToDecimal(txtAddDis.Text);
                }
                else {
                    totDis = r.GetDistanceAccordingToReservationID(connString, Convert.ToInt32(txtID.Text));
                }
                Decimal totKmCost = totDis * s.GetKmRateAccordingToReservationID(connString, Convert.ToInt32(txtID.Text));
                DateTime[] h = new DateTime[2];
                h = r.GetDateTimeAccordingToReservationID(connString, Convert.ToInt32(txtID.Text));
                DateTime pick = h[0];
                DateTime drop = h[1];
                TimeSpan span = drop.Subtract(pick);
                Decimal totHrs = (Decimal)span.TotalHours;
                Decimal totHrCost = totHrs * s.GetHrRateAccordingToReservationID(connString, Convert.ToInt32(txtID.Text));
                totMoney = totKmCost + totHrCost;
                txtTot.Text = Math.Round(totMoney,2) + "";
            }
            else {
                lbl_error_message.Text = "Enter Reservation ID!";
            }
            
        }
    }
}