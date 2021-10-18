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
    public partial class ViewAnswer : System.Web.UI.Page
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
                Bind();
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


        public void Bind()
        {
            String qid = Request.QueryString["qid"].ToString();
            SqlCommand cmd = new SqlCommand("SELECT * FROM Answer WHERE questionid ='"+qid+"' ORDER BY Id DESC ", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds, "Answer");
            DataList1.DataSource = ds.Tables[0];
            DataList1.DataBind();
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