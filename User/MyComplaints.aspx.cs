using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;

public partial class User_UpdateComplaints : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack) 
        {
            LoadMyComlaints();
        }
    }

    private void LoadMyComlaints()
    {
        int userId = Convert.ToInt32(Session["UserId"]);

        String conStr = ConfigurationManager.ConnectionStrings["ComplainDB"].ConnectionString;

        using (SqlConnection con = new SqlConnection(conStr))
        {
            SqlCommand cmd = new SqlCommand(@"
                SELECT
                    c.ComplaintId,
                    c.Subject,
                    d.DepartmentName,
                    c.CurrentStatus,
                    c.CreatedDate
                FROM Complaints c
                INNER JOIN Departments d
                    ON c.DepartmentId = d.DepartmentId
                WHERE c.UserId = @UserId
                ORDER BY c.CreatedDate DESC",con);

            cmd.Parameters.AddWithValue("@UserId", userId);

            con.Open();
            gvComplaints.DataSource = cmd.ExecuteReader();
            gvComplaints.DataBind();
        }
    }
}