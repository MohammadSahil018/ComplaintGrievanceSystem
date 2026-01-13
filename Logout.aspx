<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Logout.aspx.cs" Inherits="Logout" %>

<!DOCTYPE html>
<html>
<head id="Head1" runat="server">
    <title>Logged Out | Smart Gov</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        body { font-family: 'Inter', sans-serif; background: #f8fafc; display: flex; align-items: center; justify-content: center; height: 100vh; margin: 0; }
        .logout-box { text-align: center; background: white; padding: 4rem; border-radius: 20px; box-shadow: 0 10px 40px rgba(0,0,0,0.03); border: 1px solid #e2e8f0; }
        .icon { font-size: 4rem; color: #10b981; margin-bottom: 1.5rem; }
        h1 { color: #0f172a; margin-bottom: 1rem; }
        p { color: #64748b; margin-bottom: 2rem; }
        .btn-link { color: #0ea5e9; text-decoration: none; font-weight: 600; border: 2px solid #0ea5e9; padding: 10px 20px; border-radius: 8px; transition: 0.3s; }
        .btn-link:hover { background: #0ea5e9; color: white; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="logout-box">
        <div class="icon"><i class="fas fa-check-circle"></i></div>
        <h1>Successfully Signed Out</h1>
        <p>Your session has been securely closed. Thank you for using the portal.</p>
        <a href="Login.aspx" class="btn-link">Login Again</a>
    </div>
    </form>
</body>
</html>