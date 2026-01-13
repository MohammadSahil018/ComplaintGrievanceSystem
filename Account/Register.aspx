<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Account_Register" %>

<!DOCTYPE html>
<html>
<head id="Head1" runat="server">
    <title>Citizen Registration | Smart Gov</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        body { font-family: 'Inter', sans-serif; margin: 0; display: flex; height: 100vh; background: #f8fafc; overflow: hidden; }
        .container { display: flex; width: 100%; }

        /* Left Side Branding - Consistency with Login */
        .brand-side {
            flex: 1.2;
            background: linear-gradient(135deg, #0f172a 0%, #1e293b 100%);
            color: white;
            display: flex;
            flex-direction: column;
            justify-content: center;
            padding: 4rem;
        }
        .brand-side h1 { font-size: 2.8rem; margin-bottom: 1rem; color: #0ea5e9; font-weight: 700; }
        .brand-side p { font-size: 1.1rem; opacity: 0.8; line-height: 1.6; max-width: 500px; }
        .feature-item { display: flex; align-items: center; gap: 15px; margin-top: 20px; color: #94a3b8; }
        .feature-item i { color: #10b981; }

        /* Right Side Form */
        .form-side { flex: 1; display: flex; align-items: center; justify-content: center; padding: 2rem; overflow-y: auto; }
        .card { background: white; padding: 2.5rem; border-radius: 20px; box-shadow: 0 20px 50px rgba(0,0,0,0.08); width: 100%; max-width: 440px; }

        .field { margin-bottom: 1.5rem; position: relative; }
        .field label { display: block; font-weight: 600; margin-bottom: 0.5rem; color: #334155; font-size: 0.85rem; }
        
        /* Premium Input Styling with Icons */
        .input-style {
            width: 100%; padding: 12px 12px 12px 42px; border: 1px solid #e2e8f0; border-radius: 10px;
            font-size: 0.95rem; box-sizing: border-box; transition: all 0.3s ease; background: #fcfdfe;
        }
        .input-style:focus { 
            outline: none; border-color: #0ea5e9; 
            box-shadow: 0 0 0 4px rgba(14, 165, 233, 0.1); 
            background: #fff;
        }
        .field i { position: absolute; left: 15px; top: 38px; color: #94a3b8; transition: 0.3s; }
        .input-style:focus + i { color: #0ea5e9; }

        .btn-main {
            width: 100%; background: #0ea5e9; color: white; border: none; padding: 14px;
            border-radius: 10px; font-weight: 600; font-size: 1rem; cursor: pointer;
            transition: 0.3s; margin-top: 10px;
        }
        .btn-main:hover { background: #0284c7; transform: translateY(-2px); box-shadow: 0 5px 15px rgba(14, 165, 233, 0.3); }

        .msg { display: block; margin-top: 1rem; text-align: center; font-size: 0.9rem; font-weight: 500; }

        .links { margin-top: 2rem; text-align: center; font-size: 0.9rem; color: #64748b; }
        .links a { color: #0ea5e9; font-weight: 600; text-decoration: none; padding-left: 5px; }
        .links a:hover { text-decoration: underline; }
    </style>
</head>

<body>
<form id="form1" runat="server" class="container">

    <div class="brand-side">
        <i class="fas fa-user-plus" style="font-size: 3.5rem; margin-bottom: 2rem; color: #0ea5e9;"></i>
        <h1>Join the Digital <br />Governance.</h1>
        <p>Registering takes less than a minute. Gain access to transparent grievance tracking and direct communication with departments.</p>
        
        <div class="feature-item"><i class="fas fa-check-circle"></i> Instant Ticket Generation</div>
        <div class="feature-item"><i class="fas fa-check-circle"></i> SMS & Email Status Updates</div>
        <div class="feature-item"><i class="fas fa-check-circle"></i> 24/7 Portal Access</div>
    </div>

    <div class="form-side">
        <div class="card">
            <h2 style="margin: 0 0 0.5rem 0; color: #0f172a; font-size: 1.6rem;">Citizen Registration</h2>
            <p style="color: #64748b; margin-bottom: 2rem; font-size: 0.95rem;">Enter your details to create a secure account</p>

            <div class="field">
                <label>Full Name</label>
                <asp:TextBox ID="txtFullName" runat="server" CssClass="input-style" placeholder="John Doe" />
                <i class="fas fa-user"></i>
            </div>

            <div class="field">
                <label>Username</label>
                <asp:TextBox ID="txtUsername" runat="server" CssClass="input-style" placeholder="johndoe22" />
                <i class="fas fa-id-card"></i>
            </div>

            <div class="field">
                <label>Email</label>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="input-style" placeholder="johndoe22@gmail.com" />
                <i class="fas fa-id-card"></i>
            </div>

            <div class="field">
                <label>Secure Password</label>
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="input-style" placeholder="••••••••" />
                <i class="fas fa-lock"></i>
            </div>

            <asp:Button ID="btnRegister" runat="server" Text="Create My Account" CssClass="btn-main"
                OnClick="btnRegister_Click" />

            <asp:Label ID="lblMessage" runat="server" CssClass="msg" />

            <div class="links">
                Already a member? <a href="../Login.aspx">Sign in here</a>
            </div>
        </div>
    </div>

</form>
</body>
</html>