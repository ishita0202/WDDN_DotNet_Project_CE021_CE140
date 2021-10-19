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
    public partial class EditUser : System.Web.UI.Page
    {   


        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["uname"] == null)
            {
                Response.Redirect("Login.aspx?auth=1");
            }

            if (!IsPostBack)
            {
                fname.Text = Session["fname"].ToString();
                lname.Text = Session["lname"].ToString();
                email.Text = Session["email"].ToString();
                contact.Text = Session["contact"].ToString();
                university.Text = Session["university"].ToString();
                username.Text = Session["uname"].ToString();
            }
        }

       

        protected void update_Click1(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection();
            int id = Convert.ToInt32(Session["id"]);
            con.ConnectionString = WebConfigurationManager.ConnectionStrings["ConTest"].ConnectionString;
            
            try
            {
                using (con)
                {
                   
                    String query = "UPDATE UserDetails SET fname ='" + fname.Text + "', lname ='" + lname.Text + "', email ='" + email.Text + "', uname ='" + username.Text + "', contact ='" + contact.Text + "',  university ='" + university.Text + "' WHERE Id='" + id + "'";
                  //Response.Write(query);

                    SqlCommand cmd = new SqlCommand(query, con);
                    con.Open();
                    int result = cmd.ExecuteNonQuery();
                    con.Close();

                    query = "UPDATE QuestionBank SET uname='"+username.Text+ "', university='" + university.Text + "' WHERE userid='" + id + "'";
                    SqlCommand cmd1 = new SqlCommand(query, con);
                    con.Open();
                    int result1 = cmd1.ExecuteNonQuery();
                    con.Close();


                    query = "UPDATE Answer SET uname='" + username.Text + "', university='" + university.Text + "'  WHERE userid='" + id + "'";
                    SqlCommand cmd2 = new SqlCommand(query, con);
                    con.Open();
                    int result2 = cmd2.ExecuteNonQuery();
                    con.Close();


                    query = "UPDATE SavedPost SET uname='" + username.Text + "', university='" + university.Text + "'  WHERE saveuserid='" + id + "'";
                    SqlCommand cmd3 = new SqlCommand(query, con);
                    con.Open();
                    int result3 = cmd3.ExecuteNonQuery();
                    con.Close();


                    query = "UPDATE Answer SET queuname='" + username.Text + "', queuniversity='" + university.Text + "'  WHERE queuserid='" + id + "'";
                    SqlCommand cmd4 = new SqlCommand(query, con);
                    con.Open();
                    int result4 = cmd4.ExecuteNonQuery();
                    con.Close();




                    Session["fname"] = fname.Text;
                    Session["lname"] = lname.Text;
                    Session["email"] = email.Text;
                    Session["contact"] = contact.Text;
                    Session["uname"] = username.Text;
                    Session["university"] = university.Text;

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