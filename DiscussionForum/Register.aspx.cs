﻿using System;
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

        protected void signup_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = WebConfigurationManager.ConnectionStrings["ConTest"].ConnectionString;
            try
            {
                using (con)
                {
                    String Profile = "Avatar/Default.jpg";
                    String query = "insert into UserDetails(fname,lname,email,contact,uname,pass,university,avatar)values('" + fname.Text + "', '" + lname.Text + "', '" + email.Text + "','" + contact.Text + "','" + username.Text + "','" + pass.Text + "','"+university.Text+ "','" + Profile + "' )";  
                    SqlCommand cmd = new SqlCommand(query, con);
                    con.Open();
                    int result = cmd.ExecuteNonQuery();
                    cmd.Dispose();
                    con.Close();
                }
               
            }
            catch (Exception err)
            {
                Label1.Text = "Error Reading Data:" + err.Message;
            }
            Response.Redirect("Login.aspx");

        }
    }
}