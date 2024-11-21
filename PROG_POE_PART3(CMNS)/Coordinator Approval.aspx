<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Coordinator Approval.aspx.cs" Inherits="PROG_POE_PART3_CMNS_.Coordinator_Approval" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Coordinator Approval</title>
</head>
<body>
    <form id="form1" runat="server">
        <nav class="navbar navbar-expand-sm navbar-dark bg-dark">
            <div class="container">
                <a class="navbar-brand" runat="server" href="~/">Claim Management System</a>
                <button type="button" class="navbar-toggler" data-bs-toggle="collapse" data-bs-target=".navbar-collapse" title="Toggle navigation" aria-controls="navbarSupportedContent"
                    aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse d-sm-inline-flex justify-content-between">
                    <ul class="navbar-nav flex-grow-1">
                        <li class="nav-item"><a class="nav-link" runat="server" href="~/">Home</a></li>
                        <li class="nav-item"><a class="nav-link" runat="server" href="~/Lecturer Claim Submission.aspx">Claim Submission</a></li>
                        <li class="nav-item"><a class="nav-link" runat="server" href="~/Claim Status.aspx">Claim Status</a></li>
                        <li class="nav-item"><a class="nav-link" runat="server" href="~/Coordinator Approval.aspx">Coordinator Approval</a></li>
                        <li class="nav-item"><a class="nav-link" runat="server" href="~/Manager Approval.aspx">Manager Approval</a></li>
                        <li class="nav-item"><a class="nav-link" runat="server" href="~/Human Resouurces.aspx">HR</a></li>
                    </ul>
                </div>
            </div>
        </nav>

        <asp:GridView ID="GridViewCoordinatorApproval" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceCoordinator"
            BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical">
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
        </asp:GridView>

        <asp:SqlDataSource ID="SqlDataSourceCoordinator" runat="server"
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
            SelectCommand="SELECT [Lecturer_ID], [Lecturer_Name], [Hours_Worked], [Base_Rate], [Coordinator_Approval], [Manager_Approval], [Date_Submitted], [Claim_ID], [Final_Payment], [FileName], [Module_Name], [Program_Code] FROM [Claims_TBL]">
        </asp:SqlDataSource>
    </form>
</body>
</html>
