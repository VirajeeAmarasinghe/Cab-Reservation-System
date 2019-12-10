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
    public partial class cab : System.Web.UI.Page
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
                LoadType();
                LoadBranch();
                LoadCab();
            }
        }

        private void LoadType()
        {
            try
            {
                Cab limo = new Cab();
                drop_down_list_type.DataSource = limo.GetTypeInfo(connString);
                drop_down_list_type.DataBind();
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
                Branch limo = new Branch();
                drop_down_list_branch.DataSource = limo.GetAllBranchLocation(connString);
                drop_down_list_branch.DataBind();
            }
            catch (Exception ex)
            {
                lbl_error_message.Text = ex.Message;

            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                
                Validator v = new Validator();
                if (!v.isPresent(txtNo))
                {
                    lbl_error_message.Text = "Enter Cab Registration Number";
                }
                else
                {
                    if (!v.isValidCabNumber(txtNo.Text))
                    {
                        lbl_error_message.Text = "Enter Valid Cab Number";
                    }
                    else
                    {
                        try
                        {
                            Cab c = new Cab();
                            Settings s = new Settings();
                            Branch b = new Branch();
                            c.type = drop_down_list_type.SelectedItem.Text;
                            int typeID = s.GetTypeID(connString, drop_down_list_type.SelectedItem.Text);
                            c.branch_location = drop_down_list_branch.SelectedItem.Text;
                            int branch_id = b.GetBranchID(connString, drop_down_list_branch.SelectedItem.Text);
                            Cab cab = new Cab(typeID, branch_id, txtNo.Text);
                            if (cab.AddCab(connString))
                            {
                                lbl_error_message.Text = "Inserted Successfully";
                                LoadCab();
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

                lbl_error_message.Text = ex.ToString();
            }
        }


        private void LoadCab()
        {
            try
            {
                Cab CabObj = new Cab();
                dgvCab.DataSource = CabObj.GetCabInfo(connString);
                dgvCab.DataBind();
            }
            catch (Exception ex)
            {

                lbl_error_message.Text = ex.Message;
            }
        }


        protected void dgvCab_RowCommand(object sender, GridViewCommandEventArgs e)
        {

            int rIndex = Convert.ToInt32(e.CommandArgument);
            GridViewRow rw = dgvCab.Rows[rIndex];
            if (e.CommandName == "cmdEdit")
            {
                Cab c = new Cab();
                Settings s = new Settings();
                Branch b = new Branch();
                txtID.Text = ((Label)rw.Cells[0].Controls[1]).Text;                
                drop_down_list_type.ClearSelection();
                string typeValue = s.GetTypeAccordingToTypeId(connString, Convert.ToInt32(((Label)rw.Cells[1].Controls[1]).Text));                
                drop_down_list_type.Items.FindByValue(typeValue).Selected = true;
                txtNo.Text = ((Label)rw.Cells[2].Controls[1]).Text;
                drop_down_list_branch.ClearSelection();
                string loc = b.GetLocationAccordingToBranchId(connString, Convert.ToInt32(((Label)rw.Cells[3].Controls[1]).Text));
                drop_down_list_branch.Items.FindByValue(loc).Selected = true;
                
            }
            else if (e.CommandName == "cmdDelete")
            {
                Cab CObj = new Cab();
                CObj.cab_id = Convert.ToInt32(((Label)rw.Cells[0].Controls[1]).Text);
                if (CObj.RemoveCab(connString))
                {
                    lbl_error_message.Text = "Deleted Successfully";
                    LoadCab();
                }
                else {
                    lbl_error_message.Text = "Sorry,Error Occurred";
                }
            }


        }


        protected void dgvCab_RowCreated(object sender, GridViewRowEventArgs e)
        {

            if (e.Row.RowType == DataControlRowType.DataRow)
            {

                ImageButton bEdit = (ImageButton)e.Row.Cells[4].Controls[1];
                bEdit.CommandArgument = e.Row.RowIndex.ToString();

                ImageButton bDelete = (ImageButton)e.Row.Cells[5].Controls[1];
                bDelete.CommandArgument = e.Row.RowIndex.ToString();

            }
        }


        protected void btnUpdate_Click1(object sender, EventArgs e)
        {
            try
            {
                
                Validator v = new Validator();
                if (!v.isPresent(txtNo))
                {
                    lbl_error_message.Text = "Enter Cab Registration Number";
                }
                else
                {
                    if (!v.isValidCabNumber(txtNo.Text))
                    {
                        lbl_error_message.Text = "Enter Valid Cab Nuumber";
                    }
                    else
                    {
                        try
                        {
                            Cab c = new Cab();
                            Settings s = new Settings();
                            Branch b = new Branch();
                            int cabID = Convert.ToInt32(txtID.Text);
                            c.type = drop_down_list_type.SelectedItem.Text;
                            int typeID = s.GetTypeID(connString, drop_down_list_type.SelectedItem.Text);
                            c.branch_location = drop_down_list_branch.SelectedItem.Text;
                            int branch_id = b.GetBranchID(connString, drop_down_list_branch.SelectedItem.Text);
                            Cab cab = new Cab(cabID,typeID, branch_id, txtNo.Text);
                            if (cab.UpdateCab(connString))
                            {
                                lbl_error_message.Text = "Updated Successfully";
                                LoadCab();
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

                lbl_error_message.Text = ex.ToString();
            }
        }

        protected void btnRefresh_Click(object sender, EventArgs e)
        {
            lbl_error_message.Text = "";
            txtID.Text = "";
            txtNo.Text = "";
            drop_down_list_branch.SelectedIndex = 0;
            drop_down_list_type.SelectedIndex = 0;
        }
    }
}