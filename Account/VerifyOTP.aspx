<%@ Page Language="C#" AutoEventWireup="true" CodeFile="VerifyOTP.aspx.cs" Inherits="Account_VerifyOTP" %>

<!DOCTYPE html>
<html>
<head id="Head1" runat="server">
    <title>Verify OTP</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet">
    <style>
        body { font-family: Inter; background:#f8fafc; margin:0; height:100vh; display:flex; align-items:center; justify-content:center; }
        .card { width:420px; background:#fff; padding:30px; border-radius:16px; border:1px solid #e2e8f0; box-shadow:0 10px 30px rgba(0,0,0,0.06); }
        .input { width:100%; padding:12px; border:1px solid #e2e8f0; border-radius:8px; margin-top:6px; }
        .btn { width:100%; padding:12px; border:none; background:#10b981; color:white; font-weight:600; border-radius:8px; margin-top:15px; cursor:pointer; }
        .btn:hover { background:#059669; }
    </style>
</head>
<body>
<form id="Form1" runat="server">
    <div class="card">
    <div style="text-align:center; margin-bottom:20px;">
        <i class="fas fa-shield-alt" style="font-size: 3rem; color: #10b981;"></i>
    </div>
    <h2 style="margin:0; text-align:center; color:#0f172a;">Verification</h2>
    <p style="color:#64748b; text-align:center; font-size:0.9rem; margin-bottom:25px;">
        Please enter the OTP sent to your email to continue.
    </p>

    <div class="field">
        <label style="font-weight:600; color:#475569; font-size:0.85rem;">One-Time Password</label>
        <asp:TextBox ID="txtOTP" runat="server" CssClass="input" style="text-align:center; letter-spacing:8px; font-size:1.2rem; font-weight:700;" placeholder="000000" MaxLength="6" />
    </div>

    <asp:Button ID="btnVerify" runat="server" Text="Verify & Proceed" CssClass="btn" OnClick="btnVerify_Click" />

    <asp:Label ID="lblMessage" runat="server" style="display:block; margin-top:15px; text-align:center;" />
</div>
</form>
</body>
</html>
