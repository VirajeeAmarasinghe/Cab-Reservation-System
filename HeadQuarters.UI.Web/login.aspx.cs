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
    public partial class login : System.Web.UI.Page
    {
        string connString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            Validator v = new Validator();
            if (!v.isPresent(txtUsername))
            {
                //show error message
            }
            else if (!v.isPresent(txtPassword))
            {
                //show error message
            }
            else
            {
                try
                {
                    LoginAuthentication l = new LoginAuthentication();
                    string pass = l.GetLoginInfo(connString, txtUsername.Text);

                    if (pass == null)
                    {
                        lbl_error_message.Text = "enter valid password or username";
                        //error message->enter valid password or username
                    }
                    else
                    {
                        if (pass != txtPassword.Text)
                        {
                            lbl_error_message.Text = "enter valid password or username";
                            //error message->enter valid password or username
                        }
                        else
                        {
                            Session["username"] = txtUsername.Text;
                            Session["pass"] = txtPassword.Text;                            
                            Response.Redirect("main.aspx", true);
                        }
                    }
                }
                catch (Exception ex)
                {
                    
                }

            }
        }
    }
}