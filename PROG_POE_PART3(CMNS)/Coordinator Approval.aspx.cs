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
            UpdateClaimStatus(claimID, "Coordinator_Approval", "Approved");

            // Optionally, refresh the GridView or redirect to the current page
            Response.Redirect(Request.RawUrl);
        }

        protected void RejectClaim_Click(object sender, EventArgs e)
        {
            string claimID = ((Button)sender).CommandArgument;
            UpdateClaimStatus(claimID, "Coordinator_Approval", "Rejected");

            // Optionally, refresh the GridView or redirect to the current page
            Response.Redirect(Request.RawUrl);
        }

        private void UpdateClaimStatus(string claimID, string approvalField, string status)
        {
            // Accessing connection string from Web.config
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

        protected void GridViewCoordinatorApproval_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Handle any selection-related logic here (if needed)
        }
    }
}