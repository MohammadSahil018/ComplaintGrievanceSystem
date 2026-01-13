<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Unauthorized.aspx.cs" Inherits="Common_Unauthorized" %>

<!DOCTYPE html>
<html>
<head id="Head1" runat="server">
    <title>Access Denied | Smart Gov</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        body { font-family: 'Inter', sans-serif; background: #fff1f2; display: flex; align-items: center; justify-content: center; height: 100vh; margin: 0; }
        .secure-card { background: white; padding: 3rem; border-radius: 16px; box-shadow: 0 10px 25px rgba(244,63,94,0.1); text-align: center; max-width: 450px; border: 1px solid #fecdd3; }
        .icon-box { font-size: 4rem; color: #f43f5e; margin-bottom: 1.5rem; }
        h1 { color: #9f1239; margin: 0 0 1rem 0; font-size: 1.5rem; }
        p { color: #e11d48; line-height: 1.6; margin-bottom: 2rem; font-weight: 500; }
        .btn-back { background: #f43f5e; color: white; text-decoration: none; padding: 12px 24px; border-radius: 8px; font-weight: 600; display: inline-block; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="secure-card">
        <div class="icon-box"><i class="fas fa-user-lock"></i></div>
        <h1>Restricted Access</h1>
        <p>You do not have the necessary administrative privileges to view this high-security section.</p>
        
        <a href="javascript:history.back()" class="btn-back">
            <i class="fas fa-arrow-left"></i> Go Back
        </a>
    </div>
    </form>
</body>
</html>