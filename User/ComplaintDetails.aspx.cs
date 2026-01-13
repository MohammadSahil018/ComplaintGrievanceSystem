using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;

public partial class User_ComplaintDetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            int complaintId;
            if (!int.TryParse(Request.QueryString["cid"], out complaintId))
            {
                lblError.Text = "Invalid request.";
                lblError.ForeColor = System.Drawing.Color.Red;
                return;
            }

            ViewState["ComplaintId"] = complaintId;

            LoadComplaintDetails();
            LoadComplaintHistory();
        }
    }

    private void LoadComplaintDetails()
    {
        int complaintId = Convert.ToInt32(ViewState["ComplaintId"]);
        string role = Session["Role"].ToString();
        int userId = Convert.ToInt32(Session["UserId"]);

        string conStr = ConfigurationManager.ConnectionStrings["ComplainDB"].ConnectionString;

        using (SqlConnection con = new SqlConnection(conStr))
        {
            string query = @"
                SELECT 
                    c.ComplaintId,
                    c.Subject,
                    c.Description,
                    d.DepartmentName,
                    c.CurrentStatus,
                    c.CreatedDate
                FROM Complaints c
                INNER JOIN Departments d
                    ON c.DepartmentId = d.DepartmentId
                WHERE c.ComplaintId = @ComplaintId";

            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@ComplaintId", complaintId);

            if (role == "USER")
            {
                cmd.CommandText += " AND c.UserId = @UserId";
                cmd.Parameters.AddWithValue("@UserId", userId);
            }
            else if (role == "DEPT")
            {
                cmd.CommandText += " AND c.DepartmentId = @DepartmentId";
                cmd.Parameters.AddWithValue("@DepartmentId",
                    Convert.ToInt32(Session["DepartmentId"]));
            }

            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                lblComplaintId.Text = dr["ComplaintId"].ToString();
                lblSubject.Text = dr["Subject"].ToString();
                lblDescription.Text = dr["Description"].ToString();
                lblDepartment.Text = dr["DepartmentName"].ToString();
                lblStatus.Text = dr["CurrentStatus"].ToString();
                lblDate.Text = Convert.ToDateTime(dr["CreatedDate"])
                    .ToString("dd-MMM-yyyy HH:mm");
            }
            else
            {
                lblError.Text = "Complaint not found or access denied.";
                lblError.ForeColor = System.Drawing.Color.Red;
            }
        }
    }

    private void LoadComplaintHistory()
    {
        int complaintId = Convert.ToInt32(ViewState["ComplaintId"]);

        string conStr = ConfigurationManager.ConnectionStrings["ComplainDB"].ConnectionString;

        using (SqlConnection con = new SqlConnection(conStr))
        {
            SqlCommand cmd = new SqlCommand(@"
                SELECT 
                    Status,
                    Remark,
                    ChangedDate
                FROM ComplaintStatusHistory
                WHERE ComplaintId = @ComplaintId
                ORDER BY ChangedDate ASC", con);

            cmd.Parameters.AddWithValue("@ComplaintId", complaintId);

            con.Open();
            gvHistory.DataSource = cmd.ExecuteReader();
            gvHistory.DataBind();
        }
    }
}
