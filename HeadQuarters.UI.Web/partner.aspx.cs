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
    public partial class partner : System.Web.UI.Page
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
                LoadPartner();
            }


        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                
                Partner PartnerObj = new Partner(txtAbout.Text,txtPhone.Text,txtAddress.Text);
  
                if (PartnerObj.AddPartner(connString))
                {
                    LoadPartner();
                    //Interted Successful
                }
                else
                {
                    //Fail 
                }
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        protected void btnUpdate_Click1(object sender, EventArgs e)
        {
            try
            {

                Partner PartnerObj = new Partner(Convert.ToInt32(txtID.Text),txtAbout.Text, txtPhone.Text, txtAddress.Text);
                if (PartnerObj.UpdatePartner(connString))
                {
                    LoadPartner();
                    //Interted Successful
                }
                else
                {
                    //Fail 
                }


            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        private void LoadPartner()
        {
            try
            {
                Partner PartnerObj = new Partner();
                dgvPartner.DataSource = PartnerObj.GetPartnerInfo(connString);
                dgvPartner.DataBind();
            }
            catch (Exception ex)
            {

                //show error
            }
        }

        protected void dgvPartner_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {

                ImageButton bEdit = (ImageButton)e.Row.Cells[4].Controls[1];
                bEdit.CommandArgument = e.Row.RowIndex.ToString();

                ImageButton bDelete = (ImageButton)e.Row.Cells[5].Controls[1];
                bDelete.CommandArgument = e.Row.RowIndex.ToString();

            }
        }

        protected void dgvPartner_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int rIndex = Convert.ToInt32(e.CommandArgument);
            GridViewRow row = dgvPartner.Rows[rIndex];
            if (e.CommandName == "cmdEdit")
            {

                txtID.Text = ((Label)row.Cells[0].Controls[1]).Text;
                txtAbout.Text = ((Label)row.Cells[1].Controls[1]).Text;
                txtPhone.Text = ((Label)row.Cells[2].Controls[1]).Text;
                txtAddress.Text = ((Label)row.Cells[3].Controls[1]).Text;



            }
            else if (e.CommandName == "cmdDelete")
            {
                Partner PObj = new Partner();
                PObj.partner_id = Convert.ToInt32(((Label)row.Cells[0].Controls[1]).Text);
                if (PObj.RemovePartner(connString))
                {
                    //labRes.Text = "Delete " + rIndex;
                    LoadPartner();
                }
            }

        }












    }
}