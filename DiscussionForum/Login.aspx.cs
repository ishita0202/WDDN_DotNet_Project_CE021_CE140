using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DiscussionForum
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void loginButton_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = WebConfigurationManager.ConnectionStrings["ConTest"].ConnectionString;
            try
            {
                using (con)
                {
                    String query = "SELECT * FROM UserDetails WHERE uname= '" + username.Text+"' and pass='"+pass.Text+"'";
                    SqlCommand cmd = new SqlCommand(query, con);
                    con.Open();
                    SqlDataReader rdr = cmd.ExecuteReader();
                   // System.Diagnostics.Debug.WriteLine(rdr);
                    if (rdr.Read()){
                       
                            Response.Redirect("Home.aspx");
                    }else{
                        Response.Write("<script>alert('Username or Password Incorrect')</script>");
                    }
                    cmd.Dispose();
                    con.Close();
                }

            }
            catch (Exception err)
            {
                userLabel.Text = "Error Reading Data:" + err.Message;
            }
           

        }
    }
}