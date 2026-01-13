<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ForgotPassword.aspx.cs" Inherits="Account_ForgotPassword" %>

<!DOCTYPE html>
<html>
<head id="Head1" runat="server">
    <title>Forgot Password</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet">
    <style>
        body { font-family: Inter; background:#f8fafc; margin:0; height:100vh; display:flex; align-items:center; justify-content:center; }
        .card { width:420px; background:#fff; padding:30px; border-radius:16px; border:1px solid #e2e8f0; box-shadow:0 10px 30px rgba(0,0,0,0.06); }
        .input { width:100%; padding:12px; border:1px solid #e2e8f0; border-radius:8px; margin-top:6px; }
        .btn { width:100%; padding:12px; border:none; background:#0ea5e9; color:white; font-weight:600; border-radius:8px; margin-top:15px; cursor:pointer; }
        .btn:hover { background:#0284c7; }
    </style>
</head>
<body>
<form id="Form1" runat="server">
    <div class="card">
    <div style="text-align:center; margin-bottom:20px;">
        <i class="fas fa-lock-open" style="font-size: 3rem; color: #0ea5e9;"></i>
    </div>
    <h2 style="margin:0; text-align:center; color:#0f172a;">Forgot Password?</h2>
    <p style="color:#64748b; text-align:center; font-size:0.9rem; margin-bottom:25px;">
        Enter your registered email and we'll send a 6-digit verification code.
    </p>

    <div class="field">
        <label style="font-weight:600; color:#475569; font-size:0.85rem;">Email Address</label>
        <div style="position:relative;">
            <i class="fas fa-envelope" style="position:absolute; left:12px; top:15px; color:#94a3b8;"></i>
            <asp:TextBox ID="txtEmail" runat="server" CssClass="input" style="padding-left:40px;" placeholder="name@example.com" />
        </div>
    </div>

    <asp:Button ID="btnSendOTP" runat="server" Text="Send Verification Code" CssClass="btn" OnClick="btnSendOTP_Click" />
    
    <div style="text-align:center; margin-top:15px;">
        <a href="Login.aspx" style="color:#0ea5e9; text-decoration:none; font-size:0.85rem; font-weight:600;">Back to Login</a>
    </div>

    <asp:Label ID="lblMessage" runat="server" style="display:block; margin-top:15px; text-align:center;" />
</div>
</form>
</body>
</html>
