using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

public partial class User_SubmitComplaint : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadDepartments();
        }
    }

    private void LoadDepartments()
    {
        string conStr = ConfigurationManager
            .ConnectionStrings["ComplainDB"]
            .ConnectionString;

        using (SqlConnection con = new SqlConnection(conStr))
        {
            SqlCommand cmd = new SqlCommand(
                "SELECT DepartmentId, DepartmentName FROM Departments WHERE IsActive = 1", con);

            con.Open();
            ddlDepartment.DataSource = cmd.ExecuteReader();
            ddlDepartment.DataTextField = "DepartmentName";
            ddlDepartment.DataValueField = "DepartmentId";
            ddlDepartment.DataBind();
        }

        ddlDepartment.Items.Insert(0,
            new ListItem("-- Select --", ""));
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        bool alreadyWarned = ViewState["DuplicateWarned"] != null;

        // validation
        if (ddlDepartment.SelectedIndex == 0)
        {
            lblMessage.Text = "Please select a department.";
            lblMessage.ForeColor = System.Drawing.Color.Red;
            return;
        }

        int userId = Convert.ToInt32(Session["UserId"]);
        int departmentId = Convert.ToInt32(ddlDepartment.SelectedValue);
        string subject = txtSubject.Text.Trim();
        string description = txtDescription.Text.Trim();

        string conStr = ConfigurationManager
            .ConnectionStrings["ComplainDB"].ConnectionString;

        // duplicate check
        bool duplicateExists = false;
        using (SqlConnection con = new SqlConnection(conStr))
        {
            SqlCommand cmdCheck = new SqlCommand(@"
            SELECT COUNT(*)
            FROM Complaints
            WHERE UserId = @UserId
              AND Subject LIKE '%' + @Subject + '%'
              AND CurrentStatus <> 'RESOLVED'", con);

            cmdCheck.Parameters.AddWithValue("@UserId", userId);
            cmdCheck.Parameters.AddWithValue("@Subject", subject);

            con.Open();
            duplicateExists = Convert.ToInt32(cmdCheck.ExecuteScalar()) > 0;
        }

        // ⚠ WARNING STEP (BEFORE INSERT)
        if (duplicateExists && !alreadyWarned)
        {
            lblMessage.Text =
                "⚠ You have already submitted a similar complaint that is still pending.<br/>" +
                "Click Submit again if you still want to proceed.";
            lblMessage.ForeColor = System.Drawing.Color.DarkOrange;

            ViewState["DuplicateWarned"] = true;
            return;
        }

        // ✅ INSERT STEP
        try
        {
            using (SqlConnection con = new SqlConnection(conStr))
            {
                con.Open();

                SqlCommand cmdComplaint = new SqlCommand(@"
                INSERT INTO Complaints
                (UserId, DepartmentId, Subject, Description, CurrentStatus)
                VALUES
                (@UserId, @DepartmentId, @Subject, @Description, 'SUBMITTED');
                SELECT SCOPE_IDENTITY();", con);

                cmdComplaint.Parameters.AddWithValue("@UserId", userId);
                cmdComplaint.Parameters.AddWithValue("@DepartmentId", departmentId);
                cmdComplaint.Parameters.AddWithValue("@Subject", subject);
                cmdComplaint.Parameters.AddWithValue("@Description", description);

                int complaintId = Convert.ToInt32(cmdComplaint.ExecuteScalar());

                SqlCommand cmdHistory = new SqlCommand(@"
                INSERT INTO ComplaintStatusHistory
                (ComplaintId, Status, Remark, ChangedBy)
                VALUES
                (@ComplaintId, 'SUBMITTED', 'Complaint submitted', @ChangedBy)", con);

                cmdHistory.Parameters.AddWithValue("@ComplaintId", complaintId);
                cmdHistory.Parameters.AddWithValue("@ChangedBy", userId);

                cmdHistory.ExecuteNonQuery();
            }

            lblMessage.Text = "Complaint submitted successfully.";
            lblMessage.ForeColor = System.Drawing.Color.Green;

            ViewState["DuplicateWarned"] = null;

            if (!duplicateExists || alreadyWarned)
            {
                ddlDepartment.SelectedIndex = 0;
                txtSubject.Text = "";
                txtDescription.Text = "";
            }
        }
        catch (Exception ex)
        {
            lblMessage.Text = ex.Message;
            lblMessage.ForeColor = System.Drawing.Color.Red;
        }
    }
}
