using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BloodDonorPage
{
    public partial class Logout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void cancelpopup_Click(object sender, EventArgs e)
        {
            logout.Hide();
        }

        protected void yespopup_Click(object sender, EventArgs e)
        {   
            Response.Redirect("~/LoginPage.aspx");
        }
    }
}