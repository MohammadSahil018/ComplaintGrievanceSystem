using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;

public partial class Department_ComplaintHistory : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadDepartmentComplaints();
        }
    }

    private void LoadDepartmentComplaints()
    {
        int departmentId = Convert.ToInt32(Session["DepartmentId"]);

        string conStr = ConfigurationManager.ConnectionStrings["ComplainDB"].ConnectionString;

        using (SqlConnection con = new SqlConnection(conStr))
        {
            SqlCommand cmd = new SqlCommand(@"SELECT ComplaintId,Subject,CurrentStatus,CreatedDate FROM Complaints WHERE DepartmentId = @DepartmentId ORDER BY CreatedDate DESC", con);

            cmd.Parameters.AddWithValue("@DepartmentId", departmentId);

            con.Open();
            gvHistory.DataSource = cmd.ExecuteReader();
            gvHistory.DataBind();
        }
    }
}