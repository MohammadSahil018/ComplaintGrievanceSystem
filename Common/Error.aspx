<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Error.aspx.cs" Inherits="Common_Error" %>

<!DOCTYPE html>
<html>
<head id="Head1" runat="server">
    <title>System Error | Smart Gov</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        body { font-family: 'Inter', sans-serif; background: #f8fafc; display: flex; align-items: center; justify-content: center; height: 100vh; margin: 0; }
        .error-card { background: white; padding: 3rem; border-radius: 16px; box-shadow: 0 10px 25px rgba(0,0,0,0.05); text-align: center; max-width: 450px; border: 1px solid #e2e8f0; }
        .icon-box { font-size: 4rem; color: #f59e0b; margin-bottom: 1.5rem; }
        h1 { color: #1e293b; margin: 0 0 1rem 0; font-size: 1.5rem; }
        p { color: #64748b; line-height: 1.6; margin-bottom: 2rem; }
        .btn-home { background: #0f172a; color: white; text-decoration: none; padding: 12px 24px; border-radius: 8px; font-weight: 600; display: inline-block; transition: 0.3s; }
        .btn-home:hover { background: #334155; transform: translateY(-2px); }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="error-card">
        <div class="icon-box"><i class="fas fa-tools"></i></div>
        <h1>Something went wrong</h1>
        <p>We encountered an unexpected technical issue. Our systems have logged this incident. Please try again or return to the dashboard.</p>
        
        <asp:HyperLink ID="lnkBack" runat="server" NavigateUrl="~/Login.aspx" CssClass="btn-home">
            Return to Safety
        </asp:HyperLink>
    </div>
    </form>
</body>
</html>