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

            if (Session["uname"] == null)
            {
                Response.Redirect("Login.aspx?auth=1");
            }

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
            String question="";
            String questionimg="",queuname="",queuserimg="",queuniversity="";

               
                
          
            try
            {   
                using (con)
                {

                    String query1 = "SELECT * FROM QuestionBank WHERE Id='" + qid + "'";
                    SqlDataAdapter da;
                    DataTable dt = new DataTable();
                    DataRow dr;
                    con.Open();
                    da = new SqlDataAdapter(query1, con);
                    da.Fill(dt);
                    dr = dt.Rows[0];
                    question = dr["question"].ToString();
                    questionimg = dr["queimg"].ToString();
                    queuname = dr["uname"].ToString();
                    queuserimg = dr["userimg"].ToString();
                    queuniversity = dr["university"].ToString();
                    int queid = Convert.ToInt32(dr["userid"]);
                    con.Close();

                    String query = "INSERT INTO Answer (answer,userid,questionid,uname,university,userimg,question,questionimg,queuname,queuserimg,queuniversity,queuserid) VALUES ('" + Answer.Value + "','" + id + "','" + qid + "','" + username + "','" + university + "','" + userimg + "','" +question  + "','" + questionimg + "','" + queuname + "','" + queuserimg + "','" + queuniversity + "','" + queid + "')";
                    //Response.Write(query);       
                    SqlCommand cmd = new SqlCommand(query, con);
                   // Response.Write(query);
                    con.Open();
                   // Response.Write(query);
                    int result = cmd.ExecuteNonQuery();
                   // Response.Write(query);
                    con.Close();
                }
                
            }
            catch (Exception err)
            {
                Response.Write(err.Message);
            }


            Response.Redirect("Home.aspx");

        }

        protected void search_btn(object sender, EventArgs e)
        {


            Response.Redirect("Search.aspx?query=" + TextBox1.Text);
        }

        protected void categorybtn(object sender, EventArgs e)
        {


            Response.Redirect("Category.aspx?query=" + DropDownList2.SelectedValue);
        }
        protected void logout_Click(object sender, EventArgs e)
        {
            Session.Abandon();

            Response.Redirect("Login.aspx");
        }

    }
}