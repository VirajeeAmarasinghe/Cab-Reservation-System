using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HeadQuarters.BO;
using System.Configuration;
using System.Globalization;


namespace HeadQuarters.UI.Web
{
    public partial class reservation : System.Web.UI.Page
    {
        string connString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;


        protected void Page_Load(object sender, EventArgs e)
        {

            //if (Session["username"] != null)
            //{
            //    char firstLetter = ((string)Session["username"])[0];
            //    if (firstLetter == 'd' || firstLetter == 'D')
            //    {
            //        Response.Redirect("permission.aspx", true);
            //    }
            //}
            //else
            //{
            //    Response.Redirect("permission.aspx", true);
            //}


            if (!Page.IsPostBack)
            {
                LoadReservation();
            }
        }


        private void LoadReservation()
        {
            try
            {
                Reservation ReservationObj = new Reservation();
                dgvReservation.DataSource = ReservationObj.GetReservationInfo(connString);
                dgvReservation.DataBind();
            }
            catch (Exception ex)
            {

                
            }
        }

        protected void dgvReservation_RowCommand(object sender, GridViewCommandEventArgs e)
        {

            int rIndex = Convert.ToInt32(e.CommandArgument);
            GridViewRow row = dgvReservation.Rows[rIndex];
            if (e.CommandName == "cmdEdit")
            {

                txtReservID.Text = ((Label)row.Cells[0].Controls[1]).Text;
                txtCabID.Text = ((Label)row.Cells[1].Controls[1]).Text;
                txtPickUpAddress.Text = ((Label)row.Cells[2].Controls[1]).Text;
                txtDropAddress.Text = ((Label)row.Cells[3].Controls[1]).Text;
                txtDistance.Text = ((Label)row.Cells[4].Controls[1]).Text;
                txtPickUpDate.Text = ((Label)row.Cells[5].Controls[1]).Text;
                txtDropTime.Text = ((Label)row.Cells[6].Controls[1]).Text;
                txtTot.Text = ((Label)row.Cells[7].Controls[1]).Text;

                Branch b = new Branch();
                string brnch = b.GetLocationAccordingToBranchId(connString,Convert.ToInt32(((Label)row.Cells[10].Controls[1]).Text));
                //dropDownList_branch.Items.FindByValue(brnch).Selected = true;
                txtEmpID.Text = ((Label)row.Cells[11].Controls[1]).Text;
                txtCabID.Text = ((Label)row.Cells[12].Controls[1]).Text;

                int clientID = Convert.ToInt32(((Label)row.Cells[12].Controls[1]).Text);
                Client c = new Client();
                c = c.GetClientInfoAccordingToID(connString, clientID);
                txtFname.Text = c.first_name;
                txtLname.Text = c.last_name;
                txtPhone.Text = c.contact_number;
                txtEmail.Text = c.email;
      

            }
            else if (e.CommandName == "cmdDelete")
            {
                Reservation RObj = new Reservation();
                RObj.reservation_id = Convert.ToInt32(((Label)row.Cells[0].Controls[1]).Text);
                if (RObj.RemoveReservation(connString))
                {
                    lbl_error_message.Text = "Deleted Successfully!";
                    LoadReservation();
                }
            }


        }


        protected void dgvReservation_RowCreated(object sender, GridViewRowEventArgs e)
        {

            if (e.Row.RowType == DataControlRowType.DataRow)
            {

                ImageButton bEdit = (ImageButton)e.Row.Cells[15].Controls[1];
                bEdit.CommandArgument = e.Row.RowIndex.ToString();

                ImageButton bDelete = (ImageButton)e.Row.Cells[16].Controls[1];
                bDelete.CommandArgument = e.Row.RowIndex.ToString();

            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            Validator v = new Validator();
            if (!v.isPresent(txtFname))
            {
                lbl_error_message.Text = "Enter First Name!";
            }
            else if (!v.isPresent(txtLname))
            {
                lbl_error_message.Text = "Enter Last Name!";
            }
            else if (!v.isPresent(txtPhone))
            {
                lbl_error_message.Text = "Enter Contact No!";
            }
            else if (!v.isPresent(txtPickUpAddress))
            {
                lbl_error_message.Text = "Enter Pick Up Address!";
            }
            else if (!v.isPresent(txtDropAddress))
            {
                lbl_error_message.Text = "Enter Drop Address!";
            }
            else if (!v.isPresent(txtPickUpDate))
            {
                lbl_error_message.Text = "Enter Pick Up Date!";
            }
            else if (!v.isPresent(txtPickUpTime))
            {
                lbl_error_message.Text = "Enter Pick Up Time!";
            }
            else if (!v.isPresent(txtDropDate))
            {
                lbl_error_message.Text = "Enter Drop Date!";
            }
            else if (!v.isPresent(txtDropTime))
            {
                lbl_error_message.Text = "Enter Drop Time!";
            }
            else if (!v.isPresent(txtDistance))
            {
                lbl_error_message.Text = "Enter Distance!";
            }
            else
            {
                if (v.isPresent(txtEmail))
                {
                    if (!v.isValidEmail(txtEmail.Text))
                    {
                        lbl_error_message.Text = "Enter Valid Email!";
                    }
                }
                if (!v.isValidPhoneNumber(txtPhone.Text))
                {
                    lbl_error_message.Text = "Enter Valid Contact No!";
                }
                else
                {
                    try
                    {

                        string pickUpAdd = txtPickUpAddress.Text;
                        string dropAdd = txtDropAddress.Text;
                        Decimal distance = Convert.ToDecimal(txtDistance.Text);

                        string dateStart = "";
                        string dateEnd = "";

                        dateStart = txtPickUpDate.Text + " " + txtPickUpTime.Text + ":00.000";
                        dateEnd = txtDropDate.Text + " " + txtDropTime.Text + ":00.000";

                        DateTime pickDateTime = Convert.ToDateTime(dateStart);
                        DateTime dropDateTime = Convert.ToDateTime(dateEnd);

                        string a = pickDateTime.ToString();

                        //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('"+a+"')", true);

                        string branchLoc = dropDownList_branch.SelectedItem.Text;
                        int branchID = new Branch().GetBranchID(connString, branchLoc);

                        int clientID = new Client().GetMaxClientID(connString);

                        Decimal tot = 0;
                        if (v.isPresent(txtTot))
                        {
                            tot = Convert.ToDecimal(txtTot.Text);
                        }

                        Reservation resObj = new Reservation();

                        Employee em = new Employee();

                        bool canReserve = true;
                        int employeeID = 0;
                        em = resObj.DispatchDriver(connString, pickDateTime, dropDateTime, branchLoc);
                        if (em != null)
                        {
                            employeeID = em.employee_id;
                        }
                        else
                        {
                            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Sorry,Reservation can not be done,becuase no drivers at the moment!')", true);
                            canReserve = false;
                        }

                        Cab c = new Cab();
                        c = resObj.DispatchCab(connString, pickDateTime, dropDateTime, dropDownList_vehicleType.SelectedItem.Text, branchLoc);
                        int cabID = 0;
                        if (c != null)
                        {
                            cabID = c.cab_id;
                        }
                        else
                        {
                            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Sorry,Reservation can not be done,becuase no cabs at the moment!')", true);
                            canReserve = false;
                        }

                        if (canReserve == true)
                        {
                            //insert client details
                            string fName = txtFname.Text;
                            string lName = txtLname.Text;
                            string conNo = txtPhone.Text;
                            string email = "";
                            if (v.isPresent(txtEmail))
                            {
                                email = txtEmail.Text;
                            }
                            Client cl = new Client(fName, lName, conNo, email);
                            if (cl.AddClient(connString))
                            {
                                Reservation r = new Reservation(pickUpAdd, dropAdd, distance, pickDateTime, dropDateTime, employeeID, branchID, clientID, cabID, tot);
                                if (r.AddReservationAsClient(connString))
                                {
                                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Inserted Successfully!')", true);
                                    int maxReservationID = new Reservation().GetMaxReservationID(connString);
                                    string message = "Your Reference ID:" + maxReservationID + "\n" + "Driver Name:" + em.first_name + " " + em.last_name + "\n" + "Driver Contact No:" + em.contact_number + "\n" + "Cab Registration No:" + c.cab_registration_no;
                                    lbl_error_message.Text = message;
                                    clear();
                                }
                                else
                                {
                                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Sorry,Error Occurred!')", true);
                                }
                            }
                            else
                            {
                                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Sorry,Error Occurred!')", true);
                            }
                        }
                    }
                    catch (Exception ex)
                    {

                        lbl_error_message.Text = ex.ToString();
                    }
                }
            }      
        }

        private void clear()
        {
            txtDistance.Text = "";
            txtDropAddress.Text = "";
            txtDropDate.Text = "";
            txtDropTime.Text = "";
            txtEmail.Text = "";
            txtFname.Text = "";
            txtLname.Text = "";
            txtPhone.Text = "";
            txtPickUpAddress.Text = "";
            txtPickUpDate.Text = "";
            txtPickUpTime.Text = "";
            txtTot.Text = "";
            txtTotHrs.Text = "";
        }

        protected void btnTot_Click(object sender, EventArgs e)
        {
            string type = dropDownList_vehicleType.SelectedItem.Text;
            Settings s = new Settings();
            int typeID = s.GetTypeID(connString, type);
            s = s.GetRatesAccordingToTypeId(connString, typeID);
            Validator v = new Validator();
            if (v.isPresent(txtDistance) && v.isPresent(txtTotHrs))
            {
                Decimal distance = Convert.ToDecimal(txtDistance.Text);
                Decimal hrs = Convert.ToDecimal(txtTotHrs.Text);
                Decimal subTot = (distance * s.km_rate) + (hrs * s.hourly_rate);
                txtTot.Text = subTot + "";
            }
            else if (!v.isPresent(txtDistance) && !v.isPresent(txtTotHrs))
            {
                txtDistance.Text = "Before Calculting Cost, Get Distance!";
                txtTotHrs.Text = "Before Calcultaing Cost, Get Total Hrs!";
            }
            else if (!v.isPresent(txtDistance))
            {
                txtDistance.Text = "Before Calculting Cost, Get Distance!";
            }
            else if (!v.isPresent(txtTotHrs))
            {
                txtTotHrs.Text = "Before Calcultaing Cost, Get Total Hrs!";
            }
        }

        protected void btnTotHrs_Click(object sender, EventArgs e)
        {
            Validator v = new Validator();
            if (v.isPresent(txtPickUpDate) && v.isPresent(txtPickUpTime) && v.isPresent(txtDropDate) && v.isPresent(txtDropTime))
            {
                string dateStart = "";
                string dateEnd = "";

                dateStart = txtPickUpDate.Text + " " + txtPickUpTime.Text + ":00";
                dateEnd = txtDropDate.Text + " " + txtDropTime.Text + ":00";

                DateTime pickTime = Convert.ToDateTime(dateStart);
                DateTime dropTime = Convert.ToDateTime(dateEnd);

                TimeSpan span = dropTime.Subtract(pickTime);
                txtTotHrs.Text = span.TotalHours + "";
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
                try
                {

                    string pickUpAdd = txtPickUpAddress.Text;
                    string dropAdd = txtDropAddress.Text;
                    string dateStart = "";
                    string dateEnd = "";

                    dateStart = txtPickUpDate.Text + " " + txtPickUpTime.Text + ":00.000";
                    dateEnd = txtDropDate.Text + " " + txtDropTime.Text + ":00.000";

                    DateTime pickDateTime = Convert.ToDateTime(dateStart);
                    DateTime dropDateTime = Convert.ToDateTime(dateEnd);

                    string branchLoc = dropDownList_branch.SelectedItem.Text;

                    Decimal dis = Convert.ToDecimal(txtDistance.Text);
                    int branchID = new Branch().GetBranchID(connString, branchLoc);
                    int employeeId = Convert.ToInt32(txtEmpID.Text);
                    int cabID = Convert.ToInt32(txtCabID.Text);
                    int reservID = Convert.ToInt32(txtReservID.Text);


                    Reservation ReservationObj = new Reservation();
                    ReservationObj.pick_up_address = pickUpAdd;
                    ReservationObj.destination = dropAdd;
                    ReservationObj.pick_up_date_time = pickDateTime;
                    ReservationObj.drop_date_time = dropDateTime;
                    ReservationObj.branch_id = branchID;
                    ReservationObj.employee_id = employeeId;
                    ReservationObj.cab_id = cabID;
                    ReservationObj.reservation_id = reservID;
                    ReservationObj.distance = dis;

                    if (ReservationObj.UpdateClientReservationBasicThings(connString))
                    {
                        LoadReservation();
                        lbl_error_message.Text = "Updated Successfully!";
                    }
                    else
                    {
                        lbl_error_message.Text = "Sorry,Error Occurred!";
                    }
                }
                catch (Exception ex)
                {

                    lbl_error_message.Text = ex.Message;
                }
        }
    }
}