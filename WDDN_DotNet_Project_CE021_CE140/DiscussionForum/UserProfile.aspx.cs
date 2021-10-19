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
            if (Session["uname"] == null)
            {
                Response.Redirect("Login.aspx?auth=1");
            }
            username.Text = Session["uname"].ToString();
            fullname.Text = (Session["fname"].ToString() + " "+Session["lname"].ToString());
            university.Text = Session["university"].ToString();
            email.Text = Session["email"].ToString();
            userimg.ImageUrl = Session["avatar"].ToString();
            if(!IsPostBack)
            Bind();
        }

        public void Bind()
        {
            int id = Convert.ToInt32(Session["id"]);
            SqlCommand cmd = new SqlCommand("SELECT * FROM QuestionBank WHERE userid ='"+id+ "' ORDER BY Id DESC   ", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds, "QuestionBank");
            DataList1.DataSource = ds.Tables[0];
            DataList1.DataBind();

            DataList2.DataSource = null;
            DataList2.DataBind();

            DataList3.DataSource = null;
            DataList3.DataBind();
        }

        public void Bind1()
        {
            int id = Convert.ToInt32(Session["id"]);
            SqlCommand cmd = new SqlCommand("SELECT * FROM Answer WHERE userid ='" + id + "' ORDER BY Id DESC", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds, "Answer");
            DataList2.DataSource = ds.Tables[0];
            DataList2.DataBind();


            DataList1.DataSource = null;
            DataList1.DataBind();

            DataList3.DataSource = null;
            DataList3.DataBind();
        }

        public void Bind2()
        {
            int id = Convert.ToInt32(Session["id"]);
            SqlCommand cmd = new SqlCommand("SELECT * FROM SavedPost WHERE userid ='" + id + "' ORDER BY Id DESC", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds, "SavedPost");
            DataList3.DataSource = ds.Tables[0];
            DataList3.DataBind();


            DataList1.DataSource = null;
            DataList1.DataBind();

            DataList2.DataSource = null;
            DataList2.DataBind();
        }

        protected void img_change(object sender, EventArgs e)
        {           
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


                        query = "UPDATE QuestionBank SET userimg='" + Profile + "' WHERE userid='" + id + "'";
                        SqlCommand cmd1 = new SqlCommand(query, con);
                       // Response.Write(query);

                        con.Open();
                        int result1 = cmd1.ExecuteNonQuery();
                        con.Close();


                        query = "UPDATE Answer SET userimg='" + Profile + "' WHERE userid='" + id + "'";
                       // Response.Write(query);
                        SqlCommand cmd2 = new SqlCommand(query, con);
                        con.Open();
                        int result2 = cmd2.ExecuteNonQuery();
                        con.Close();


                        query = "UPDATE SavedPost SET userimg='" + Profile + "' WHERE saveuserid='" + id + "'";
                      //  Response.Write(query);
                        SqlCommand cmd3 = new SqlCommand(query, con);
                        con.Open();
                        int result3 = cmd3.ExecuteNonQuery();
                        con.Close();


                        query = "UPDATE Answer SET queuserimg='" + Profile + "' WHERE queuserid='" + id + "'";
                       // Response.Write(query);
                        SqlCommand cmd4 = new SqlCommand(query, con);
                        con.Open();
                        int result4 = cmd4.ExecuteNonQuery();
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

        protected void question_Click(object sender, EventArgs e)
        {
            Bind();
        }

        protected void answer_Click(object sender, EventArgs e)
        {
            Bind1();
        }

        protected void saved_Click(object sender, EventArgs e)
        {
            Bind2();
        }

        

        protected void DataList3_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "addans")
            {
                DataListItem item = (DataListItem)((Button)e.CommandSource).NamingContainer;
                Label text = ((Label)item.FindControl("qid1"));
                //Response.Write(text.Text);
                Response.Redirect("AddAnswer.aspx?qid=" + text.Text);


            }

            else if (e.CommandName == "viewans")
            {
                DataListItem item = (DataListItem)((Button)e.CommandSource).NamingContainer;
                Label text = ((Label)item.FindControl("qid1"));
                //Response.Write(text.Text);
                Response.Redirect("ViewAnswer.aspx?qid=" + text.Text);

            }

          

        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "viewans")
            {
                DataListItem item = (DataListItem)((Button)e.CommandSource).NamingContainer;
                Label text = ((Label)item.FindControl("qid"));

                Response.Redirect("ViewAnswer.aspx?qid=" + text.Text);

            }
            else if (e.CommandName == "delete") {
                DataListItem item = (DataListItem)((Button)e.CommandSource).NamingContainer;
                Label text = ((Label)item.FindControl("qid"));


                String query = "DELETE FROM SavedPost WHERE  questionid='" + text.Text + "'";
                SqlCommand cmd = new SqlCommand(query, con);
                con.Open();
                int result = cmd.ExecuteNonQuery();
                con.Close();


                query = "DELETE FROM Answer WHERE  questionid='" + text.Text + "'";
                cmd = new SqlCommand(query, con);
                con.Open();
                result = cmd.ExecuteNonQuery();
                con.Close();


                query = "DELETE FROM QuestionBank WHERE  Id='" + text.Text + "'";
                cmd = new SqlCommand(query, con);
                con.Open();
                result = cmd.ExecuteNonQuery();
                con.Close();


                Bind();

            }

        }

        protected void DataList2_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if(e.CommandName == "delete")
            {
                DataListItem item = (DataListItem)((Button)e.CommandSource).NamingContainer;
                Label text = ((Label)item.FindControl("aid"));
                String query = "DELETE FROM Answer WHERE  Id='" + text.Text + "'";
                SqlCommand cmd = new SqlCommand(query, con);
                con.Open();
                int result = cmd.ExecuteNonQuery();
                con.Close();
                Bind1();
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
        protected void logout_Click(object sender, EventArgs e)
        {
            Session.Abandon();

            Response.Redirect("Login.aspx");
        }

    }
}