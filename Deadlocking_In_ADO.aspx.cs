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
    public partial class Deadlocking_In_ADO : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //DBConnectionString
            lblStatus.Text = "";
        }

        protected void btn1_Click(object sender, EventArgs e)
        {

            //Calls spTransaction1 which will update tblTestA and then update tblTestB
           string CS = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;

            //place the code in a TRY CATCH block
            try
            {
                using (SqlConnection con = new SqlConnection(CS))
                {
                    SqlCommand cmd = new SqlCommand("spTransaction1", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    con.Open();
                    cmd.ExecuteNonQuery();  //update is a nonquery operation
                }//end using
                lblStatus.ForeColor = System.Drawing.Color.Green;
                lblStatus.Text = "Transaction spTransaction1 was completed successfully";
            }//end try
            catch(SqlException ex)
            {
                //Msg 1205 is a deadlock with a conflicting transaction. In this case this is chosen as the deadlock victim
                string ErrorNumber = ex.Number.ToString();
                string Error = ex.Message;
                string ErrorCode = ex.ErrorCode.ToString();
                lblStatus.ForeColor = System.Drawing.Color.Red;
                lblStatus.Text = "Error Message " + Error + "Error Number" + ErrorNumber + " Error Code " + ErrorCode;
            }//end catch

        }//btnclick
    }
}