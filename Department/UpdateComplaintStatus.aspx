<%@ Page Language="C#" MasterPageFile="~/Masters/DepartmentMaster.master" AutoEventWireup="true"
    CodeFile="UpdateComplaintStatus.aspx.cs" Inherits="Department_UpdateComplaintStatus" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="page-header" style="margin-bottom: 2rem;">
        <h2 style="display: flex; align-items: center; gap: 10px;">
            <i class="fas fa-edit" style="color: #10b981;"></i> Update Resolution Status
        </h2>
        <p style="color: #64748b;">Review grievance details and document departmental actions.</p>
    </div>

    <div style="display: grid; grid-template-columns: 1fr; gap: 20px; max-width: 800px;">
        
        <div class="glass-card" style="border-left: 4px solid #10b981; padding: 25px;">
            <div class="details-container" style="display: grid; grid-template-columns: 1fr 1fr; gap: 25px;">
                <div class="detail-item" style="border:none; padding:0;">
                    <span class="detail-label" style="letter-spacing: 0.05em; font-size: 0.75rem;">Complaint Reference</span>
                    <span class="detail-value" style="font-size: 1.2rem; color: #0f172a;">#<asp:Label ID="lblComplaintId" runat="server" /></span>
                </div>
                <div class="detail-item" style="border:none; padding:0; text-align: right;">
                    <span class="detail-label" style="letter-spacing: 0.05em; font-size: 0.75rem;">Status Indicator</span>
                    <div><asp:Label ID="lblCurrentStatus" runat="server" CssClass="badge in_progress" style="font-size: 0.8rem; padding: 6px 14px;" /></div>
                </div>
                <div class="detail-item" style="grid-column: span 2; border-top: 1px solid #f1f5f9; padding-top: 15px;">
                    <span class="detail-label">Grievance Subject</span>
                    <span class="detail-value" style="color: #334155; font-weight: 600;"><asp:Label ID="lblSubject" runat="server" /></span>
                </div>
            </div>
        </div>

        <div class="glass-card" style="padding: 30px;">
            <h3 style="font-size: 1rem; color: #1e293b; margin-bottom: 20px; display: flex; align-items: center; gap: 8px;">
                <i class="fas fa-clipboard-check" style="color: #10b981;"></i> Resolution Form
            </h3>

            <div class="form-field" style="margin-bottom: 20px;">
                <label class="form-label" style="font-weight: 600; color: #475569; font-size: 0.9rem;">
                    Set New Lifecycle Status
                </label>
                <div style="position: relative;">
                    <asp:DropDownList ID="ddlStatus" runat="server" CssClass="modern-input" style="appearance: none; -webkit-appearance: none; padding-right: 40px;">
                        <asp:ListItem Text="IN_PROGRESS" Value="IN_PROGRESS" />
                        <asp:ListItem Text="RESOLVED" Value="RESOLVED" />
                    </asp:DropDownList>
                    <i class="fas fa-chevron-down" style="position: absolute; right: 15px; top: 22px; color: #94a3b8; pointer-events: none;"></i>
                </div>
            </div>

            <div class="form-field" style="margin-bottom: 25px;">
                <label class="form-label" style="font-weight: 600; color: #475569; font-size: 0.9rem;">
                    Officer's Remarks & Internal Notes
                </label>
                <asp:TextBox ID="txtRemark" runat="server" Rows="5" CssClass="modern-input" TextMode="MultiLine" 
                    placeholder="Provide a detailed explanation of the resolution or current progress... (This will be visible to the citizen)" 
                    style="line-height: 1.6; padding: 15px; border: 1px solid #cbd5e1;" />
            </div>

            <div style="display: flex; align-items: center; gap: 15px;">
                <asp:Button ID="btnUpdate" runat="server" Text="Confirm & Update System" CssClass="btn-gov" 
                    style="background: #10b981; flex: 1; padding: 14px; border-radius: 10px; font-weight: 600; border: none; color: white;" 
                    OnClick="btnUpdate_Click" />
                
                <asp:HyperLink ID="HyperLink1" NavigateUrl="~/Department/PendingComplaints.aspx" runat="server" 
                    style="text-decoration: none; color: #64748b; font-size: 0.9rem; font-weight: 600; padding: 0 10px;">
                    Cancel
                </asp:HyperLink>
            </div>

            <div style="margin-top: 20px;">
                <asp:Label ID="lblMessage" runat="server" style="display: block; text-align: center; padding: 10px; border-radius: 8px;" />
            </div>
        </div>
    </div>
</asp:Content>