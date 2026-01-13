<%@ Page Language="C#" MasterPageFile="~/Masters/DepartmentMaster.master"
 AutoEventWireup="true" CodeFile="ComplaintHistory.aspx.cs" Inherits="Department_ComplaintHistory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="page-header">
        <h2>Departmental Record History</h2>
        <p style="color: #64748b;">Complete logs of all resolved and closed grievances.</p>
    </div>

    <asp:GridView ID="gvHistory" runat="server" AutoGenerateColumns="False" 
        CssClass="modern-grid" EmptyDataText="No historical records found." GridLines="None">
        <Columns>
            <asp:BoundField DataField="ComplaintId" HeaderText="ID" ItemStyle-Width="100px" />
            <asp:BoundField DataField="Subject" HeaderText="Subject" />
            <asp:TemplateField HeaderText="Final Status">
                <ItemTemplate>
                    <span class="badge resolved"><%# Eval("CurrentStatus") %></span>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="CreatedDate" DataFormatString="{0:dd-MMM-yyyy}" HeaderText="Closure Date" />
            <asp:HyperLinkField 
    DataNavigateUrlFields="ComplaintId" 
    DataNavigateUrlFormatString="~/User/ComplaintDetails.aspx?cid={0}" 
    HeaderText="View" 
    Text="Full Log"
    ControlStyle-CssClass="link-success" />

        </Columns>
    </asp:GridView>
</asp:Content>