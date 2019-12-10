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
    public partial class employee : System.Web.UI.Page
    {
        string connString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;


        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["username"] != null)
            {
                char firstLetter = ((string)Session["username"])[0];
                if (firstLetter != 'a' && firstLetter != 'A')
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
                LoadEmployee();
                LoadBranch();
                LoadJobTitle();
            }
        }

        private void LoadBranch()
        {
            try
            {
                Branch b = new Branch();
                drop_down_list_branch.DataSource = b.GetAllBranchLocation(connString);
                drop_down_list_branch.DataBind();
            }
            catch (Exception ex)
            {
                lbl_error_message.Text = ex.Message;

            }
        }

        private void LoadJobTitle()
        {
            try
            {
                Settings s = new Settings();
                drop_down_list_job.DataSource = s.GetAllJobTitles(connString);
                drop_down_list_job.DataBind();
            }
            catch (Exception ex)
            {
                lbl_error_message.Text = ex.Message;

            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            
                Validator v = new Validator();
                if(!v.isPresent(txtFirstName)){
                    lbl_error_message.Text = "Enter First Name!";
                }else if(!v.isPresent(txtLastName)){
                    lbl_error_message.Text = "Enter Last Name!";
                }else if(!v.isPresent(txtNIC)){
                    lbl_error_message.Text = "Enter NIC!";
                }else if(!v.isPresent(txtDateOfBirth)){
                    lbl_error_message.Text = "Enter Date of Birth!";
                }else if(!v.isPresent(txtPhone)){
                    lbl_error_message.Text = "Enter Phone Number!";
                }else {
                    if(!v.isValidPhoneNumber(txtPhone.Text)){
                        lbl_error_message.Text = "Enter Valid Phone Number!";
                    }else {
                        try
                        {
                            string fName = txtFirstName.Text;
                            string lname = txtLastName.Text;
                            string nic = txtNIC.Text;
                            DateTime bday = DateTime.Parse(Request.Form[txtDateOfBirth.UniqueID]);
                            string contactNo = txtPhone.Text;                            
                            string job = drop_down_list_job.SelectedItem.Text;
                            string branch =drop_down_list_branch.SelectedItem.Text;
                            Settings s=new Settings();
                            Branch b=new Branch();
                            int jobID = s.GetJobIdAccordingToJobTitle(connString,job);
                            int branchID = b.GetBranchID(connString,branch);
                            Employee em=new Employee(fName,lname,nic,bday,contactNo,branchID,jobID,job);                           
                            if (em.AddEmployee(connString))
                            {
                                lbl_error_message.Text = "Inserted Successfully";
                                LoadEmployee();
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

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            Validator v = new Validator();
            if (!v.isPresent(txtFirstName))
            {
                lbl_error_message.Text = "Enter First Name!";
            }
            else if (!v.isPresent(txtLastName))
            {
                lbl_error_message.Text = "Enter Last Name!";
            }
            else if (!v.isPresent(txtNIC))
            {
                lbl_error_message.Text = "Enter NIC!";
            }
            else if (!v.isPresent(txtDateOfBirth))
            {
                lbl_error_message.Text = "Enter Date of Birth!";
            }
            else if (!v.isPresent(txtPhone))
            {
                lbl_error_message.Text = "Enter Phone Number!";
            }            
            else
            {
                if (!v.isValidPhoneNumber(txtPhone.Text))
                {
                    lbl_error_message.Text = "Enter Valid Phone Number!";
                }else
                {
                    try
                    {
                        int emID = Convert.ToInt32(txtID.Text);
                        string fName = txtFirstName.Text;
                        string lname = txtLastName.Text;
                        string nic = txtNIC.Text;
                        DateTime bday = DateTime.Parse(Request.Form[txtDateOfBirth.UniqueID]);
                        string contactNo = txtPhone.Text;
                        string job = drop_down_list_job.SelectedItem.Text;
                        string branch = drop_down_list_branch.SelectedItem.Text;
                        Settings s = new Settings();
                        Branch b = new Branch();
                        int jobID = s.GetJobIdAccordingToJobTitle(connString, job);
                        int branchID = b.GetBranchID(connString, branch);
                        Employee em = new Employee(emID, fName, lname, nic, bday, contactNo, branchID, jobID);
                        if (em.UpdateEmployee(connString))
                        {
                            lbl_error_message.Text = "Updated Successfully";
                            LoadEmployee();
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


        private void LoadEmployee()
        {
            try
            {
                Employee EmployeeObj = new Employee();
                dgvEmployee.DataSource = EmployeeObj.GetEmployeeInfo(connString);
                dgvEmployee.DataBind();
            }
            catch (Exception ex)
            {
                lbl_error_message.Text = ex.ToString();
            }
        }

        protected void dgvEmployee_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {

                ImageButton bEdit = (ImageButton)e.Row.Cells[10].Controls[1];
                bEdit.CommandArgument = e.Row.RowIndex.ToString();

                ImageButton bDelete = (ImageButton)e.Row.Cells[11].Controls[1];
                bDelete.CommandArgument = e.Row.RowIndex.ToString();

            }
        }

        protected void dgvEmployee_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int rIndex = Convert.ToInt32(e.CommandArgument);
            GridViewRow row = dgvEmployee.Rows[rIndex];
            if (e.CommandName == "cmdEdit")
            {

                txtID.Text = ((Label)row.Cells[0].Controls[1]).Text;
                txtFirstName.Text = ((Label)row.Cells[1].Controls[1]).Text;
                txtLastName.Text = ((Label)row.Cells[2].Controls[1]).Text;
                txtNIC.Text = ((Label)row.Cells[3].Controls[1]).Text;                 
                txtDateOfBirth.Text = ((Label)row.Cells[4].Controls[1]).Text;
                txtPhone.Text = ((Label)row.Cells[5].Controls[1]).Text;
                txtUsername.Text = ((Label)row.Cells[6].Controls[1]).Text;
                txtPassword.Attributes.Add("value", ((Label)row.Cells[7].Controls[1]).Text);                
                Settings s = new Settings();
                string jobTitle = s.GetJobTitleAccordingToJobId(connString,Convert.ToInt32(((Label)row.Cells[8].Controls[1]).Text));
                drop_down_list_job.ClearSelection();
                drop_down_list_job.Items.FindByValue(jobTitle).Selected = true ;
                drop_down_list_branch.ClearSelection();
                Branch b = new Branch();
                string loc = b.GetLocationAccordingToBranchId(connString, Convert.ToInt32(((Label)row.Cells[9].Controls[1]).Text));
                drop_down_list_branch.Items.FindByValue(loc).Selected = true;

            }
            else if (e.CommandName == "cmdDelete")
            {
                Employee EObj = new Employee();
                EObj.employee_id = Convert.ToInt32(((Label)row.Cells[0].Controls[1]).Text);
                if (EObj.RemoveEmployee(connString))
                {
                    lbl_error_message.Text = "Deleted Successfully!";
                    LoadEmployee();
                }
            }

        }

        protected void btnRefresh_Click(object sender, EventArgs e)
        {
            lbl_error_message.Text = "";
            txtDateOfBirth.Text = "";
            txtFirstName.Text = "";
            txtID.Text = "";
            txtLastName.Text = "";
            txtNIC.Text = "";
            txtPassword.Text = "";
            txtPhone.Text = "";
            txtUsername.Text = "";
            txtPassword.Text = "";
            drop_down_list_branch.SelectedIndex = 0;
            drop_down_list_job.SelectedIndex = 0;
        }












    }
}