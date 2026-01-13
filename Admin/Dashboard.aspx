<%@ Page Language="C#"
    MasterPageFile="~/Masters/AdminMaster.master"
    AutoEventWireup="true"
    CodeFile="Dashboard.aspx.cs"
    Inherits="Admin_Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="page-header">
        <h2>System Executive Overview</h2>
        <p style="color: #64748b;">Real-time metrics across all departments.</p>
    </div>

    <div style="display: flex; gap: 20px; margin-bottom: 30px;">
        <div class="glass-card" style="flex: 1; border-top: 4px solid #f43f5e; text-align: center;">
            <span class="detail-label">Overall Volume</span>
            <h1 style="font-size: 2.5rem; margin: 10px 0;"><asp:Label ID="lblTotal" runat="server" /></h1>
            <p style="margin: 0; font-weight: 600; color: #1e293b;">Total Complaints</p>
        </div>
        <div class="glass-card" style="flex: 1; border-top: 4px solid #f59e0b; text-align: center;">
            <span class="detail-label">Action Required</span>
            <h1 style="font-size: 2.5rem; margin: 10px 0; color: #f59e0b;"><asp:Label ID="lblPending" runat="server" /></h1>
            <p style="margin: 0; font-weight: 600; color: #1e293b;">Active / Pending</p>
        </div>
        <div class="glass-card" style="flex: 1; border-top: 4px solid #10b981; text-align: center;">
            <span class="detail-label">Resolution Rate</span>
            <h1 style="font-size: 2.5rem; margin: 10px 0; color: #10b981;"><asp:Label ID="lblResolved" runat="server" /></h1>
            <p style="margin: 0; font-weight: 600; color: #1e293b;">Successfully Closed</p>
        </div>
    </div>

    <div class="glass-card">
        <h3 style="margin-top: 0; border-bottom: 1px solid #f1f5f9; padding-bottom: 15px;">
            <i class="fas fa-chart-bar" style="color: #f43f5e; margin-right: 10px;"></i>Department Distribution
        </h3>
        <asp:GridView ID="gvDeptSummary" runat="server" AutoGenerateColumns="False" 
            CssClass="modern-grid" EmptyDataText="No department data available" GridLines="None">
            <Columns>
                <asp:BoundField DataField="DepartmentName" HeaderText="Department Unit" ItemStyle-Font-Bold="true" />
                <asp:BoundField DataField="TotalComplaints" HeaderText="Total Tickets" ItemStyle-HorizontalAlign="Center" />
                <asp:TemplateField HeaderText="Load Status">
                    <ItemTemplate>
                        <div style="width: 100px; background: #e2e8f0; height: 8px; border-radius: 4px; overflow: hidden;">
                            <div style='width: 70%; background: #f43f5e; height: 100%;'></div>
                        </div>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>