using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;

public partial class User_Profile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadProfile();
            ShowViewMode();
        }
    }

    private void LoadProfile()
    {
        int userId = Convert.ToInt32(Session["UserId"]);
        string conStr = ConfigurationManager.ConnectionStrings["ComplainDB"].ConnectionString;

        using (SqlConnection con = new SqlConnection(conStr))
        {
            SqlCommand cmd = new SqlCommand(@"
                SELECT FullName, Username, Email
                FROM Users
                WHERE UserId=@UserId AND IsActive=1", con);

            cmd.Parameters.AddWithValue("@UserId", userId);

            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                string fullName = dr["FullName"].ToString();
                string username = dr["Username"].ToString();
                string email = dr["Email"].ToString();

                
                lblFullName.Text = fullName;
                lblUsername.Text = username;
                lblEmail.Text = email;

                
                txtFullName.Text = fullName;
                txtUsername.Text = username;
                txtEmail.Text = email;

                
            }
        }
    }

    private void ShowViewMode()
    {
        pnlView.Visible = true;
        pnlEdit.Visible = false;
        pnlPassword.Visible = false;
        lblMessage.Text = "";
    }

    private void ShowEditMode()
    {
        pnlView.Visible = false;
        pnlEdit.Visible = true;
        pnlPassword.Visible = false;
        lblMessage.Text = "";
    }

    private void ShowPasswordMode()
    {
        pnlView.Visible = false;
        pnlEdit.Visible = false;
        pnlPassword.Visible = true;
        lblMessage.Text = "";
    }

    protected void btnEdit_Click(object sender, EventArgs e)
    {
        LoadProfile();
        ShowEditMode();
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        LoadProfile();
        ShowViewMode();
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        int userId = Convert.ToInt32(Session["UserId"]);
        string fullName = txtFullName.Text.Trim();

        if (fullName == "")
        {
            lblMessage.Text = "Full Name cannot be empty.";
            lblMessage.ForeColor = System.Drawing.Color.Red;
            return;
        }

        string conStr = ConfigurationManager.ConnectionStrings["ComplainDB"].ConnectionString;

        using (SqlConnection con = new SqlConnection(conStr))
        {
            SqlCommand cmd = new SqlCommand(@"
                UPDATE Users
                SET FullName=@FullName
                WHERE UserId=@UserId", con);

            cmd.Parameters.AddWithValue("@FullName", fullName);
            cmd.Parameters.AddWithValue("@UserId", userId);

            con.Open();
            cmd.ExecuteNonQuery();
        }

        lblMessage.Text = "Profile updated successfully.";
        lblMessage.ForeColor = System.Drawing.Color.Green;

        LoadProfile();
        ShowViewMode();
    }

    protected void btnShowPassword_Click(object sender, EventArgs e)
    {
        txtNewPassword.Text = "";
        txtConfirmPassword.Text = "";
        ShowPasswordMode();
    }

    protected void btnCancelPassword_Click(object sender, EventArgs e)
    {
        ShowViewMode();
    }

    protected void btnUpdatePassword_Click(object sender, EventArgs e)
    {
        int userId = Convert.ToInt32(Session["UserId"]);
        string newPassword = txtNewPassword.Text.Trim();
        string confirmPassword = txtConfirmPassword.Text.Trim();

        if (newPassword.Length < 4)
        {
            lblMessage.Text = "Password must be at least 4 characters.";
            lblMessage.ForeColor = System.Drawing.Color.Red;
            return;
        }

        if (newPassword != confirmPassword)
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
                WHERE UserId=@UserId", con);

            cmd.Parameters.AddWithValue("@PasswordHash", newPassword);
            cmd.Parameters.AddWithValue("@UserId", userId);

            con.Open();
            cmd.ExecuteNonQuery();
        }

        lblMessage.Text = "Password updated successfully.";
        lblMessage.ForeColor = System.Drawing.Color.Green;

        ShowViewMode();
    }
}

