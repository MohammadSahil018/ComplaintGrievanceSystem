using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;

public partial class Account_ResetPassword : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["ResetEmail"] == null || Session["OTPVerified"] == null)
            {
                Response.Redirect("~/Account/ForgotPassword.aspx");
                return;
            }
        }
    }

    protected void btnReset_Click(object sender, EventArgs e)
    {
        string email = Session["ResetEmail"].ToString();
        string newPass = txtNewPassword.Text.Trim();
        string confirmPass = txtConfirmPassword.Text.Trim();

        if (newPass == "" || confirmPass == "")
        {
            lblMessage.Text = "All fields are required.";
            lblMessage.ForeColor = System.Drawing.Color.Red;
            return;
        }

        if (newPass.Length < 4)
        {
            lblMessage.Text = "Password must be at least 4 characters.";
            lblMessage.ForeColor = System.Drawing.Color.Red;
            return;
        }

        if (newPass != confirmPass)
        {
            lblMessage.Text = "Passwords do not match.";
            lblMessage.ForeColor = System.Drawing.Color.Red;
            return;
        }

        string conStr = ConfigurationManager.ConnectionStrings["ComplainDB"].ConnectionString;

        using (SqlConnection con = new SqlConnection(conStr))
        {
            SqlCommand cmd = new SqlCommand(@"
                UPDATE Users
                SET PasswordHash=@PasswordHash
                WHERE Email=@Email AND IsActive=1", con);

            cmd.Parameters.AddWithValue("@PasswordHash", newPass); // plain for now
            cmd.Parameters.AddWithValue("@Email", email);

            con.Open();
            cmd.ExecuteNonQuery();
        }

        // clear reset sessions
        Session["ResetEmail"] = null;
        Session["OTPVerified"] = null;

        Response.Redirect("~/Login.aspx");
    }
}
