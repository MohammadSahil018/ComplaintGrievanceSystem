using System;
using System.Configuration;
using System.Data.SqlClient;

public partial class Masters_DepartmentMaster : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserId"] == null)
        {
            Response.Redirect("~/Login.aspx");
            return;
        }

        if (Session["Role"] == null || Session["Role"].ToString() != "DEPT")
        {
            Response.Redirect("~/Common/Unauthorized.aspx");
            return;
        }
    }
}

