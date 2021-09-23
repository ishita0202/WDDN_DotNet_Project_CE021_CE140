using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DiscussionForum
{
    public partial class UserProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            username.Text = Session["uname"].ToString();
            fullname.Text = (Session["fname"].ToString() + " "+Session["lname"].ToString());
            university.Text = Session["university"].ToString();
            email.Text = Session["email"].ToString();
            userimg.ImageUrl = Session["avatar"].ToString();

        }

        protected void img_change(object sender, EventArgs e)
        {
            Response.Redirect("ChangeImg.aspx");
            
            
        }

        protected void edit_profile(object sender, EventArgs e)
        {

            Response.Redirect("EditUser.aspx");
        }

        
    }
}