using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;

public partial class Admin_AllComplaints : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadAllComplaints();
        }
    }

    private void LoadAllComplaints()
    {
        string conStr = ConfigurationManager.ConnectionStrings["ComplainDB"].ConnectionString;

        using(SqlConnection con = new SqlConnection(conStr))
        {
            SqlCommand cmd = new SqlCommand(@"SELECT c.ComplaintId,u.Username,d.DepartmentName,c.Subject,c.CurrentStatus,c.CreatedDate FROM Complaints c INNER JOIN [Users] u ON c.UserId = u.UserId INNER JOIN Departments d ON c.DepartmentId = d.DepartmentId ORDER BY c.CreatedDate DESC",con);
            con.Open();
            gvComplaints.DataSource = cmd.ExecuteReader();
            gvComplaints.DataBind();
        }
    }
}