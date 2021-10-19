using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data.SqlClient;

namespace DiscussionForum
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {
            //Response.Write(args);
            string data = args.Value;
            args.IsValid = false;
            if (data.Length > 6 && data.Length < 14 && data.Any(char.IsDigit) == true && data.Any(char.IsLower) == true && data.Any(char.IsUpper) == true)
            {
                args.IsValid = true;
                return;
            }

           
        }

        protected void signup_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = WebConfigurationManager.ConnectionStrings["ConTest"].ConnectionString;
            try
            {
                using (con)
                {
                    bool regerr = false;
                    bool regerr1 = false;
                    String query1 = "SELECT uname FROM UserDetails WHERE uname='" + username.Text + "'";
                    SqlCommand cmd1 = new SqlCommand(query1, con);
                    con.Open();
                    SqlDataReader rdr = cmd1.ExecuteReader();
                    if (rdr.HasRows) {
                        regerr = true;
                    }
                    con.Close();



                    String query2 = "SELECT email FROM UserDetails WHERE email='" + email.Text + "'";
                    SqlCommand cmd2 = new SqlCommand(query2, con);
                    con.Open();
                    SqlDataReader rdr1 = cmd2.ExecuteReader();
                    if (rdr1.HasRows)
                    {
                        regerr1 = true;
                    }
                    con.Close();

                    if (regerr)
                    {
                        registererr.Visible = true;
                        registererr.Text = "Username Already Exist";


                    } else if (regerr1) {
                        registererr.Visible = true;
                        registererr.Text ="Email Already Exist";
                    }

                    else
                    {
                        String Profile = "Avatar/Default.jpg";
                        String query = "insert into UserDetails(fname,lname,email,contact,uname,pass,university,avatar)values('" + fname.Text + "', '" + lname.Text + "', '" + email.Text + "','" + contact.Text + "','" + username.Text + "','" + pass.Text + "','" + university.Text + "','" + Profile + "' )";
                        SqlCommand cmd = new SqlCommand(query, con);
                        con.Open();
                        int result = cmd.ExecuteNonQuery();
                        cmd.Dispose();
                        con.Close();
                        Response.Redirect("Login.aspx");
                    }

                }
               
            }
            catch (Exception err)
            {
                Label1.Text = "Error Reading Data:" + err.Message;
            }
            

        }

       

    }
}