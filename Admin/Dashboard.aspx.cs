using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;

public partial class Admin_Dashboard : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadCounts();
            LoadDepartmentSummary();
        }
    }

    private void LoadCounts()
    {
        string conStr = ConfigurationManager
            .ConnectionStrings["ComplainDB"]
            .ConnectionString;

        using (SqlConnection con = new SqlConnection(conStr))
        {
            SqlCommand cmd = new SqlCommand(@"
                SELECT
                    COUNT(*) AS Total,
                    SUM(CASE WHEN CurrentStatus <> 'RESOLVED' THEN 1 ELSE 0 END) AS Pending,
                    SUM(CASE WHEN CurrentStatus = 'RESOLVED' THEN 1 ELSE 0 END) AS Resolved
                FROM Complaints", con);

            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                lblTotal.Text = dr["Total"].ToString();
                lblPending.Text = dr["Pending"].ToString();
                lblResolved.Text = dr["Resolved"].ToString();
            }
        }
    }

    private void LoadDepartmentSummary()
    {
        string conStr = ConfigurationManager
            .ConnectionStrings["ComplainDB"]
            .ConnectionString;

        using (SqlConnection con = new SqlConnection(conStr))
        {
            SqlCommand cmd = new SqlCommand(@"
                SELECT
                    d.DepartmentName,
                    COUNT(c.ComplaintId) AS TotalComplaints
                FROM Departments d
                LEFT JOIN Complaints c
                    ON d.DepartmentId = c.DepartmentId
                GROUP BY d.DepartmentName
                ORDER BY d.DepartmentName", con);

            con.Open();
            gvDeptSummary.DataSource = cmd.ExecuteReader();
            gvDeptSummary.DataBind();
        }
    }
}
