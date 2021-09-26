using System;
using System.Collections.Generic;
using System.Data;
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

        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["ConTest"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            username.Text = Session["uname"].ToString();
            fullname.Text = (Session["fname"].ToString() + " "+Session["lname"].ToString());
            university.Text = Session["university"].ToString();
            email.Text = Session["email"].ToString();
            userimg.ImageUrl = Session["avatar"].ToString();
            Bind();
        }

        public void Bind()
        {
            int id = Convert.ToInt32(Session["id"]);
            SqlCommand cmd = new SqlCommand("SELECT * FROM QuestionBank WHERE userid ='"+id+"'", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds, "QuestionBank");
            DataList1.DataSource = ds.Tables[0];
            DataList1.DataBind();
        }

        protected void img_change(object sender, EventArgs e)
        {
            //Response.Redirect("ChangeImg.aspx");

          
            int id = Convert.ToInt32(Session["id"]);
        
           
            try
            {   
                using (con)
                {
                    if (myfile.HasFile)
                    {
                        myfile.SaveAs(Server.MapPath("~/Avatar/") + id.ToString() + Path.GetFileName(myfile.FileName));
                        String Profile = "Avatar/" + id.ToString() + Path.GetFileName(myfile.FileName);
                        String query = "UPDATE UserDetails SET avatar ='" + Profile + "' WHERE Id='" + id + "'";
                        Session["avatar"] = Profile;
                        SqlCommand cmd = new SqlCommand(query, con);
                        con.Open();
                        int result = cmd.ExecuteNonQuery();
                        con.Close();
                    }
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