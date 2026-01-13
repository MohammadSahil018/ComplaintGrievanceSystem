using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;

public partial class Department_UpdateComplaintStatus : System.Web.UI.Page
{
    int complaintId;
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            if(!int.TryParse(Request.QueryString["cid"],out complaintId))
            {
                lblMessage.Text = "Invalid request";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }

            ViewState["ComplaintId"] = complaintId;
            LoadComplaintDetails();
        }
    }

    private void LoadComplaintDetails()
    {
 	    string conStr = ConfigurationManager.ConnectionStrings["ComplainDB"].ConnectionString;

        using(SqlConnection con = new SqlConnection(conStr))
        {
            SqlCommand cmd = new SqlCommand(@"SELECT ComplaintId,Subject,CurrentStatus FROM Complaints WHERE ComplaintId = @ComplaintId",con);

            cmd.Parameters.AddWithValue("@ComplaintId",complaintId);

            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();

            if(dr.Read())
            {
                lblComplaintId.Text = dr["ComplaintId"].ToString();
                lblSubject.Text = dr["Subject"].ToString();
                lblCurrentStatus.Text = dr["CurrentStatus"].ToString();
            }
        }
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        int complaintId = Convert.ToInt32(ViewState["ComplaintId"]);
        string newStatus = ddlStatus.SelectedValue;
        string remark = txtRemark.Text.Trim();
        int changedBy = Convert.ToInt32(Session["UserId"]);

        string conStr = ConfigurationManager.ConnectionStrings["ComplainDB"].ConnectionString;

        using(SqlConnection con = new SqlConnection(conStr))
        {
            con.Open();
            SqlCommand cmdUpdate = new SqlCommand(@"UPDATE Complaints SET CurrentStatus = @Status WHERE ComplaintId = @ComplaintId",con);

            cmdUpdate.Parameters.AddWithValue("@Status",newStatus);
            cmdUpdate.Parameters.AddWithValue("@ComplaintId",complaintId);
            cmdUpdate.ExecuteNonQuery();

            SqlCommand cmdHistory = new SqlCommand(@"INSERT INTO ComplaintStatusHistory(ComplaintId,Status,Remark,ChangedBy) VALUES (@ComplaintId,@Status,@Remark,@ChangedBy)",con);

            cmdHistory.Parameters.AddWithValue("@ComplaintId",complaintId);
            cmdHistory.Parameters.AddWithValue("@Status",newStatus);
            cmdHistory.Parameters.AddWithValue("@Remark",remark);
            cmdHistory.Parameters.AddWithValue("@ChangedBy",changedBy);

            cmdHistory.ExecuteNonQuery();
        }
        lblMessage.Text = "Status update sucessfully.";
        lblMessage.ForeColor = System.Drawing.Color.Green;
    }
}