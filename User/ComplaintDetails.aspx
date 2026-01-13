<%@ Page Language="C#" MasterPageFile="~/Masters/CommonMaster.master" AutoEventWireup="true"
    CodeFile="ComplaintDetails.aspx.cs" Inherits="User_ComplaintDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="page-header">
        <h2>Tracking Complaint: #<asp:Label ID="lblComplaintId" runat="server"></asp:Label></h2>
    </div>

    <div class="details-container">
        <div class="detail-item">
            <span class="detail-label">Subject</span>
            <span class="detail-value"><asp:Label ID="lblSubject" runat="server"></asp:Label></span>
        </div>
        <div class="detail-item">
            <span class="detail-label">Department</span>
            <span class="detail-value"><asp:Label ID="lblDepartment" runat="server"></asp:Label></span>
        </div>
        <div class="detail-item" style="grid-column: span 2;">
            <span class="detail-label">Description</span>
            <span class="detail-value"><asp:Label ID="lblDescription" runat="server"></asp:Label></span>
        </div>
        <div class="detail-item">
            <span class="detail-label">Current Status</span>
            <asp:Label ID="lblStatus" runat="server" CssClass="badge"></asp:Label>
        </div>
        <div class="detail-item">
            <span class="detail-label">Lodged On</span>
            <span class="detail-value"><asp:Label ID="lblDate" runat="server"></asp:Label></span>
        </div>
    </div>

    <hr class="hr-fade" />

    <h3 style="font-size: 1.1rem; color: #1e293b; margin-bottom: 15px;">Resolution Timeline</h3>
    <asp:GridView ID="gvHistory" runat="server" AutoGenerateColumns="False" 
        CssClass="modern-grid" EmptyDataText="No history found" GridLines="None">
        <Columns>
            <asp:BoundField DataField="Status" HeaderText="Status Update" />
            <asp:BoundField DataField="Remark" HeaderText="Remarks/Comments" />
            <asp:BoundField DataField="ChangedDate" DataFormatString="{0:dd-MMM-yyyy HH:mm}" HeaderText="Date & Time" />
        </Columns>
    </asp:GridView>

    <asp:Label ID="lblError" runat="server" ForeColor="#ef4444" style="display:block; margin-top:10px;"></asp:Label>
</asp:Content>