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
            <button type="button" class="navbar-toggler" data-bs-toggle="collapse" data-bs-target=".navbar-collapse">
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
    </form>
</body>
</html>
 
