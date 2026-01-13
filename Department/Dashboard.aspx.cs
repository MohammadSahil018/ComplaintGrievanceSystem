using System;
using System.Configuration;
using System.Data.SqlClient;

public partial class Department_Dashboard : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadDashboardStats();
        }
    }

    private void LoadDashboardStats()
    {
        int departmentId = Convert.ToInt32(Session["DepartmentId"]);

        string conStr = ConfigurationManager
            .ConnectionStrings["ComplainDB"]
            .ConnectionString;

        using (SqlConnection con = new SqlConnection(conStr))
        {
            SqlCommand cmd = new SqlCommand(@"
                SELECT
                    SUM(CASE WHEN CurrentStatus <> 'RESOLVED' THEN 1 ELSE 0 END) AS PendingCount,
                    SUM(CASE 
                        WHEN CAST(CreatedDate AS DATE) = CAST(GETDATE() AS DATE)
                        THEN 1 ELSE 0 END) AS NewToday,
                    SUM(CASE WHEN CurrentStatus = 'RESOLVED' THEN 1 ELSE 0 END) AS ResolvedCount
                FROM Complaints
                WHERE DepartmentId = @DepartmentId", con);

            cmd.Parameters.AddWithValue("@DepartmentId", departmentId);

            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                lblPending.Text = dr["PendingCount"].ToString();
                lblNewToday.Text = dr["NewToday"].ToString();
                lblResolved.Text = dr["ResolvedCount"].ToString();
            }
        }
    }
}
