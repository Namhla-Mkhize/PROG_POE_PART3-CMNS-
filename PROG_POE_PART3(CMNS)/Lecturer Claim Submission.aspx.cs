using System;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PROG_POE_PART3_CMNS_
{
    public partial class Lecturer_Claim_Submission : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void CalculateFinalPayment(object sender, EventArgs e)
        {
            if (decimal.TryParse(txtHoursWorked.Text.Trim(), out decimal hoursWorked) &&
                decimal.TryParse(txtBaseRate.Text.Trim(), out decimal baseRate))
            {
                decimal finalPayment = hoursWorked * baseRate;
                txtFinalPayment.Text = finalPayment.ToString("F2", CultureInfo.InvariantCulture);
            }
            else
            {
                txtFinalPayment.Text = "";
                ShowMessage("Invalid input. Please enter valid numbers for Hours Worked and Base Rate.", false);
            }
        }

        protected void SubmitClaim_Click(object sender, EventArgs e)
        {
            CalculateFinalPayment(null, null);

            if (string.IsNullOrWhiteSpace(txtFinalPayment.Text))
            {
                ShowMessage("Final payment calculation failed. Check the inputs.", false);
                return;
            }

            string lecturerID = txtLecturerID.Text.Trim();
            string lecturerName = txtLecturerName.Text.Trim();
            string hoursWorked = txtHoursWorked.Text.Trim();
            string baseRate = txtBaseRate.Text.Trim();
            string programCode = txtProgramCode.Text.Trim();
            string moduleName = txtModuleName.Text.Trim();
            string finalPayment = txtFinalPayment.Text;

            string fileName = "";
            string filePath = "";
            if (fileUpload.HasFile)
            {
                fileName = Path.GetFileName(fileUpload.FileName);
                filePath = "~/UploadedFiles/" + fileName;
                fileUpload.SaveAs(Server.MapPath(filePath));
            }

            try
            {
                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connectionString"].ConnectionString))
                {
                    string query = "INSERT INTO Claims_TBL (Lecturer_ID, Lecturer_Name, Hours_Worked, Base_Rate, Program_Code, Module_Name, Final_Payment, FileName, FilePath) " +
                                   "VALUES (@LecturerID, @LecturerName, @HoursWorked, @BaseRate, @ProgramCode, @ModuleName, @FinalPayment, @FileName, @FilePath)";
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@LecturerID", lecturerID);
                        cmd.Parameters.AddWithValue("@LecturerName", lecturerName);
                        cmd.Parameters.AddWithValue("@HoursWorked", hoursWorked);
                        cmd.Parameters.AddWithValue("@BaseRate", baseRate);
                        cmd.Parameters.AddWithValue("@ProgramCode", programCode);
                        cmd.Parameters.AddWithValue("@ModuleName", moduleName);
                        cmd.Parameters.AddWithValue("@FinalPayment", finalPayment);
                        cmd.Parameters.AddWithValue("@FileName", fileName);
                        cmd.Parameters.AddWithValue("@FilePath", filePath);

                        con.Open();
                        cmd.ExecuteNonQuery();
                    }
                }

                ClearFields();
                ShowMessage("Claim submitted successfully!", true);
            }
            catch (Exception ex)
            {
                ShowMessage("Error: " + ex.Message, false);
            }
        }

        private void ClearFields()
        {
            txtLecturerID.Text = "";
            txtLecturerName.Text = "";
            txtHoursWorked.Text = "";
            txtBaseRate.Text = "";
            txtProgramCode.Text = "";
            txtModuleName.Text = "";
            txtFinalPayment.Text = "";
        }

        private void ShowMessage(string message, bool isSuccess)
        {
            lblMessage.Text = message;
            lblMessage.ForeColor = isSuccess ? System.Drawing.Color.Green : System.Drawing.Color.Red;
        }
    }
}

