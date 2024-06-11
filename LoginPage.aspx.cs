using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Controls;

namespace BloodDonorPage
{
    public partial class LoginPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            pnlLogin.Visible = true;            
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string username = UserNameTextBox.Text;
            string password = PasswordTextBox.Text;

            // Perform login authentication here
            Code.DB data = new Code.DB();
            DataTable dataTable = data.getAdminCredentials("GetAdminCredentialSP");
            bool status = false;
            bool res = isValid();
            if (dataTable != null)
            {
                foreach (DataRow row in dataTable.Rows)
                {
                    string dbUsername = row["Email"].ToString();
                    string dbPassword = row["Password"].ToString();

                    if (dbUsername == username && dbPassword == password)
                    {
                        status = true;
                        break;
                    }
                }
            }
            if (res == false) {
                
                if (status)
                {
                    // Redirect to home page on successful login
                    Response.Redirect("~/Home.aspx");
                }
                else

                {                   
                    lblErrorMessage.Text = "Invalid Username or Password";
                    lblErrorMessage.Visible = true;
                    clear();
                }
                //lblErrorMessage.Visible = false;
            }
            else if(res == true)
            {
                // Show the modal popup for invalid credentials
                
                lblErrorMessage.Visible = true;
               
            }
            
        }

        void clear()
        {
            UserNameTextBox.Text = "";
            PasswordTextBox.Text = "";
            
        }
        protected void btnClear_Click(object sender, EventArgs e)
        {
            // Clear the form fields

            UserNameTextBox.Text = "";
            PasswordTextBox.Text = "";
            lblErrorMessage.Visible = false;
        }

        public bool isValid()
        {
            bool status = false;
            if(UserNameTextBox.Text=="" && PasswordTextBox.Text == "")
            {
                lblErrorMessage.Text = "Username and Password required";
                status = true;
            }
            else if (UserNameTextBox.Text == "")
            {
                lblErrorMessage.Text = "Username is required";
                status = true;
            }else if(PasswordTextBox.Text == "")
            {
                lblErrorMessage.Text = "password is required";
                status=true;
            }else
            {
                status=false;
            }
            return status;
        }
    }
}
