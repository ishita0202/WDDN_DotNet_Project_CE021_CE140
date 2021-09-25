using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DiscussionForum
{
    public partial class UserProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            username.Text = Session["uname"].ToString();
            fullname.Text = (Session["fname"].ToString() + " "+Session["lname"].ToString());
            university.Text = Session["university"].ToString();
            email.Text = Session["email"].ToString();
            userimg.ImageUrl = Session["avatar"].ToString();

        }

        protected void img_change(object sender, EventArgs e)
        {
            //Response.Redirect("ChangeImg.aspx");

            SqlConnection con = new SqlConnection();
            int id = Convert.ToInt32(Session["id"]);
            con.ConnectionString = WebConfigurationManager.ConnectionStrings["ConTest"].ConnectionString;
            myfile.SaveAs(Server.MapPath("~/Avatar/") + id.ToString() + Path.GetFileName(myfile.FileName));
            try
            {
                using (con)
                {
                    String Profile = "Avatar/" + id.ToString() + Path.GetFileName(myfile.FileName);
                    String query = "UPDATE UserDetails SET avatar ='" + Profile + "' WHERE Id='" + id + "'";
                    Session["avatar"] = Profile;
                    SqlCommand cmd = new SqlCommand(query, con);
                    con.Open();
                    int result = cmd.ExecuteNonQuery();
                    con.Close();

                }

            }
            catch (Exception err)
            {
                Response.Write(err.Message);
            }

            Response.Redirect("UserProfile.aspx");

        }

        protected void edit_profile(object sender, EventArgs e)
        {

            Response.Redirect("EditUser.aspx");
        }

        
    }
}