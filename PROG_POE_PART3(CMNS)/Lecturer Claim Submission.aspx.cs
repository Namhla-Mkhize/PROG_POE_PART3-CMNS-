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
            // Use InvariantCulture to handle numeric parsing consistently
            if (decimal.TryParse(txtHoursWorked.Text, System.Globalization.NumberStyles.Any,
                                 System.Globalization.CultureInfo.InvariantCulture, out decimal hoursWorked) &&
                decimal.TryParse(txtBaseRate.Text, System.Globalization.NumberStyles.Any,
                                 System.Globalization.CultureInfo.InvariantCulture, out decimal baseRate))
            {
                // Perform the calculation
                decimal finalPayment = hoursWorked * baseRate;

                // Display the result formatted to two decimal places
                txtFinalPayment.Text = finalPayment.ToString("F2", System.Globalization.CultureInfo.InvariantCulture);
            }
            else
            {
                // Clear the field and show an error message if input is invalid
                txtFinalPayment.Text = "";
                ShowMessage("Enter valid numeric values for hours worked and base rate.", false);
            }
        }

        protected void SubmitClaim_Click(object sender, EventArgs e)
        {
            CalculateFinalPayment(null, null);

            if (string.IsNullOrEmpty(txtFinalPayment.Text))
            {
                ShowMessage("Final payment cannot be calculated. Check inputs.", false);
                return;
            }

            string lecturerID = txtLecturerID.Text;
            string lecturerName = txtLecturerName.Text;
            string hoursWorked = txtHoursWorked.Text;
            string baseRate = txtBaseRate.Text;
            string programCode = txtProgramCode.Text;
            string moduleName = txtModuleName.Text;
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
                        con.Close();
                    }
                }

                ClearFields();
                ShowMessage("Claim submitted successfully!", true);
            }
            catch (Exception ex)
            {
                ShowMessage("Error occurred: " + ex.Message, false);
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

        private void ShowMessage(string message, bool success)
        {
            lblMessage.Text = message;
            lblMessage.ForeColor = success ? System.Drawing.Color.Green : System.Drawing.Color.Red;
        }

        protected void txtProgramCode_TextChanged(object sender, EventArgs e)
        {
        }

        // Add this method to handle the GridView1_SelectedIndexChanged event
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Example: Retrieve selected row data
            GridViewRow selectedRow = GridView1.SelectedRow;
            string lecturerId = selectedRow.Cells[0].Text;
            ShowMessage($"Selected Lecturer ID: {lecturerId}", true);
        }
    }
}
