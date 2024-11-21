using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PROG_POE_PART3_CMNS_
{
    public partial class Claim_Status : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Refresh GridViewStatus on initial page load
                RefreshGridView();
            }
        }

        // Method to refresh GridViewStatus
        private void RefreshGridView()
        {
            GridViewStatus.DataBind();
        }

        protected void GridViewStatus_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Additional behavior when a row is selected, if needed
        }
    }

}