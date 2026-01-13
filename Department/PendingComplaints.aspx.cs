using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;

public partial class Department_PendingComplaints : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadPendingComplaints();
        }
    }

    private void LoadPendingComplaints()
    {
        int departmentId = Convert.ToInt32(Session["DepartmentId"]);

        string conStr = ConfigurationManager.ConnectionStrings["ComplainDB"].ConnectionString;

        using (SqlConnection con = new SqlConnection(conStr))
        {
            SqlCommand cmd = new SqlCommand(@"
            SELECT c.ComplaintId,c.Subject,u.Username,c.CurrentStatus,c.CreatedDate
            FROM Complaints c 
            INNER JOIN Users u ON c.UserId = u.UserId 
            WHERE c.DepartmentId = @DepartmentId 
            AND c.CurrentStatus <> 'RESOLVED' 
            ORDER BY c.CreatedDate ASC",con);

            cmd.Parameters.AddWithValue("@DepartmentId", departmentId);

            con.Open();
            gvComplaints.DataSource = cmd.ExecuteReader();
            gvComplaints.DataBind();
        }
    }
}