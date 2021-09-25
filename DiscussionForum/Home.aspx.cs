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
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {


            
            avatar.ImageUrl = (Session["avatar"].ToString());

            username1.Text = (Session["fname"].ToString() + Session["lname"].ToString());
            university1.Text = (Session["university"].ToString());

            

        }

        protected void cardbutton_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserProfile.aspx");
        }

        protected void que_btn_ServerClick(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection();
            int id = Convert.ToInt32(Session["id"]);
            String uname = Convert.ToString(Session["uname"]);
            String university = Convert.ToString(Session["university"]);
            myfile.SaveAs(Server.MapPath("~/QuesImages/") + id.ToString() + Path.GetFileName(myfile.FileName));

            String Profile = "QuesImages/" + id.ToString() + Path.GetFileName(myfile.FileName);

            con.ConnectionString = WebConfigurationManager.ConnectionStrings["ConTest"].ConnectionString;
            String query;
            // Response.Write(Profile);
            try
            {
                using (con) {

                    if (que_category.SelectedValue == "ChooseCategory") {
                        que_category.ClearSelection();
                        others.Selected = true;
                    }
                    
                    if (Path.GetFileName(myfile.FileName) != "")
                    {
                        query = "INSERT INTO QuestionBank (userid,question,uname,university,category,queimg) VALUES ('" + id + "', '" + question.Text + "', '" + uname + "','" + university + "','" + que_category.SelectedValue + "','" + Profile + "' )";
                    }
                    else {
                        query = "INSERT INTO QuestionBank (userid,question,uname,university,category) VALUES ('" + id + "', '" + question.Text + "', '" + uname + "','" + university + "','" + que_category.SelectedValue + "')";

                    }
                    SqlCommand cmd = new SqlCommand(query, con);
                    con.Open();
                    int result = cmd.ExecuteNonQuery();
                    cmd.Dispose();
                    con.Close();


                    question.Text = "";
                    que_category.ClearSelection();
                    default_cat.Selected = true;
                                        


                }
            }
            catch(Exception err) {
                Response.Write(err.Message);
            }

        }

        protected void logout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            
            Response.Redirect("Login.aspx");
        }
    }
}