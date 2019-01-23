using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        try
        {

            User u = new User();
            DataTable dt = u.CheckUser(txtUsername.Text,txtPassword.Text);
            if (dt.Rows.Count > 0)
            {
                string Role = dt.Rows[0]["Role"].ToString();
                if (dt.Rows.Count > 0)
                {
                    if (Role == "Admin")
                    {
                        Response.Redirect("AdminHome.aspx");
                    }
                    if (Role == "Users")
                    {
                        Response.Redirect("UserHome.aspx");
                    }
                    if (Role == "Parents")
                    {
                        Response.Redirect("ParentsHome.aspx");
                    }
                }
            }
            else
            {
                Literal1.Text = "Invald User Or Password";
            }

        }
        catch(Exception ex)
        {
            Literal1.Text = ex.Message;
        }
    }
}