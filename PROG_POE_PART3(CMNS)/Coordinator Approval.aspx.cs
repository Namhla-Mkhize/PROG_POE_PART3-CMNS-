using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PROG_POE_PART3_CMNS_
{

    public partial class Coordinator_Approval : Page
    {
     protected void Page_Load(object sender, EventArgs e)
{
    if (!IsPostBack)
    {
        // Any initialization code can go here
    }
}

protected void ApproveClaim_Click(object sender, EventArgs e)
{
    string claimID = ((Button)sender).CommandArgument;

    // Fetch claim details
    if (ValidateClaimDetails(claimID))
    {
        UpdateClaimStatus(claimID, "Coordinator_Approval", "Approved");
        Response.Redirect(Request.RawUrl); // Refresh the page
    }
    else
    {
        // Display error message (optional)
        ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Claim validation failed. Check claim details.');", true);
    }
}

protected void RejectClaim_Click(object sender, EventArgs e)
{
    string claimID = ((Button)sender).CommandArgument;
    UpdateClaimStatus(claimID, "Coordinator_Approval", "Rejected");
    Response.Redirect(Request.RawUrl); // Refresh the page
}

private void UpdateClaimStatus(string claimID, string approvalField, string status)
{
    string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

    using (SqlConnection con = new SqlConnection(connectionString))
    {
        string query = $"UPDATE Claims_TBL SET {approvalField} = @Status WHERE Claim_ID = @ClaimID";
        using (SqlCommand cmd = new SqlCommand(query, con))
        {
            cmd.Parameters.AddWithValue("@Status", status);
            cmd.Parameters.AddWithValue("@ClaimID", claimID);

            con.Open();
            cmd.ExecuteNonQuery();
        }
    }
}

private bool ValidateClaimDetails(string claimID)
{
    string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

    using (SqlConnection con = new SqlConnection(connectionString))
    {
        string query = "SELECT Hours_Worked, Base_Rate, FileName FROM Claims_TBL WHERE Claim_ID = @ClaimID";
        using (SqlCommand cmd = new SqlCommand(query, con))
        {
            cmd.Parameters.AddWithValue("@ClaimID", claimID);

            con.Open();
            using (SqlDataReader reader = cmd.ExecuteReader())
            {
                if (reader.Read())
                {
                    // Reading data as decimal
                    decimal hoursWorked = reader.IsDBNull(0) ? 0 : reader.GetDecimal(0);
                    decimal baseRate = reader.IsDBNull(1) ? 0 : reader.GetDecimal(1);
                    string fileName = reader.IsDBNull(2) ? string.Empty : reader.GetString(2);

                    // Example validation logic
                    if (hoursWorked > 0 && baseRate > 0)
                    {
                        return true; // Validation successful
                    }
                }
            }
        }
    }

    return false; // Validation failed
}

protected void GridViewCoordinatorApproval_SelectedIndexChanged(object sender, EventArgs e)
{
    // Handle any selection-related logic here (if needed)
}

protected void GridViewCoordinatorApproval_SelectedIndexChanged1(object sender, EventArgs e)
{
    // Additional selection logic (if required)
}
    }
}
