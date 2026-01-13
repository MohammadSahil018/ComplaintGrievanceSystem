using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
   
    protected void  btnLogin_Click(object sender, EventArgs e)
    {
        string username = txtUsername.Text.Trim();
        string password = txtPassword.Text.Trim();

        string conStr = ConfigurationManager.ConnectionStrings["ComplainDB"].ConnectionString;
        SqlConnection con = new SqlConnection(conStr);

        SqlCommand cmd = new SqlCommand(@"
        SELECT UserId, Role, DepartmentId
        FROM Users
        WHERE Username = @Username
        AND PasswordHash = @Password
        AND IsActive = 1",con);

        cmd.Parameters.AddWithValue("@Username", username);
        cmd.Parameters.AddWithValue("@Password", password);

        con.Open();
        SqlDataReader dr = cmd.ExecuteReader();

        if (dr.Read())
        {
            Session["UserId"] = dr["UserId"];
            Session["Role"] = dr["Role"];
            Session["DepartmentId"] = dr["DepartmentId"];

            string role = dr["Role"].ToString();

            if (role == "ADMIN")
                Response.Redirect("Admin/AllComplaints.aspx");
            else if (role == "DEPT")
                Response.Redirect("Department/PendingComplaints.aspx");
            else
                Response.Redirect("User/SubmitComplaint.aspx");
        }
        else
        {
            lblMessage.Text = "Invalid username or password";
        }

        con.Close();
    }
}