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
    public partial class type : System.Web.UI.Page
    {
        string connString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["username"] != null)
            {
                char firstLetter = ((string)Session["username"])[0];
                if (firstLetter == 'd' || firstLetter == 'D' || firstLetter == 's' || firstLetter == 'S')
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
            }

        }

        private void LoadType()
        {
            try
            {
                Settings s = new Settings();
                dgv_type.DataSource = s.GetTypeInfo(connString);
                dgv_type.DataBind();
            }
            catch (Exception ex)
            {
                lbl_error_message.Text = ex.Message;

            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            Validator v = new Validator();
            if(!v.isPresent(txtType)){
                lbl_error_message.Text = "Enter type!";
            }else if(!v.isPresent(txtKm)){
                lbl_error_message.Text = "Enter km rate!";
            }
            else if (!v.isPresent(txtHours))
            {
                lbl_error_message.Text = "Enter hourly rate!";
            }
            else {
                if(!v.isValidTotal(txtKm.Text)){
                    lbl_error_message.Text = "Enter valid km rate!";
                }
                else if (!v.isValidTotal(txtHours.Text))
                {
                    lbl_error_message.Text = "Enter valid hourly rate!";
                }
                else {
                    Settings s = new Settings(txtType.Text, Convert.ToDecimal(txtKm.Text), Convert.ToDecimal(txtHours.Text));
                    try
                    {
                        if (s.AddType(connString))
                        {
                            lbl_error_message.Text = "Inserted Successfully!";
                            LoadType();
                        }
                        else {
                            lbl_error_message.Text = "Error Occurred!";
                        }
                    }
                    catch (Exception ex)
                    {
                        
                        lbl_error_message.Text=ex.Message;
                    }
                }
            }  
        }

        protected void dgv_type_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int rIndex = Convert.ToInt32(e.CommandArgument);
            GridViewRow rw = dgv_type.Rows[rIndex];
            if (e.CommandName == "btn_edit")
            {
                txtID.Text = ((Label)rw.Cells[0].Controls[1]).Text;
                txtType.Text = ((Label)rw.Cells[1].Controls[1]).Text;
                txtKm.Text = ((Label)rw.Cells[2].Controls[1]).Text;
                txtHours.Text = ((Label)rw.Cells[3].Controls[1]).Text;
            }
            else if (e.CommandName == "btn_delete")
            {
                Settings se = new Settings();
                se.type_id = Convert.ToInt32(((Label)rw.Cells[0].Controls[1]).Text);
                if (se.RemoveType(connString))
                {
                    lbl_error_message.Text = "Deleted Successfully";
                    LoadType();
                }
                else
                {
                    lbl_error_message.Text = "Sorry,Error Occurred";
                }
            }
        }

        protected void dgv_type_RowCreated(object sender, GridViewRowEventArgs e)
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
            Validator v = new Validator();
            if (!v.isPresent(txtType))
            {
                lbl_error_message.Text = "Enter type!";
            }
            else if (!v.isPresent(txtKm))
            {
                lbl_error_message.Text = "Enter km rate!";
            }
            else if (!v.isPresent(txtHours))
            {
                lbl_error_message.Text = "Enter hourly rate!";
            }
            else
            {
                if (!v.isValidTotal(txtKm.Text))
                {
                    lbl_error_message.Text = "Enter valid km rate!";
                }
                else if (!v.isValidTotal(txtHours.Text))
                {
                    lbl_error_message.Text = "Enter valid hourly rate!";
                }
                else
                {
                    Settings s = new Settings(txtType.Text, Convert.ToDecimal(txtKm.Text), Convert.ToDecimal(txtHours.Text));
                    try
                    {
                        if (s.UpdateType(connString,Convert.ToInt32(txtID.Text)))
                        {
                            lbl_error_message.Text = "Updated Successfully!";
                            LoadType();
                        }
                        else
                        {
                            lbl_error_message.Text = "Error Occurred!";
                        }
                    }
                    catch (Exception ex)
                    {

                        lbl_error_message.Text = ex.ToString();
                    }
                }
            }  
        }

        protected void btnRefresh_Click(object sender, EventArgs e)
        {
            lbl_error_message.Text = "";
            txtID.Text = "";
            txtType.Text = "";
            txtKm.Text = "";
            txtHours.Text = "";
        }
    }
}