<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Human Resouurces.aspx.cs" Inherits="PROG_POE_PART3_CMNS_.Human_Resouurces" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>HR Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">Claim Management System</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav">
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
                        <li class="nav-item">
                            <a class="nav-link active" href="~/HRFeature.aspx">HR Dashboard</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        
        <div class="container mt-4">
            <h2>HR Dashboard</h2>
            <hr />

            <!-- Approved Claims Section -->
            <h4>Approved Claims</h4>
            <asp:GridView ID="GridViewApprovedClaims" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceApprovedClaims"
                CssClass="table table-striped table-hover" DataKeyNames="Claim_ID" 
                OnRowEditing="GridViewApprovedClaims_RowEditing" 
                OnRowUpdating="GridViewApprovedClaims_RowUpdating" 
                OnRowCancelingEdit="GridViewApprovedClaims_RowCancelingEdit" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical">
                <AlternatingRowStyle BackColor="#DCDCDC" />
                <Columns>
                    <asp:BoundField DataField="Claim_ID" HeaderText="Claim ID" ReadOnly="True" />
                    <asp:BoundField DataField="Lecturer_Name" HeaderText="Lecturer Name" ReadOnly="True" />
                    <asp:BoundField DataField="Final_Payment" HeaderText="Final Payment" />
                    <asp:BoundField DataField="Date_Submitted" HeaderText="Date Submitted" ReadOnly="True" />
                    <asp:CommandField ShowEditButton="True" />
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
            <asp:SqlDataSource ID="SqlDataSourceApprovedClaims" runat="server"
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                SelectCommand="SELECT [Claim_ID], [Lecturer_Name], [Final_Payment], [Date_Submitted] FROM [Claims_TBL]">
            </asp:SqlDataSource>
            <asp:Button ID="btnGenerateReport" runat="server" Text="Generate Report" CssClass="btn btn-primary" OnClick="GenerateReport_Click" />

            <hr />

            <!-- Lecturer Management Section -->
          <h4>Lecturer Management</h4>
<asp:GridView ID="GridViewLecturers" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceLecturers"
    CssClass="table table-striped table-hover" DataKeyNames="Lecturer_ID"
    OnRowEditing="GridViewLecturers_RowEditing" 
    OnRowUpdating="GridViewLecturers_RowUpdating" 
    OnRowCancelingEdit="GridViewLecturers_RowCancelingEdit"
    OnRowDeleting="GridViewLecturers_RowDeleting" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical">
    <AlternatingRowStyle BackColor="#DCDCDC" />
    <Columns>
        <asp:TemplateField HeaderText="Lecturer Name">
            <EditItemTemplate>
                <asp:TextBox ID="txtLecturerName" runat="server" Text='<%# Bind("Lecturer_Name") %>' />
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="lblLecturerName" runat="server" Text='<%# Bind("Lecturer_Name") %>' />
            </ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Program Code">
            <EditItemTemplate>
                <asp:TextBox ID="txtProgramCode" runat="server" Text='<%# Bind("Program_Code") %>' />
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="lblProgramCode" runat="server" Text='<%# Bind("Program_Code") %>' />
            </ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Module Name">
            <EditItemTemplate>
                <asp:TextBox ID="txtModuleName" runat="server" Text='<%# Bind("Module_Name") %>' />
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="lblModuleName" runat="server" Text='<%# Bind("Module_Name") %>' />
            </ItemTemplate>
        </asp:TemplateField>

        <asp:CommandField ShowEditButton="True" />
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

<asp:SqlDataSource ID="SqlDataSourceLecturers" runat="server"
    ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
    SelectCommand="SELECT [Lecturer_Name], [Program_Code], [Module_Name], [Lecturer_ID] FROM [Claims_TBL]">
</asp:SqlDataSource>
            
        </div>
    </form>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>