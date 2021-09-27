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
    public partial class AddAnswer : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["ConTest"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                String qid = Request.QueryString["qid"].ToString();
                String query = "SELECT * FROM QuestionBank WHERE Id='" + qid + "'";
                try
                {
                    using (con)
                    {
                        SqlDataAdapter da;
                        DataTable dt = new DataTable();
                        DataRow dr;
                        con.Open();
                        da = new SqlDataAdapter(query, con);
                        da.Fill(dt);
                        dr = dt.Rows[0];
                        username.Text = dr["uname"].ToString();
                        university.Text = dr["university"].ToString();
                        userimg.ImageUrl = dr["userimg"].ToString();
                        que.Text = dr["question"].ToString();
                        queimg.ImageUrl = dr["queimg"].ToString();
                    }



                }
                catch (Exception err)
                {
                    Response.Write(err.Message);
                }
            }
        }

        protected void Addans_Click(object sender, EventArgs e)
        {
           
            int id = Convert.ToInt32(Session["id"]);
            String username = Convert.ToString(Session["uname"]);
            String university = Convert.ToString(Session["university"]);
            int qid = Convert.ToInt32(Request.QueryString["qid"].ToString());
            String userimg = Convert.ToString(Session["avatar"]);
            

            try
            {   
                using (con)
                {
                    String query = "INSERT INTO Answer (answer,userid,questionid,uname,university,userimg) VALUES ('" + Answer.Value + "','" + id + "','" + qid + "','" + username + "','" + university + "','" + userimg + "')";
                  //  Response.Write(query);       
                    SqlCommand cmd = new SqlCommand(query, con);
                 //   Response.Write(query);
                    con.Open();
                 //   Response.Write(query);
                    int result = cmd.ExecuteNonQuery();
                 //  Response.Write(query);
                    con.Close();
                }
                
            }
            catch(Exception err) {
                Response.Write(err.Message);
            }

            Response.Redirect("Home.aspx");

        }
    }
}