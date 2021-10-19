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
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["ConTest"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {


            if (Session["uname"]==null) {
                Response.Redirect("Login.aspx?auth=1");
            }
             avatar.ImageUrl = (Session["avatar"].ToString());
             username1.Text = (Session["fname"].ToString() + Session["lname"].ToString());
             university1.Text = (Session["university"].ToString());
             if(!IsPostBack)
             Bind();
            
           


        }
        public void Bind()
        {
            SqlCommand cmd = new SqlCommand("SELECT * FROM QuestionBank ORDER BY Id DESC ", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds, "QuestionBank");
            DataList1.DataSource = ds.Tables[0];
            DataList1.DataBind();
        }
        protected void cardbutton_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserProfile.aspx");
        }

        protected void que_btn_ServerClick(object sender, EventArgs e)
        {
            
          //  SqlConnection con = new SqlConnection();
            int id = Convert.ToInt32(Session["id"]);
            String uname = Convert.ToString(Session["uname"]);
            String university = Convert.ToString(Session["university"]);
            String userimg = Convert.ToString(Session["avatar"]);
            myfile.SaveAs(Server.MapPath("~/QuesImages/") + id.ToString() + Path.GetFileName(myfile.FileName));

            String Profile = "QuesImages/" + id.ToString() + Path.GetFileName(myfile.FileName);

           //con.ConnectionString = WebConfigurationManager.ConnectionStrings["ConTest"].ConnectionString;
            String query;
            Boolean flag = false;
            // Response.Write(Profile);
            if (question.Text != "")
            {

                String query1 = "SELECT * FROM QuestionBank WHERE userid='" + id + "'";
                try
                {

                    SqlCommand cmd = new SqlCommand(query1, con);

                    con.Open();
                    SqlDataReader rdr = cmd.ExecuteReader();
                    while (rdr.Read())
                    {

                        if (question.Text == rdr["question"].ToString())
                        {
                            flag = true;

                        }


                    }
                    cmd.Dispose();
                    con.Close();


                }
                catch (Exception err)
                {
                    Response.Write(err.Message);

                }
                if (!flag)
                {   
                    try
                    {
                        using (con)
                        {

                           

                            if (Path.GetFileName(myfile.FileName) != "")
                            {
                                query = "INSERT INTO QuestionBank (userid,question,uname,university,category,queimg,userimg) VALUES ('" + id + "', '" + question.Text + "', '" + uname + "','" + university + "','" + que_category.SelectedValue + "','" + Profile + "','" +userimg + "' )";
                            }
                            else
                            {
                                query = "INSERT INTO QuestionBank (userid,question,uname,university,category,userimg) VALUES ('" + id + "', '" + question.Text + "', '" + uname + "','" + university + "','" + que_category.SelectedValue + "','" + userimg + "')";

                            }
                            SqlCommand cmd = new SqlCommand(query, con);
                            con.Open();
                            int result = cmd.ExecuteNonQuery();
                            cmd.Dispose();
                            con.Close();


                            question.Text = "";
                            que_category.ClearSelection();
                            

                            //System.IO.File()


                            String filename = Path.GetFileName(myfile.FileName);
                            myfile = new FileUpload();



                        }
                    }
                    catch (Exception err)
                    {
                        Response.Write(err.Message);
                    }

                    error_post.Visible = false;

                    Response.Redirect("Home.aspx", false);
                }
                else
                {

                    error_post.Text = "Question is already asked by you ,Please wait for the answer. ";
                    error_post.Visible = true;

                }

               
          
            }
          

        }

        protected void logout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            
            Response.Redirect("Login.aspx");
        }



       

       

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {

            if (e.CommandName == "savepost")
            {
                DataListItem item = (DataListItem)((Button)e.CommandSource).NamingContainer;
                Label text = ((Label)item.FindControl("qid"));
                // text.Visible = true;



                int qid = Convert.ToInt32(text.Text);

                int id = Convert.ToInt32(Session["id"]);

                String question = "", questionimg = "", uname = "", userimg = "", university = "";
                String query2 = "SELECT * FROM QuestionBank WHERE Id='" + qid + "'";

                SqlDataAdapter da;
                DataTable dt = new DataTable();
                DataRow dr;
                con.Open();
                da = new SqlDataAdapter(query2, con);
                da.Fill(dt);
                dr = dt.Rows[0];
                int uid = Convert.ToInt32(dr["userid"]);
                uname = dr["uname"].ToString();
                university = dr["university"].ToString();
                question = dr["question"].ToString();
                questionimg = dr["queimg"].ToString();
                userimg = dr["userimg"].ToString();
                con.Close();

                String query1 = "SELECT * FROM SavedPost WHERE userid='" + id + "' AND  questionid='" + qid + "'";
                SqlCommand cmd1 = new SqlCommand(query1, con);
                con.Open();
                SqlDataReader rdr = cmd1.ExecuteReader();

                
                String query;
                if (rdr.HasRows)
                {
                    query = "DELETE FROM SavedPost WHERE userid='" + id + "' AND  questionid='" + qid + "'";
                    Button button = (Button)item.FindControl("savepost");
                    button.Text = "Save";

                }
                else
                {
                    
                    
                    query = "INSERT INTO SavedPost (questionid,userid,question,questionimg,uname,userimg,university,saveuserid) VALUES ('" + text.Text + "','" + id + "','" + question + "','" + questionimg + "','" + uname + "','" + userimg + "','" + university + "','" + uid + "')";
                    Button button = (Button)item.FindControl("savepost");
                    button.Text = "Unsave";

                }

                cmd1.Dispose();
                con.Close();
                SqlCommand cmd = new SqlCommand(query, con);
                con.Open();
                int result = cmd.ExecuteNonQuery();
                con.Close();

            }
            else if (e.CommandName == "addans")
            {
                DataListItem item = (DataListItem)((Button)e.CommandSource).NamingContainer;
                Label text = ((Label)item.FindControl("qid"));
               
                Response.Redirect("AddAnswer.aspx?qid=" + text.Text  );


            }

            else if (e.CommandName == "viewans") {
                DataListItem item = (DataListItem)((Button)e.CommandSource).NamingContainer;
                Label text = ((Label)item.FindControl("qid"));

                Response.Redirect("ViewAnswer.aspx?qid=" + text.Text);

            }

        }


        protected void search_btn(object sender, EventArgs e)
        {
           

            Response.Redirect("Search.aspx?query=" + TextBox1.Text);
        }

        protected void categorybtn(object sender, EventArgs e)
        {


            Response.Redirect("Category.aspx?query=" + DropDownList2.SelectedValue);
        }

    }
}