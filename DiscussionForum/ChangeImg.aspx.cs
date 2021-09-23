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
    public partial class ChangeImg : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection();
            int id = Convert.ToInt32(Session["id"]);
            con.ConnectionString = WebConfigurationManager.ConnectionStrings["ConTest"].ConnectionString;
            ImgUpload.SaveAs(Server.MapPath("~/Avatar/") + id.ToString()+ Path.GetFileName(ImgUpload.FileName));
            try
            {
                using (con)
                {
                    String Profile = "Avatar/" + id.ToString() + Path.GetFileName(ImgUpload.FileName);
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
    }
}