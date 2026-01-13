using System;
using System.Configuration;
using System.Data.SqlClient;

public partial class User_Dashboard : System.Web.UI.Page
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
        int userId = Convert.ToInt32(Session["UserId"]);

        string conStr = ConfigurationManager
            .ConnectionStrings["ComplainDB"]
            .ConnectionString;

        using (SqlConnection con = new SqlConnection(conStr))
        {
            SqlCommand cmd = new SqlCommand(@"
                SELECT
                    COUNT(*) AS TotalCount,
                    SUM(CASE WHEN CurrentStatus <> 'RESOLVED' THEN 1 ELSE 0 END) AS PendingCount,
                    SUM(CASE WHEN CurrentStatus = 'RESOLVED' THEN 1 ELSE 0 END) AS ResolvedCount
                FROM Complaints
                WHERE UserId = @UserId", con);

            cmd.Parameters.AddWithValue("@UserId", userId);

            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                lblTotal.Text = dr["TotalCount"].ToString();
                lblPending.Text = dr["PendingCount"].ToString();
                lblResolved.Text = dr["ResolvedCount"].ToString();
            }
        }
    }
}
