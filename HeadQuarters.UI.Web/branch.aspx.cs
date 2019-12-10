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
    public partial class branch : System.Web.UI.Page
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
                LoadBranch();
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                
                Validator v = new Validator();
                if (!v.isPresent(txtAddress))
                {
                    lbl_error_message.Text = "Enter Address";
                }
                else if (!v.isPresent(txtCity))
                {
                    lbl_error_message.Text = "Enter City";
                }
                else if (!v.isPresent(txtPhone))
                {
                    lbl_error_message.Text = "Enter Phone No";
                }
                else
                {
                    if (!v.isValidPhoneNumber(txtPhone.Text))
                    {
                        lbl_error_message.Text = "Enter Valid Phone No";
                    }
                    else
                    {
                        try
                        {
                            Branch branchObj = new Branch(txtAddress.Text, txtPhone.Text, txtCity.Text);
                            if (branchObj.AddBranch(connString))
                            {
                                lbl_error_message.Text = "Inserted Successfully";
                                LoadBranch();
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
            catch (Exception ex)
            {

                lbl_error_message.Text = ex.Message;
            }
        }


        private void LoadBranch()
        {
            try
            {
                Branch BranchObj = new Branch();
                dgvBranch.DataSource = BranchObj.GetBranchInfo(connString);
                dgvBranch.DataBind(); 
            }
            catch (Exception ex)
            {

                lbl_error_message.Text = ex.Message;
            }
        }


        protected void dgvBranch_RowCommand(object sender, GridViewCommandEventArgs e)
        {
   
            int rIndex = Convert.ToInt32(e.CommandArgument);
            GridViewRow row = dgvBranch.Rows[rIndex];
            if (e.CommandName == "cmdEdit")
            {
                lbl_error_message.Text = "";
                txtID.Text = ((Label)row.Cells[0].Controls[1]).Text;
                txtAddress.Text = ((Label)row.Cells[1].Controls[1]).Text;
                txtCity.Text = ((Label)row.Cells[2].Controls[1]).Text;
                txtPhone.Text = ((Label)row.Cells[3].Controls[1]).Text;
                

            }
            else if (e.CommandName == "cmdDelete")
            {                
                Branch BObj = new Branch();
                BObj.branch_id = Convert.ToInt32(((Label)row.Cells[0].Controls[1]).Text);
                if (BObj.RemoveBranch(connString))
                {
                    lbl_error_message.Text = "Deleted Successfully";
                    LoadBranch();
                }
                else {
                    lbl_error_message.Text = "Sorry,Error Occurred!";
                }
            }
           

        }


        protected void dgvBranch_RowCreated(object sender, GridViewRowEventArgs e)
        {

            if (e.Row.RowType == DataControlRowType.DataRow)
            {

                ImageButton bEdit = (ImageButton)e.Row.Cells[4].Controls[1];
                bEdit.CommandArgument = e.Row.RowIndex.ToString();

                ImageButton bDelete = (ImageButton)e.Row.Cells[5].Controls[1];
                bDelete.CommandArgument = e.Row.RowIndex.ToString();

            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            try
            {
                
                Validator v = new Validator();
                if (!v.isPresent(txtAddress))
                {
                    lbl_error_message.Text = "Enter Address";
                }
                else if (!v.isPresent(txtCity))
                {
                    lbl_error_message.Text = "Enter City";
                }
                else if (!v.isPresent(txtPhone))
                {
                    lbl_error_message.Text = "Enter Phone No";
                }
                else
                {
                    if (!v.isValidPhoneNumber(txtPhone.Text))
                    {
                        lbl_error_message.Text = "Enter Valid Phone No";
                    }
                    else
                    {
                        try
                        {
                            int branchID = Convert.ToInt32(txtID.Text);
                            Branch branchObj = new Branch(branchID, txtAddress.Text, txtPhone.Text, txtCity.Text);
                            if (branchObj.UpdateBranch(connString))
                            {
                                lbl_error_message.Text = "Updated Successfully";
                                LoadBranch();
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
            catch (Exception ex)
            {

                lbl_error_message.Text = ex.Message;
            }
        }

        protected void btnRefresh_Click(object sender, EventArgs e)
        {
            txtID.Text = "";
            txtAddress.Text = "";
            txtCity.Text = "";
            txtPhone.Text = "";
            lbl_error_message.Text = "";
        }



    }

}