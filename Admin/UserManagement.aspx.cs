using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;

public partial class Admin_UserManagement : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadUsers();
        }
    }

    private void LoadUsers()
    {
        string conStr = ConfigurationManager
            .ConnectionStrings["ComplainDB"]
            .ConnectionString;

        using (SqlConnection con = new SqlConnection(conStr))
        {
            SqlCommand cmd = new SqlCommand(@"
                SELECT 
                    u.UserId,
                    u.FullName,
                    u.Username,
                    u.Role,
                    d.DepartmentName,
                    u.IsActive
                FROM [Users] u
                LEFT JOIN Departments d
                    ON u.DepartmentId = d.DepartmentId
                ORDER BY u.Role, u.FullName", con);

            con.Open();
            gvUsers.DataSource = cmd.ExecuteReader();
            gvUsers.DataBind();
        }
    }

    protected void gvUsers_RowCommand(object sender, System.Web.UI.WebControls.GridViewCommandEventArgs e)
    {
        if (e.CommandName == "ToggleStatus")
        {
            int rowIndex = Convert.ToInt32(e.CommandArgument);
            int userId = Convert.ToInt32(gvUsers.DataKeys[rowIndex].Value);

            ToggleUserStatus(userId);
            LoadUsers();
        }
    }

    private void ToggleUserStatus(int userId)
    {
        string conStr = ConfigurationManager
            .ConnectionStrings["ComplainDB"]
            .ConnectionString;

        using (SqlConnection con = new SqlConnection(conStr))
        {
            SqlCommand cmd = new SqlCommand(@"
                UPDATE [Users]
                SET IsActive = CASE WHEN IsActive = 1 THEN 0 ELSE 1 END
                WHERE UserId = @UserId", con);

            cmd.Parameters.AddWithValue("@UserId", userId);

            con.Open();
            cmd.ExecuteNonQuery();
        }
    }
}
