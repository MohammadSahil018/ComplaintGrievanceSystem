<%@ Page Language="C#" MasterPageFile="~/Masters/DepartmentMaster.master"
AutoEventWireup="true" CodeFile="PendingComplaints.aspx.cs" Inherits="Department_PendingComplaints" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="page-header">
        <h2><i class="fas fa-exclamation-circle" style="color: #10b981;"></i> Pending Grievances</h2>
        <p style="color: #64748b;">These complaints require immediate attention and status updates.</p>
    </div>

    <asp:GridView ID="gvComplaints" runat="server" AutoGenerateColumns="False" 
        CssClass="modern-grid" EmptyDataText="Great job! No pending complaints found." GridLines="None">
        <Columns>
            <asp:BoundField DataField="ComplaintId" HeaderText="ID" ItemStyle-Font-Bold="true" />
            <asp:BoundField DataField="Subject" HeaderText="Subject" />
            <asp:BoundField DataField="Username" HeaderText="Raised By" />
            <asp:TemplateField HeaderText="Current Status">
                <ItemTemplate>
                    <span class="badge pending">Pending</span>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="CreatedDate" DataFormatString="{0:dd-MMM-yyyy}" HeaderText="Received Date" />
           <asp:HyperLinkField 
    DataNavigateUrlFields="ComplaintId" 
    DataNavigateUrlFormatString="UpdateComplaintStatus.aspx?cid={0}" 
    HeaderText="Action" 
    Text="Take Action"
    ControlStyle-CssClass="btn-gov" />

        </Columns>
    </asp:GridView>
</asp:Content>