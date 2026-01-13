<%@ Page Language="C#" MasterPageFile="~/Masters/UserMaster.master"
    AutoEventWireup="true" CodeFile="Profile.aspx.cs" Inherits="User_Profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="page-header">
        <h2>My Profile</h2>
        <p style="color:#64748b;">View and manage your personal details.</p>
    </div>

    <div style="max-width: 700px;">

        <div class="glass-card">

            <!-- VIEW PANEL -->
            <asp:Panel ID="pnlView" runat="server">

                <div class="details-container">
                    <div class="detail-item">
                        <span class="detail-label">Full Name</span>
                        <span class="detail-value"><asp:Label ID="lblFullName" runat="server" /></span>
                    </div>

                    <div class="detail-item">
                        <span class="detail-label">Username</span>
                        <span class="detail-value"><asp:Label ID="lblUsername" runat="server" /></span>
                    </div>

                    <div class="detail-item">
                        <span class="detail-label">Email</span>
                        <span class="detail-value"><asp:Label ID="lblEmail" runat="server" /></span>
                    </div>
                </div>

                <div class="action-links">
                    <asp:Button ID="btnEdit" runat="server" Text="Edit Profile"
                        CssClass="btn-gov green-btn" OnClick="btnEdit_Click" />

                    <asp:Button ID="btnShowPassword" runat="server" Text="Change Password"
                        CssClass="btn-gov gray-btn" OnClick="btnShowPassword_Click" />
                </div>

            </asp:Panel>

            <!-- EDIT PANEL -->
            <asp:Panel ID="pnlEdit" runat="server" Visible="false">

                <div class="form-field">
                    <label class="form-label">Full Name</label>
                    <asp:TextBox ID="txtFullName" runat="server" CssClass="modern-input" />
                </div>

                <div class="form-field">
                    <label class="form-label">Username</label>
                    <asp:TextBox ID="txtUsername" runat="server" CssClass="modern-input" ReadOnly="true" />
                    <small style="color:#64748b;">Username cannot be changed.</small>
                </div>

                <div class="form-field">
                    <label class="form-label">Email</label>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="modern-input" ReadOnly="true" />
                    <small style="color:#64748b;">Email cannot be changed.</small>
                </div>

                <div class="action-links">
                    <asp:Button ID="btnSave" runat="server" Text="Save Changes"
                        CssClass="btn-gov green-btn" OnClick="btnSave_Click" />

                    <asp:Button ID="btnCancel" runat="server" Text="Cancel"
                        CssClass="btn-gov gray-btn" OnClick="btnCancel_Click" />
                </div>

            </asp:Panel>

            <!-- CHANGE PASSWORD PANEL -->
            <asp:Panel ID="pnlPassword" runat="server" Visible="false" style="margin-top:20px;">

                <hr class="hr-fade" />
                <h3 style="margin-top:0;">Change Password</h3>

                <div class="form-field">
                    <label class="form-label">New Password</label>
                    <asp:TextBox ID="txtNewPassword" runat="server" CssClass="modern-input" TextMode="Password" />
                </div>

                <div class="form-field">
                    <label class="form-label">Confirm Password</label>
                    <asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="modern-input" TextMode="Password" />
                </div>

                <div class="action-links">
                    <asp:Button ID="btnUpdatePassword" runat="server" Text="Update Password"
                        CssClass="btn-gov red-btn" OnClick="btnUpdatePassword_Click" />

                    <asp:Button ID="btnCancelPassword" runat="server" Text="Cancel"
                        CssClass="btn-gov gray-btn" OnClick="btnCancelPassword_Click" />
                </div>

            </asp:Panel>

            <div style="margin-top: 15px;">
                <asp:Label ID="lblMessage" runat="server" Font-Bold="true" />
            </div>

        </div>
    </div>

</asp:Content>
