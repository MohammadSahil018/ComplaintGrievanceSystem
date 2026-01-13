using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

public partial class Admin_Departments : System.Web.UI.Page
{
    string conStr = ConfigurationManager.ConnectionStrings["ComplainDB"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadDepartments();
        }
    }

    private void LoadDepartments()
    {
        using (SqlConnection con = new SqlConnection(conStr))
        {
            SqlCommand cmd = new SqlCommand(@"
                SELECT DepartmentId, DepartmentName, IsActive, CreatedDate
                FROM Departments
                ORDER BY DepartmentName", con);

            con.Open();

            gvDepartments.DataSource = cmd.ExecuteReader();
            gvDepartments.DataBind();
        }
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        string deptName = txtDepartmentName.Text.Trim();

        if (deptName == "")
        {
            lblMessage.Text = "Department name is required.";
            lblMessage.ForeColor = System.Drawing.Color.Red;
            return;
        }

        using (SqlConnection con = new SqlConnection(conStr))
        {
            con.Open();

            // Duplicate check
            SqlCommand cmdCheck = new SqlCommand(@"
                SELECT COUNT(*)
                FROM Departments
                WHERE LOWER(DepartmentName) = LOWER(@DepartmentName)", con);

            cmdCheck.Parameters.AddWithValue("@DepartmentName", deptName);

            int exists = Convert.ToInt32(cmdCheck.ExecuteScalar());

            if (exists > 0)
            {
                lblMessage.Text = "Department already exists.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }

            // Insert
            SqlCommand cmdInsert = new SqlCommand(@"
                INSERT INTO Departments(DepartmentName, IsActive)
                VALUES(@DepartmentName, 1)", con);

            cmdInsert.Parameters.AddWithValue("@DepartmentName", deptName);
            cmdInsert.ExecuteNonQuery();
        }

        lblMessage.Text = "Department added successfully.";
        lblMessage.ForeColor = System.Drawing.Color.Green;

        txtDepartmentName.Text = "";
        LoadDepartments();
    }

    protected void gvDepartments_RowCommand(object sender, System.Web.UI.WebControls.GridViewCommandEventArgs e)
    {
        if (e.CommandName == "ToggleActive")
        {
            int deptId = Convert.ToInt32(e.CommandArgument);

            using (SqlConnection con = new SqlConnection(conStr))
            {
                SqlCommand cmd = new SqlCommand(@"
                    UPDATE Departments
                    SET IsActive = CASE WHEN IsActive = 1 THEN 0 ELSE 1 END
                    WHERE DepartmentId = @DepartmentId", con);

                cmd.Parameters.AddWithValue("@DepartmentId", deptId);

                con.Open();
                cmd.ExecuteNonQuery();
            }

            LoadDepartments();
        }
    }
}
