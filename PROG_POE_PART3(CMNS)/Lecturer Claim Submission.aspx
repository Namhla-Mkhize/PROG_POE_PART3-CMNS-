<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Lecturer Claim Submission.aspx.cs" Inherits="PROG_POE_PART3_CMNS_.Lecturer_Claim_Submission" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Lecturer Claim Submission</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
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
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
        </div>
        <table class="table">
            <tr>
                <td colspan="2"><strong>Lecturer Claim Submission</strong></td>
            </tr>
            <tr>
                <td>Lecturer ID</td>
                <td><asp:TextBox ID="txtLecturerID" runat="server" Width="200px"></asp:TextBox></td>
            </tr>
            <tr>
                <td>Lecturer Name</td>
                <td><asp:TextBox ID="txtLecturerName" runat="server" Width="200px"></asp:TextBox></td>
            </tr>
            <tr>
                <td>Hours Worked</td>
                <td><asp:TextBox ID="txtHoursWorked" runat="server" Width="200px" AutoPostBack="True" OnTextChanged="CalculateFinalPayment"></asp:TextBox></td>
            </tr>
            <tr>
                <td>Base Rate</td>
                <td><asp:TextBox ID="txtBaseRate" runat="server" Width="200px" AutoPostBack="True" OnTextChanged="CalculateFinalPayment"></asp:TextBox></td>
            </tr>
            <tr>
                <td>Program Code</td>
                <td><asp:TextBox ID="txtProgramCode" runat="server" Width="200px"></asp:TextBox></td>
            </tr>
            <tr>
                <td>Module Name</td>
                <td><asp:TextBox ID="txtModuleName" runat="server" Width="200px"></asp:TextBox></td>
            </tr>
            <tr>
                <td>Final Payment</td>
                <td><asp:TextBox ID="txtFinalPayment" runat="server" Width="200px" ReadOnly="True"></asp:TextBox></td>
            </tr>
            <tr>
                <td>Select File</td>
                <td><asp:FileUpload ID="fileUpload" runat="server" /></td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Button ID="btnSubmit" runat="server" BackColor="Green" ForeColor="White" Text="Submit" OnClick="SubmitClaim_Click" Width="150px" />
                </td>
            </tr>
        </table>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            SelectCommand="SELECT [Lecturer_ID], [Lecturer_Name], [Hours_Worked], [Base_Rate], [Program_Code], [Module_Name], [Final_Payment], [FileName], [FilePath] FROM [Claims_TBL]" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"></asp:SqlDataSource>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" GridLines="Vertical" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
            <AlternatingRowStyle BackColor="#DCDCDC" />
            <Columns>
                <asp:BoundField DataField="Lecturer_ID" HeaderText="Lecturer_ID" SortExpression="Lecturer_ID" />
                <asp:BoundField DataField="Lecturer_Name" HeaderText="Lecturer_Name" SortExpression="Lecturer_Name" />
                <asp:BoundField DataField="Hours_Worked" HeaderText="Hours_Worked" SortExpression="Hours_Worked" />
                <asp:BoundField DataField="Base_Rate" HeaderText="Base_Rate" SortExpression="Base_Rate" />
                <asp:BoundField DataField="Program_Code" HeaderText="Program_Code" SortExpression="Program_Code" />
                <asp:BoundField DataField="Module_Name" HeaderText="Module_Name" SortExpression="Module_Name" />
                <asp:BoundField DataField="Final_Payment" HeaderText="Final_Payment" SortExpression="Final_Payment" />
                <asp:BoundField DataField="FileName" HeaderText="FileName" SortExpression="FileName" />
                <asp:BoundField DataField="FilePath" HeaderText="FilePath" SortExpression="FilePath" />
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
    </form>
</body>
</html>
 
