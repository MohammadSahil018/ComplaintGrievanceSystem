<%@ Page Language="C#" MasterPageFile="~/Masters/AdminMaster.master"
AutoEventWireup="true" CodeFile="AllComplaints.aspx.cs" Inherits="Admin_AllComplaints" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="page-header" style="margin-bottom: 25px;">
        <h2 style="color: #0f172a; font-size: 1.5rem; margin-bottom: 5px;">Master Complaint Registry</h2>
        <p style="color: #64748b; margin: 0;">Complete oversight of all grievances submitted across all departments.</p>
    </div>

    <div class="glass-card" style="overflow-x: auto;">
        <asp:GridView ID="gvComplaints" runat="server" AutoGenerateColumns="False" 
            CssClass="modern-grid" GridLines="None" Width="100%"
            EmptyDataText="No complaints have been recorded in the system yet.">
            
            <HeaderStyle BackColor="#f8fafc" ForeColor="#64748b" Font-Bold="true" />
            
            <Columns>
                <%-- Complaint ID with bold styling --%>
                <asp:BoundField DataField="ComplaintId" HeaderText="ID" ItemStyle-Width="60px" 
                    ItemStyle-Font-Bold="true" ItemStyle-ForeColor="#0f172a" />
                
                <%-- User/Citizen Information --%>
                <asp:BoundField DataField="Username" HeaderText="Citizen Name" />
                
                <%-- Department --%>
                <asp:BoundField DataField="DepartmentName" HeaderText="Assigned Dept" />
                
                <%-- Subject --%>
                <asp:BoundField DataField="Subject" HeaderText="Subject Title" />
                
                <%-- Status with Dynamic Badge Styling --%>
                <asp:TemplateField HeaderText="Status">
                    <ItemTemplate>
                        <span class='badge <%# Eval("CurrentStatus").ToString().ToLower().Replace(" ", "") %>'>
                            <%# Eval("CurrentStatus") %>
                        </span>
                    </ItemTemplate>
                </asp:TemplateField>

                <%-- Date Formatting --%>
                <asp:BoundField DataField="CreatedDate" DataFormatString="{0:dd MMM yyyy}" HeaderText="Date Filed" />
                <%-- Action Link Styled as a clean button/link --%>
                <asp:HyperLinkField DataNavigateUrlFields="ComplaintId" DataNavigateUrlFormatString="~/User/ComplaintDetails.aspx?cid={0}"
                    HeaderText="Audit" Text="View Details" ControlStyle-CssClass="view-link" />
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>