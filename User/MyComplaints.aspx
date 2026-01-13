<%@ Page Language="C#" MasterPageFile="~/Masters/UserMaster.master" AutoEventWireup="true" CodeFile="MyComplaints.aspx.cs" Inherits="User_UpdateComplaints" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="page-header">
        <h2>My Complaints</h2>
    </div>

    <asp:GridView ID="gvComplaints" runat="server" AutoGenerateColumns="False" 
        CssClass="modern-grid" EmptyDataText="No Complaints found" GridLines="None">
        <Columns>
            <asp:BoundField DataField="ComplaintId" HeaderText="ID" ItemStyle-Font-Bold="true" />
            <asp:BoundField DataField="Subject" HeaderText="Subject" />
            <asp:BoundField DataField="DepartmentName" HeaderText="Department" />
            <asp:TemplateField HeaderText="Status">
                <ItemTemplate>
                    <span class='badge <%# Eval("CurrentStatus").ToString().Replace(" ", "").ToLower() %>'>
                        <%# Eval("CurrentStatus") %>
                    </span>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="CreatedDate" HeaderText="Date" DataFormatString="{0:dd-MMM-yyyy}" />

            <asp:HyperLinkField DataNavigateUrlFields="ComplaintId" 
                DataNavigateUrlFormatString="ComplaintDetails.aspx?cid={0}" 
                Text="View Tracking" ControlStyle-CssClass="nav-link" 
                />
        </Columns>
    </asp:GridView>
</asp:Content>