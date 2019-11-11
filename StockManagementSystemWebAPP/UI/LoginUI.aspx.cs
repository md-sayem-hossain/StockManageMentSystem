using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StockManagementSystemWebAPP.UI
{
    public partial class LoginUI : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

       

        protected void loginbutton_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["StockDB"].ToString());
            con.Open();
            string user = usertextbox.Text;
            string pass = passwordtextbox.Text;

            string query = "select count(*)from LoginTB where username='" + user + "' and password ='" + pass + "'";
            SqlCommand cmd = new SqlCommand(query, con);
            string output = cmd.ExecuteScalar().ToString();

            if (output == "1")
            {
                Session["user"] = user;
                Response.Redirect("~/UI/CategoryUI.aspx");

            }

            else
            {
                messagelabel.Text = "forgot username/password?";
            }


        }

         

    }

}