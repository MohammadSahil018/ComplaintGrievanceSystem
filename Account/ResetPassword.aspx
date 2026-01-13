<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ResetPassword.aspx.cs" Inherits="Account_ResetPassword" %>

<!DOCTYPE html>
<html>
<head id="Head1" runat="server">
    <title>Reset Password</title>
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
        <i class="fas fa-user-shield" style="font-size: 3rem; color: #0ea5e9;"></i>
    </div>
    <h2 style="margin:0; text-align:center; color:#0f172a;">Set New Password</h2>
    <p style="color:#64748b; text-align:center; font-size:0.9rem; margin-bottom:25px;">
        Your account is verified. Choose a strong new password.
    </p>

    <div class="field">
        <label style="font-weight:600; color:#475569; font-size:0.85rem;">New Password</label>
        <asp:TextBox ID="txtNewPassword" runat="server" CssClass="input" TextMode="Password" placeholder="••••••••" />
    </div>

    <div class="field" style="margin-top:15px;">
        <label style="font-weight:600; color:#475569; font-size:0.85rem;">Confirm New Password</label>
        <asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="input" TextMode="Password" placeholder="••••••••" />
    </div>

    <asp:Button ID="btnReset" runat="server" Text="Update Password" CssClass="btn" OnClick="btnReset_Click" />

    <asp:Label ID="lblMessage" runat="server" style="display:block; margin-top:15px; text-align:center;" />
</div>
</form>
</body>
</html>
