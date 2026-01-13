using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;

public partial class Account_VerifyOTP : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["ResetEmail"] == null)
            {
                Response.Redirect("~/Account/ForgotPassword.aspx");
                return;
            }
        }
    }

    protected void btnVerify_Click(object sender, EventArgs e)
    {
        string otpInput = txtOTP.Text.Trim();
        string email = Session["ResetEmail"].ToString();

        if (otpInput == "")
        {
            lblMessage.Text = "OTP is required.";
            lblMessage.ForeColor = System.Drawing.Color.Red;
            return;
        }

        string conStr = ConfigurationManager.ConnectionStrings["ComplainDB"].ConnectionString;

        using (SqlConnection con = new SqlConnection(conStr))
        {
            con.Open();

            SqlCommand cmd = new SqlCommand(@"
                SELECT TOP 1 o.OTPId
                FROM PasswordResetOTP o
                INNER JOIN Users u ON o.UserId = u.UserId
                WHERE u.Email=@Email
                  AND o.OTPCode=@OTP
                  AND o.IsUsed=0
                  AND o.ExpiryTime >= GETDATE()
                ORDER BY o.OTPId DESC", con);

            cmd.Parameters.AddWithValue("@Email", email);
            cmd.Parameters.AddWithValue("@OTP", otpInput);

            object otpId = cmd.ExecuteScalar();

            if (otpId == null)
            {
                lblMessage.Text = "Invalid or expired OTP.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }

            // Mark OTP used
            SqlCommand cmdUsed = new SqlCommand(@"
                UPDATE PasswordResetOTP
                SET IsUsed=1
                WHERE OTPId=@OTPId", con);

            cmdUsed.Parameters.AddWithValue("@OTPId", Convert.ToInt32(otpId));
            cmdUsed.ExecuteNonQuery();
        }

        Session["OTPVerified"] = true;
        Response.Redirect("~/Account/ResetPassword.aspx");
    }
}
