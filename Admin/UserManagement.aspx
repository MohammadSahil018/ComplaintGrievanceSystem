<%@ Page Language="C#" MasterPageFile="~/Masters/AdminMaster.master"
 AutoEventWireup="true" CodeFile="UserManagement.aspx.cs" Inherits="Admin_UserManagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="page-header">
        <h2>Identity & Access Management</h2>
        <p>Control system access for Citizens, Department Heads, and Admins.</p>
    </div>

    <asp:GridView ID="gvUsers" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="UserId" CssClass="modern-grid" GridLines="None"
        OnRowCommand="gvUsers_RowCommand">
        <Columns>
            <asp:BoundField DataField="FullName" HeaderText="Full Name" ItemStyle-Font-Bold="true" />
            <asp:BoundField DataField="Username" HeaderText="Login ID" />
            <asp:TemplateField HeaderText="Access Role">
                <ItemTemplate>
                    <span style="font-weight: 600; color: #475569;">
                        <i class="fas fa-user-tag" style="margin-right: 5px; opacity: 0.5;"></i>
                        <%# Eval("Role") %>
                    </span>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="DepartmentName" HeaderText="Department Unit" NullDisplayText="System Wide" />
            <asp:TemplateField HeaderText="Account Status">
                <ItemTemplate>
                    <span class='badge <%# (bool)Eval("IsActive") ? "resolved" : "pending" %>'>
                        <%# (bool)Eval("IsActive") ? "ACTIVE" : "DISABLED" %>
                    </span>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Action">
                <ItemTemplate>
                    <asp:Button ID="btnToggle" runat="server" 
                        Text='<%# (bool)Eval("IsActive") ? "Deactivate" : "Activate" %>' 
                        CommandName="ToggleStatus" 
                        CommandArgument='<%# Container.DataItemIndex %>'
                        CssClass="btn-gov" 
                        style='<%# (bool)Eval("IsActive") ? "background: #64748b;" : "background: #10b981;" %>' />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
</asp:Content>
