using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DiscussionForum
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {


            username.Text = (Session["fname"].ToString() + Session["lname"].ToString());
            university.Text=(Session["university"].ToString());
            avatar.ImageUrl = (Session["avatar"].ToString());

            username1.Text = (Session["fname"].ToString() + Session["lname"].ToString());
            university1.Text = (Session["university"].ToString());

            

        }

        protected void cardbutton_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserProfile.aspx");
        }
    }
}