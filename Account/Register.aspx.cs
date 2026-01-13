using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;

public partial class Account_Register : System.Web.UI.Page
{
    protected void btnRegister_Click(object sender, EventArgs e)
    {
        string fullName = txtFullName.Text.Trim();
        string username = txtUsername.Text.Trim();
        string password = txtPassword.Text.Trim();
        string email = txtEmail.Text.Trim();

        if (fullName == "" || email == "" || username == "" || password == "")
        {
            lblMessage.Text = "All fields are required.";
            lblMessage.ForeColor = System.Drawing.Color.Red;
            return;
        }

        string conStr = ConfigurationManager.ConnectionStrings["ComplainDB"].ConnectionString;

        using (SqlConnection con = new SqlConnection(conStr))
        {
            con.Open();

            
            SqlCommand checkCmd = new SqlCommand(
                "SELECT COUNT(*) FROM Users WHERE Username=@Username", con);
            checkCmd.Parameters.AddWithValue("@Username", username);

            if (Convert.ToInt32(checkCmd.ExecuteScalar()) > 0)
            {
                lblMessage.Text = "Username already exists.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }

            
            SqlCommand checkEmailCmd = new SqlCommand(
                "SELECT COUNT(*) FROM Users WHERE Email=@Email", con);
            checkEmailCmd.Parameters.AddWithValue("@Email", email);

            if (Convert.ToInt32(checkEmailCmd.ExecuteScalar()) > 0)
            {
                lblMessage.Text = "Email already exists.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }

            SqlCommand insertCmd = new SqlCommand(@"
            INSERT INTO Users (FullName, Username, PasswordHash, Role, DepartmentId, IsActive, Email)
            VALUES (@FullName, @Username, @Password, 'USER', NULL, 1, @Email)", con);

            insertCmd.Parameters.AddWithValue("@FullName", fullName);
            insertCmd.Parameters.AddWithValue("@Username", username);
            insertCmd.Parameters.AddWithValue("@Password", password);
            insertCmd.Parameters.AddWithValue("@Email", email);

            insertCmd.ExecuteNonQuery();
        }

        Response.Redirect("~/Login.aspx");
    }

}
