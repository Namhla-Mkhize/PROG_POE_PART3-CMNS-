using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PROG_POE_PART3_CMNS_
{
    public partial class Human_Resouurces : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Any logic to execute on page load
        }

        // Generate Report
        protected void GenerateReport_Click(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "SELECT Lecturer_Name, Final_Payment, Date_Submitted FROM Claims_TBL WHERE Manager_Approval = 'Approved'";
                DataTable dt = new DataTable();

                using (SqlDataAdapter da = new SqlDataAdapter(query, con))
                {
                    da.Fill(dt);
                }

                ExportToCSV(dt);
            }
        }

        private void ExportToCSV(DataTable dataTable)
        {
            string fileName = "ApprovedClaims_" + DateTime.Now.ToString("yyyyMMddHHmmss") + ".csv";

            Response.Clear();
            Response.ContentType = "text/csv";
            Response.AddHeader("Content-Disposition", "attachment;filename=" + fileName);

            foreach (DataColumn column in dataTable.Columns)
            {
                Response.Write(column.ColumnName + ",");
            }

            Response.Write("\n");

            foreach (DataRow row in dataTable.Rows)
            {
                foreach (var item in row.ItemArray)
                {
                    Response.Write(item.ToString().Replace(",", " ") + ",");
                }

                Response.Write("\n");
            }

            Response.End();
        }

        // Approved Claims: Editing, Updating, Canceling
        protected void GridViewApprovedClaims_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridViewApprovedClaims.EditIndex = e.NewEditIndex;
            GridViewApprovedClaims.DataBind();
        }

        protected void GridViewApprovedClaims_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = GridViewApprovedClaims.Rows[e.RowIndex];
            int claimId = Convert.ToInt32(GridViewApprovedClaims.DataKeys[e.RowIndex].Value);
            TextBox txtFinalPayment = (TextBox)row.Cells[2].Controls[0]; // Assuming Final Payment is in column 2

            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string updateQuery = "UPDATE Claims_TBL SET Final_Payment = @FinalPayment WHERE Claim_ID = @ClaimID";
                SqlCommand cmd = new SqlCommand(updateQuery, con);
                cmd.Parameters.AddWithValue("@FinalPayment", Convert.ToDecimal(txtFinalPayment.Text));
                cmd.Parameters.AddWithValue("@ClaimID", claimId);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }

            GridViewApprovedClaims.EditIndex = -1;
            GridViewApprovedClaims.DataBind();
        }

        protected void GridViewApprovedClaims_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridViewApprovedClaims.EditIndex = -1;
            GridViewApprovedClaims.DataBind();
        }

        // Lecturer Management: Editing, Updating, Deleting
        protected void GridViewLecturers_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridViewLecturers.EditIndex = e.NewEditIndex;
            GridViewLecturers.DataBind();
        }

        protected void GridViewLecturers_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = GridViewLecturers.Rows[e.RowIndex];
            int lecturerId = Convert.ToInt32(GridViewLecturers.DataKeys[e.RowIndex].Value);

            // Access controls by ID
            TextBox txtLecturerName = (TextBox)row.FindControl("txtLecturerName");
            TextBox txtProgramCode = (TextBox)row.FindControl("txtProgramCode");
            TextBox txtModuleName = (TextBox)row.FindControl("txtModuleName");

            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string updateQuery = "UPDATE Claims_TBL SET Lecturer_Name = @LecturerName, Program_Code = @ProgramCode, Module_Name = @ModuleName WHERE Lecturer_ID = @LecturerID";
                SqlCommand cmd = new SqlCommand(updateQuery, con);
                cmd.Parameters.AddWithValue("@LecturerName", txtLecturerName.Text);
                cmd.Parameters.AddWithValue("@ProgramCode", txtProgramCode.Text);
                cmd.Parameters.AddWithValue("@ModuleName", txtModuleName.Text);
                cmd.Parameters.AddWithValue("@LecturerID", lecturerId);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }

            GridViewLecturers.EditIndex = -1;
            GridViewLecturers.DataBind();
        }

        protected void GridViewLecturers_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridViewLecturers.EditIndex = -1;
            GridViewLecturers.DataBind();
        }

        protected void GridViewLecturers_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int lecturerId = Convert.ToInt32(GridViewLecturers.DataKeys[e.RowIndex].Value);

            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string deleteQuery = "DELETE FROM Lecturers_TBL WHERE Lecturer_ID = @LecturerID";
                SqlCommand cmd = new SqlCommand(deleteQuery, con);
                cmd.Parameters.AddWithValue("@LecturerID", lecturerId);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }

            GridViewLecturers.DataBind();
        }
    }
}