<%@ Page Language="C#" MasterPageFile="~/Masters/UserMaster.master"
    AutoEventWireup="true" CodeFile="Dashboard.aspx.cs" Inherits="User_Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    
    <div class="page-header">
        <h2>Citizen Dashboard</h2>
        <p>Overview of your grievance activity and resolution progress.</p>
    </div>

    
    <div class="dashboard-cards">

        
        <div class="stat-card blue">
            <i class="fas fa-file-invoice"></i>
            <h4>Total Complaints</h4>
            <h2><asp:Label ID="lblTotal" runat="server" /></h2>
            <span>Lodged by you</span>
        </div>

       
        <div class="stat-card amber">
            <i class="fas fa-clock"></i>
            <h4>Pending</h4>
            <h2><asp:Label ID="lblPending" runat="server" /></h2>
            <span>Under review</span>
        </div>

        
        <div class="stat-card green">
            <i class="fas fa-check-double"></i>
            <h4>Resolved</h4>
            <h2><asp:Label ID="lblResolved" runat="server" /></h2>
            <span>Successfully closed</span>
        </div>

    </div>

    
    <div class="glass-card">
        <h3>Quick Guide</h3>
        <ul class="info-list">
            <li>Submit new grievances using <b>Submit Complaint</b>.</li>
            <li>Track real-time status from <b>My Complaints</b>.</li>
            <li>Departments usually respond within <b>3–5 working days</b>.</li>
        </ul>
    </div>

</asp:Content>
