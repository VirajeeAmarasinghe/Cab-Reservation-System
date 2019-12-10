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
    public partial class viewmore : System.Web.UI.Page
    {
        string connString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            Reservation r = (Reservation)Session["reservation_details"];
            txtreserID.Text = Convert.ToString(r.reservation_id);
            txtPickAdd.Text = r.pick_up_address;
            txtDest.Text = r.destination;
            txtPickDate.Text = Convert.ToString(r.pick_up_date_time);
            txtDropDate.Text = Convert.ToString(r.drop_date_time);
            txtDistance.Text = Convert.ToString(r.distance);
            int clientID = r.client_id;
            Client c = new Client();
            c = c.GetClientInfoAccordingToID(connString,clientID);
            txtClientName.Text = c.first_name + " " + c.last_name;
            txtClientNo.Text = c.contact_number;
            Cab ca = new Cab();
            int cabId = r.cab_id;
            string cabNo = ca.GetCabRegNo(connString,cabId);
            txtCab.Text = cabNo;
        }
    }
}