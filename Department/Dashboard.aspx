<%@ Page Language="C#" MasterPageFile="~/Masters/DepartmentMaster.master"
    AutoEventWireup="true" CodeFile="Dashboard.aspx.cs" Inherits="Department_Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <!-- Header -->
    <div class="page-header">
        <h2>Department Dashboard</h2>
        <p>Live overview of complaints assigned to your department.</p>
    </div>

    <!-- Stats Cards -->
    <div class="dashboard-cards">

        <!-- Pending -->
        <div class="stat-card green">
            <i class="fas fa-clock"></i>
            <span class="detail-label">Pending</span>
            <h1><asp:Label ID="lblPending" runat="server" /></h1>
            <p>Requires attention</p>
        </div>

        <!-- New Today -->
        <div class="stat-card blue">
            <i class="fas fa-bell"></i>
            <span class="detail-label">New Today</span>
            <h1><asp:Label ID="lblNewToday" runat="server" /></h1>
            <p>Received today</p>
        </div>

        <!-- Resolved -->
        <div class="stat-card gray">
            <i class="fas fa-check-circle"></i>
            <span class="detail-label">Resolved</span>
            <h1><asp:Label ID="lblResolved" runat="server" /></h1>
            <p>Total closed</p>
        </div>

    </div>

    <!-- Quick Links -->
    <div class="glass-card">
        <h3><i class="fas fa-info-circle"></i> Quick Actions</h3>
        <div class="action-links">
            <asp:HyperLink ID="HyperLink1" runat="server"
                NavigateUrl="PendingComplaints.aspx"
                CssClass="btn-gov green-btn"
                Text="Go to Worklist" />

            <asp:HyperLink ID="HyperLink2" runat="server"
                NavigateUrl="ComplaintHistory.aspx"
                CssClass="btn-gov gray-btn"
                Text="View Archive" />
        </div>
    </div>

</asp:Content>
