<%@ Page Language="C#"  MasterPageFile="~/Masters/AdminMaster.master" AutoEventWireup="true" CodeFile="DeptUserManagement.aspx.cs" Inherits="Admin_DeptUserManagement" %>

<asp:Content ID = "Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="page-header>
        <h2>Department Officers</h2>
        <p style="color:#64748b;">Create and manage department login accounts</p>
    </div>
    <div class="glass-card" style="max-width:800px; margin-bottom:25px;">
        <h3 style="margin-top:0;">Create Department Officer</h3>
        
        <div class="form-field">
            <label class="form-label">Full Name</label>
            <asp:TextBox ID="txtFullName" runat="server" CssClass="modern-input"/>
        </div>    

        <div class="form-field">
            <label class="form-label">Username</label>
            <asp:TextBox ID="txtUsername" runat="server" CssClass="modern-input"/>
        </div> 

        <div class="form-field">
            <label class="form-label">Email</label>
            <asp:TextBox ID="txtEmail" runat="server" CssClass="modern-input" />
        </div>

        <div class="form-field">
            <label class="form-label">Password</label>
            <asp:TextBox ID="txtPassword" runat="server" CssClass="modern-input"/>
        </div> 

        <div class="form-field">
            <label class="form-label">Assign Department</label>
            <asp:DropDownList ID="ddlDepartment" runat="server" CssClass="modern-input" />
        </div>

        <div class="margin-top:12px;">
            <asp:Button ID="btnCreate" runat="server" Text="Create Officer" 
            CssClass="btn-gov green-btn" OnClick="btnCreate_Click" />        
        </div>

        <div style="margin-top:12px;">
            <asp:Label ID="lblMessage" runat="server" Font-Bold="true"/>        
        </div>
    </div>

    <div class="glass-card">
        <h3 style="margin-top:0;">Department Officers</h3>
        <asp:GridView ID="gvDeptUsers" runat="server" AutoGenerateColumns="False" 
        CssClass="modern-grid" GridLines="None" 
        EmptyDataText="No department officer created yet."
        OnRowCommand="gvDeptUsers_RowCommand">
            
            <Columns>
                
                <asp:BoundField DataField="UserId" HeaderText="ID" />
                <asp:BoundField DataField="FullName" HeaderText="Name" />
                <asp:BoundField DataField="username" HeaderText="Username" />
                <asp:BoundField DataField="DepartmentName" HeaderText="Department" />
                <asp:TemplateField HeaderText="Active">
                    <ItemTemplate>
                        <%# Convert.ToBoolean(Eval("IsActive")) ? "Yes" : "No" %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Action">
                    <ItemTemplate>
                        <asp:LinkButton ID="btnToggle" runat="server"
                        CommandName="ToggleOfficer" CommandArgument='<%# Eval("UserId") %>'
                        cssClass="link-success">
                            <%# Convert.ToBoolean(Eval("IsActive")) ? "Deactivate" : "Activate" %>
                        </asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                
            </Columns>
        </asp:GridView>
    
    </div>
</asp:Content>
