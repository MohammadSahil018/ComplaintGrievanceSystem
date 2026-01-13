using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Net.Mail;
using System.Net;

public partial class Account_ForgotPassword : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Session["ResetEmail"] = null;
            Session["OTPVerified"] = null;
        }
    }
    protected void btnSendOTP_Click(object sender, EventArgs e)
    {
        string email = txtEmail.Text.Trim();

        if (email == "") 
        {
            lblMessage.Text = "Email is required.";
            lblMessage.ForeColor = System.Drawing.Color.Red;
            return;
        }

        string conStr = ConfigurationManager.ConnectionStrings["ComplainDB"].ConnectionString;
        int userId = 0;
        string fullName = "";
        string otp = new Random().Next(100000, 999999).ToString();

        using (SqlConnection con = new SqlConnection(conStr)) 
        {
            con.Open();

            SqlCommand cmdUser = new SqlCommand(@"
            SELECT UserId , FullName FROM Users 
            WHERE Email = @Email AND IsActive = 1",con);

            cmdUser.Parameters.AddWithValue("@Email",email);
            SqlDataReader dr = cmdUser.ExecuteReader();

            if (dr.Read()) 
            {
                userId = Convert.ToInt32(dr["UserId"]);
                fullName = dr["FullName"].ToString();
            }

            if (userId == 0)
            {
                lblMessage.Text = "Email not found.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }

            SqlCommand cmdOTP = new SqlCommand(@"
            INSERT INTO PasswordResetOtp(UserId,OTPCode, ExpiryTime, IsUsed)
             VALUES(@UserId, @OTPCode, DATEADD(MINUTE,5,GETDATE()),0)",con);

            cmdOTP.Parameters.AddWithValue("@UserId", userId);
            cmdOTP.Parameters.AddWithValue("@OTPCode",otp);
            cmdOTP.ExecuteNonQuery();
        }

        try
        {
            SendOtpEmail(email, fullName, otp);
            Session["ResetEmail"] = email;
            lblMessage.Text = "OTP sent sucessfully. Check your email.";
            lblMessage.ForeColor = System.Drawing.Color.Green;

            Response.Redirect("~/Account/VerifyOTP.aspx");
        }
        catch(Exception ex)
        {
            lblMessage.Text = "Unable to send OTP: " + ex.Message;
            lblMessage.ForeColor = System.Drawing.Color.Red;
        }
    }

    private void SendOtpEmail(string email, string name, string otp)
    {
        string fromEmail = "YOURMAIL@gmail.com";
        string appPassword = "YOUR_APP_PASSWORD";

        MailMessage msg = new MailMessage(fromEmail, email);
        msg.Subject = "OTP for Password Reset";
        msg.Body = "Hello " + name + ",\n\nYour OTP is: " + otp + "\n\nValid for 5 minutes.\n\nSmartGov Portal";
        msg.IsBodyHtml = false;

        SmtpClient smtp = new SmtpClient("smtp.gmail.com",587);
        smtp.Credentials = new NetworkCredential(fromEmail, appPassword);
        smtp.EnableSsl = true;
        smtp.Send(msg);
    }
}