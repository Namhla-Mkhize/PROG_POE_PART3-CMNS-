<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Manager Approval.aspx.cs" Inherits="PROG_POE_PART3_CMNS_.Manager_Approval" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Manager Approval</title> 
    
</head>
<body>
    <form id="form1" runat="server">
        <nav class="navbar navbar-expand-sm navbar-toggleable-sm navbar-dark bg-dark">
            <div class="container">
                <a class="navbar-brand" runat="server" href="~/">Claim Management System</a>
                <button type="button" class="navbar-toggler" data-bs-toggle="collapse" data-bs-target=".navbar-collapse" title="Toggle navigation" aria-controls="navbarSupportedContent"
                    aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse d-sm-inline-flex justify-content-between">
                    <ul class="navbar-nav flex-grow-1">
                        
                        <li class="nav-item"><a class="nav-link" runat="server" href="~/">Home</a></li>
                          <!-- Lecturer Claim Submission Page -->
  <li class="nav-item">
      <a class="nav-link" runat="server" href="~/Lecturer Claim Submission.aspx">Claim Submission</a>
  </li>

  <!-- Claim Status Page -->
  <li class="nav-item">
      <a class="nav-link" runat="server" href="~/Claim Status.aspx">Claim Status</a>
  </li>

  <!-- Coordinator Approval Page -->
  <li class="nav-item">
      <a class="nav-link" runat="server" href="~/Coordinator Approval.aspx">Coordinator Approval</a>
  </li>

  <!-- Manager Approval Page -->
  <li class="nav-item">
      <a class="nav-link" runat="server" href="~/Manager Approval.aspx">Manager Approval</a>
  </li>

  <!-- Human Resources Page -->
  <li class="nav-item">
      <a class="nav-link" runat="server" href="~/Human Resouurces.aspx">HR</a>
  </li>
                    </ul>
                </div>
            </div>
        </nav>
<asp:GridView ID="GridViewManagerApproval" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceManager"
    BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical" OnSelectedIndexChanged="GridViewManagerApproval_SelectedIndexChanged">
    <AlternatingRowStyle BackColor="#DCDCDC" />
    <Columns>
        <asp:BoundField DataField="Claim_ID" HeaderText="Claim ID" />
        <asp:BoundField DataField="Lecturer_ID" HeaderText="Lecturer ID" />
        <asp:BoundField DataField="Lecturer_Name" HeaderText="Lecturer Name" />
        <asp:BoundField DataField="Hours_Worked" HeaderText="Hours Worked" />
        <asp:BoundField DataField="Base_Rate" HeaderText="Base Rate" />
        <asp:BoundField DataField="Program_Code" HeaderText="Program Code" />
        <asp:BoundField DataField="Module_Name" HeaderText="Module Name" />
        <asp:BoundField DataField="FileName" HeaderText="File Name" />
        <asp:BoundField DataField="Coordinator_Approval" HeaderText="Coordinator Approval" />
        <asp:BoundField DataField="Manager_Approval" HeaderText="Manager Approval" />

        <asp:TemplateField>
            <ItemTemplate>
                <asp:Button ID="btnApprove" runat="server" Text="Approve" CommandArgument='<%# Eval("Claim_ID") %>' OnClick="ApproveClaim_Click" />
                <asp:Button ID="btnReject" runat="server" Text="Reject" CommandArgument='<%# Eval("Claim_ID") %>' OnClick="RejectClaim_Click" />
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
    <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
    <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
    <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
    <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
    <SortedAscendingCellStyle BackColor="#F1F1F1" />
    <SortedAscendingHeaderStyle BackColor="#0000A9" />
    <SortedDescendingCellStyle BackColor="#CAC9C9" />
    <SortedDescendingHeaderStyle BackColor="#000065" />
</asp:GridView>

<asp:SqlDataSource ID="SqlDataSourceManager" runat="server"
    ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
    SelectCommand="SELECT [Lecturer_Name], [Base_Rate], [Hours_Worked], [Program_Code], [Final_Payment], [Date_Submitted], [Manager_Approval], [Coordinator_Approval], [Lecturer_ID], [Claim_ID], [Module_Name], [FileName] FROM [Claims_TBL]">
</asp:SqlDataSource>
        
        
    </form>
</body>
</html>

