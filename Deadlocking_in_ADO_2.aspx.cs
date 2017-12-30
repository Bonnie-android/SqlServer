using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


namespace DEADLOCK_ERRORS_ADO
{
    public partial class Deadlocking_in_ADO_2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblStatus.Text = "";
        }

        protected void btn2_Click(object sender, EventArgs e)
        {
            //calls spTransaction2 which updates tblTestB and then tblTestA
            string CS = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
            //put code in TRY CATCH BLOCK to catch errors
         try { 
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("spTransaction2", con);
                cmd.CommandType = CommandType.StoredProcedure;
                con.Open();
                cmd.ExecuteNonQuery();
            }//end using
                lblStatus.ForeColor = System.Drawing.Color.Green;
                lblStatus.Text = "Transaction spTransaction2 was completed successfully";
            }//end try
            catch(SqlException ex)
            {
                string ErrorNumber = ex.Number.ToString();
                string Error = ex.Message;
                string ErrorCode = ex.ErrorCode.ToString();
                lblStatus.ForeColor = System.Drawing.Color.Red;
                lblStatus.Text = "Error Message " + Error + "Error Number" + ErrorNumber + " Error Code " + ErrorCode;
            }//end catch


        }//end btn click
    }
}