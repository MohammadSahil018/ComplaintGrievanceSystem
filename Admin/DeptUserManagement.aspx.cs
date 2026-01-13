using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;

public partial class Admin_DeptUserManagement : System.Web.UI.Page
{
    string conStr = ConfigurationManager.ConnectionStrings["ComplainDB"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadDepartments();
            LoadDeptUsers();
        }
    }

    private void LoadDepartments()
    {
        using (SqlConnection con = new SqlConnection(conStr))
        {
            SqlCommand cmd = new SqlCommand(
                "SELECT DepartmentId, DepartmentName FROM Departments WHERE IsActive = 1 ORDER BY DepartmentName", con);

            con.Open();
            ddlDepartment.DataSource = cmd.ExecuteReader();
            ddlDepartment.DataTextField = "DepartmentName";
            ddlDepartment.DataValueField = "DepartmentId";
            ddlDepartment.DataBind();
        }

        ddlDepartment.Items.Insert(0, new ListItem("-- Select Department --", ""));
    }

    private void LoadDeptUsers()
    {
        using (SqlConnection con = new SqlConnection(conStr))
        {
            SqlCommand cmd = new SqlCommand(@"
                SELECT u.UserId, u.FullName, u.Username, u.IsActive, d.DepartmentName
                FROM Users u
                INNER JOIN Departments d ON u.DepartmentId = d.DepartmentId
                WHERE u.Role = 'DEPT'
                ORDER BY u.UserId DESC", con);

            con.Open();
            gvDeptUsers.DataSource = cmd.ExecuteReader();
            gvDeptUsers.DataBind();
        }
    }

    protected void btnCreate_Click(object sender, EventArgs e)
    {
        string fullName = txtFullName.Text.Trim();
        string username = txtUsername.Text.Trim();
        string password = txtPassword.Text.Trim();
        string email = txtEmail.Text.Trim();

        if (ddlDepartment.SelectedIndex == 0)
        {
            lblMessage.Text = "Please select department.";
            lblMessage.ForeColor = System.Drawing.Color.Red;
            return;
        }

        if (fullName == "" || username == "" || password == "")
        {
            lblMessage.Text = "All fields are required.";
            lblMessage.ForeColor = System.Drawing.Color.Red;
            return;
        }

        int departmentId = Convert.ToInt32(ddlDepartment.SelectedValue);

        using (SqlConnection con = new SqlConnection(conStr))
        {
            con.Open();

            
            SqlCommand cmdCheck = new SqlCommand(
                "SELECT COUNT(*) FROM Users WHERE Username=@Username", con);
            cmdCheck.Parameters.AddWithValue("@Username", username);

            if (Convert.ToInt32(cmdCheck.ExecuteScalar()) > 0)
            {
                lblMessage.Text = "Username already exists.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }

            
            SqlCommand cmdInsert = new SqlCommand(@"
                INSERT INTO Users(FullName, Username, Email, PasswordHash, Role, DepartmentId, IsActive)
                VALUES(@FullName, @Username, @Email, @PasswordHash, 'DEPT', @DepartmentId, 1)", con);

            cmdInsert.Parameters.AddWithValue("@FullName", fullName);
            cmdInsert.Parameters.AddWithValue("@Username", username);
            cmdInsert.Parameters.AddWithValue("@Email",email);
            cmdInsert.Parameters.AddWithValue("@PasswordHash", password); 
            cmdInsert.Parameters.AddWithValue("@DepartmentId", departmentId);

            cmdInsert.ExecuteNonQuery();
        }

        lblMessage.Text = "Department officer created successfully.";
        lblMessage.ForeColor = System.Drawing.Color.Green;

        txtFullName.Text = "";
        txtUsername.Text = "";
        txtPassword.Text = "";
        ddlDepartment.SelectedIndex = 0;

        LoadDeptUsers();
    }

    protected void gvDeptUsers_RowCommand(object sender, System.Web.UI.WebControls.GridViewCommandEventArgs e)
    {
        if (e.CommandName == "ToggleOfficer")
        {
            int userId = Convert.ToInt32(e.CommandArgument);

            using (SqlConnection con = new SqlConnection(conStr))
            {
                SqlCommand cmd = new SqlCommand(@"
                    UPDATE Users
                    SET IsActive = CASE WHEN IsActive = 1 THEN 0 ELSE 1 END
                    WHERE UserId = @UserId AND Role='DEPT'", con);

                cmd.Parameters.AddWithValue("@UserId", userId);

                con.Open();
                cmd.ExecuteNonQuery();
            }

            LoadDeptUsers();
        }
    }
}
