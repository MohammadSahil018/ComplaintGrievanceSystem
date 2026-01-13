<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>
<html>
<head id="Head1" runat="server">
    <title>Login | Smart Grievance System</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        body { font-family: 'Inter', sans-serif; margin: 0; display: flex; height: 100vh; background: #f8fafc; }
        .login-container { display: flex; width: 100%; }
        
        /* Left Side Branding */
        .brand-side { 
            flex: 1.2; background: linear-gradient(135deg, #0f172a 0%, #1e293b 100%); 
            color: white; display: flex; flex-direction: column; justify-content: center; padding: 4rem;
        }
        .brand-side h1 { font-size: 2.5rem; margin-bottom: 1rem; color: #0ea5e9; }
        .brand-side p { font-size: 1.1rem; opacity: 0.8; line-height: 1.6; max-width: 500px; }

        /* Right Side Form */
        .form-side { flex: 1; display: flex; align-items: center; justify-content: center; padding: 2rem; }
        .login-card { background: white; padding: 2.5rem; border-radius: 16px; box-shadow: 0 10px 30px rgba(0,0,0,0.05); width: 100%; max-width: 400px; }
        
        .field { margin-bottom: 1.5rem; }
        .field label { display: block; font-weight: 600; margin-bottom: 0.5rem; color: #475569; font-size: 0.9rem; }
        
        .input-style { 
            width: 100%; padding: 12px; border: 1px solid #e2e8f0; border-radius: 8px; 
            font-size: 1rem; box-sizing: border-box; transition: 0.3s;
        }
        .input-style:focus { outline: none; border-color: #0ea5e9; box-shadow: 0 0 0 4px rgba(14, 165, 233, 0.1); }
        
        .btn-login { 
            width: 100%; background: #0ea5e9; color: white; border: none; padding: 14px; 
            border-radius: 8px; font-weight: 600; font-size: 1rem; cursor: pointer; transition: 0.3s;
        }
        .btn-login:hover { background: #0284c7; transform: translateY(-1px); }
        
        .msg { display: block; margin-top: 1rem; text-align: center; font-size: 0.9rem; font-weight: 500; }
    </style>
</head>
<body>
    <form id="form1" runat="server" class="login-container">
        <div class="brand-side">
            <i class="fas fa-shield-halved" style="font-size: 3rem; margin-bottom: 2rem; color: #0ea5e9;"></i>
            <h1>Smart Grievance<br />Portal</h1>
            <p>A digital bridge between citizens and government. Securely lodge, track, and resolve your grievances in real-time.</p>
        </div>

        <div class="form-side">
            <div class="login-card">
                <h2 style="margin: 0 0 0.5rem 0; color: #0f172a;">Welcome Back</h2>
                <p style="color: #64748b; margin-bottom: 2rem;">Please enter your credentials</p>

                <div class="field">
                    <label>Username</label>
                    <asp:TextBox ID="txtUsername" runat="server" CssClass="input-style" placeholder="Enter your ID"></asp:TextBox>
                </div>

                <div class="field">
                    <label>Password</label>
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="input-style" placeholder="••••••••"></asp:TextBox>
                </div>

                <asp:Button ID="btnLogin" runat="server" Text="Sign In" CssClass="btn-login" OnClick="btnLogin_Click" />

                <asp:Label ID="lblMessage" runat="server" CssClass="msg" ForeColor="#ef4444"></asp:Label>
                
                <div style="text-align:center; margin-top: 12px;">
                <asp:HyperLink ID="lnkRegister" runat="server"
                    NavigateUrl="~/Account/Register.aspx"
                    Text="Create account"
                    style="color:#0ea5e9; font-weight:600; text-decoration:none;" />
                </div>


                <div style="margin-top: 2rem; text-align: center; border-top: 1px solid #f1f5f9; padding-top: 1.5rem;">
                    <p style="font-size: 0.85rem; color: #94a3b8;">&copy; 2026 SmartGov e-Services</p>
                </div>
            </div>
        </div>
    </form>
</body>
</html>