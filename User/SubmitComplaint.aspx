<%@ Page Language="C#"
    MasterPageFile="~/Masters/UserMaster.master"
    AutoEventWireup="true"
    CodeFile="SubmitComplaint.aspx.cs"
    Inherits="User_SubmitComplaint" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="page-header">
        <h2>Submit New Grievance</h2>
        <p style="color: #64748b;">Please fill in the details below to lodge your complaint.</p>
    </div>

    <div style="max-width: 550px; background: #ffffff; padding: 30px; border-radius: 16px; border: 1px solid #e2e8f0;">
        <div class="form-field" style="margin-bottom: 20px;">
            <label class="form-label" style="font-weight: 600; color: #334155;">Target Department</label>
            <asp:DropDownList ID="ddlDepartment" runat="server" CssClass="modern-input" />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ControlToValidate="ddlDepartment" Display="Dynamic" 
                ErrorMessage="⚠ Select a department" ForeColor="#ef4444" font-size="Small"></asp:RequiredFieldValidator>
        </div>

        <div class="form-field" style="margin-bottom: 20px;">
            <label class="form-label" style="font-weight: 600; color: #334155;">Subject of Grievance</label>
            <asp:TextBox ID="txtSubject" runat="server" CssClass="modern-input" placeholder="e.g. Broken street light in Block C" />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                ControlToValidate="txtSubject" Display="Dynamic" 
                ErrorMessage="⚠ Subject required" ForeColor="#ef4444" font-size="Small"></asp:RequiredFieldValidator>
        </div>

        <div class="form-field" style="margin-bottom: 25px;">
            <label class="form-label" style="font-weight: 600; color: #334155;">Detailed Description</label>
            <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" Rows="5" 
                CssClass="modern-input" placeholder="Provide as much detail as possible to help us resolve this quickly..." />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                ControlToValidate="txtDescription" Display="Dynamic" 
                ErrorMessage="⚠ Description required" ForeColor="#ef4444" font-size="Small"></asp:RequiredFieldValidator>
        </div>

        <div>
            <asp:Button ID="btnSubmit" runat="server" Text="Lodge Complaint" 
                CssClass="btn-gov" style="width: 100%; padding: 14px; border-radius: 10px;" OnClick="btnSubmit_Click" />
        </div>

        <div style="margin-top: 20px; text-align: center;">
            <asp:Label ID="lblMessage" runat="server" font-bold="true" />
        </div>
    </div>
</asp:Content>