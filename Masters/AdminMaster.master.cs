using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Masters_AdminMaster : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserId"] == null)
        {
            Response.Redirect("~/Login.aspx");
            return;
        }

        if (Session["Role"] == null || Session["Role"].ToString() != "ADMIN")
        {
            Response.Redirect("~/Common/Unauthorized.aspx");
            return;
        }
    }
}
