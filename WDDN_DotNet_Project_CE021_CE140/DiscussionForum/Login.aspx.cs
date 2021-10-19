using System;
using System.Collections.Generic;
using System.Data;
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
            if (Convert.ToInt32(Request.QueryString["auth"]) == 1) { 
                loginerr.Visible = true;
                loginerr.Text = "Please Login to continue";
            }
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
                    SqlDataAdapter da;
                    DataTable dt = new DataTable();
                    DataRow dr;
                    con.Open();
                    da = new SqlDataAdapter(query, con);
                    
                    da.Fill(dt);
                    if (dt.Rows.Count != 0)
                    {
                        dr = dt.Rows[0];
                        Session["id"] = Convert.ToInt32(dr["Id"]);
                        Session["fname"] = Convert.ToString(dr["fname"]);
                        Session["lname"] = Convert.ToString(dr["lname"]);
                        Session["email"] = Convert.ToString(dr["email"]);
                        Session["contact"] = Convert.ToString(dr["contact"]);
                        Session["uname"] = Convert.ToString(dr["uname"]);
                        Session["university"] = Convert.ToString(dr["university"]);
                        Session["avatar"] = Convert.ToString(dr["avatar"]);
                        Response.Redirect("Home.aspx");

                    }
                    else{
                        Response.Write("<script>alert('Username or Password Incorrect')</script>");
                    }
      
                    con.Close();
                }

            }
            catch (Exception err)
            {
                userLabel.Text = "Error Reading Data:" + err.Message;
            }
           

        }

        protected void username_TextChanged(object sender, EventArgs e)
        {

        }
    }
}