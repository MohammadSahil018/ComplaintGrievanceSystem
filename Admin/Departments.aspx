<%@ Page Language="C#" MasterPageFile="~/Masters/AdminMaster.master"
    AutoEventWireup="true" CodeFile="Departments.aspx.cs"
    Inherits="Admin_Departments" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="page-header">
        <h2>Manage Departments</h2>
        <p style="color:#64748b;">Add and control departments (master registry)</p>
    </div>

    <!-- ADD DEPARTMENT -->
    <div class="glass-card" style="max-width:750px; margin-bottom:25px;">
        <h3 style="margin-top:0;">Add Department</h3>

        <div class="form-field">
            <label class="form-label">Department Name</label>
            <asp:TextBox ID="txtDepartmentName" runat="server" CssClass="modern-input"
                placeholder="e.g., Electricity, Road, Transport" />
        </div>

        <div style="margin-top:12px;">
            <asp:Button ID="btnAdd" runat="server" Text="Add Department"
                CssClass="btn-gov green-btn" OnClick="btnAdd_Click" />
        </div>

        <div style="margin-top:12px;">
            <asp:Label ID="lblMessage" runat="server" Font-Bold="true" />
        </div>
    </div>

    <!-- LIST ALL DEPARTMENTS -->
    <div class="glass-card">
        <h3 style="margin-top:0;">Department List</h3>

        <asp:GridView ID="gvDepartments" runat="server"
            AutoGenerateColumns="False"
            CssClass="modern-grid"
            GridLines="None"
            EmptyDataText="No departments created yet."
            OnRowCommand="gvDepartments_RowCommand">

            <Columns>

                <asp:BoundField DataField="DepartmentId" HeaderText="ID" />

                <asp:BoundField DataField="DepartmentName" HeaderText="Department" />

                <asp:TemplateField HeaderText="Active">
                    <ItemTemplate>
                        <%# Convert.ToBoolean(Eval("IsActive")) ? "Yes" : "No" %>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:BoundField DataField="CreatedDate" HeaderText="Created"
                    DataFormatString="{0:dd-MMM-yyyy}" />

                <asp:TemplateField HeaderText="Action">
                    <ItemTemplate>
                        <asp:LinkButton ID="btnToggle" runat="server"
                            CommandName="ToggleActive"
                            CommandArgument='<%# Eval("DepartmentId") %>'
                            CssClass="link-success">
                            <%# Convert.ToBoolean(Eval("IsActive")) ? "Deactivate" : "Activate" %>
                        </asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>

            </Columns>

        </asp:GridView>
    </div>

</asp:Content>
