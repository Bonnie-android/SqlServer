using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Table_Valued_Paramaters
{
    public partial class Load_Table_Valued_Parameter_Demo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //DBConnectionString
        }//end pageload

        protected void btnFill_Click(object sender, EventArgs e)
        {
            txtEmpID1.Text = "1";
            txtEmpID2.Text = "2";
            txtEmpID3.Text = "3";
            txtEmpID4.Text = "4";
            txtName1.Text = "Mary Smith";
            txtName2.Text = "Ravi Khan";
            txtName3.Text = "Dinesh Patel";
            txtName4.Text = "Don Jon";
            txtTitle1.Text = "Programmer I";
            txtTitle2.Text = "Programmer II";
            txtTitle3.Text = "Manager";
            txtTitle4.Text = "Director";
            txtDeptID1.Text = "100";
            txtDeptID2.Text = "200";
            txtDeptID3.Text = "300";
            txtDeptID4.Text = "400";

        }//end btnFill

        protected void btnInsert_Click(object sender, EventArgs e)
        {
            //retrieve data from web page and load it into SQL Server table using ADO
           string CS = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("sp_InsertIntoEmployeeTest", con);
                cmd.CommandType = CommandType.StoredProcedure;
                SqlParameter parm = new SqlParameter();
                parm.ParameterName = "@EmpTableType";
                parm.Value = GetEmployeeData();
                cmd.Parameters.Add(parm);
                con.Open();
                cmd.ExecuteNonQuery();

            }

        }//end btnInsert


        //create a function that returns a dataset to be loaded into the SQL Server table using sp_
        //take in data from web form and return a data set
        private DataTable GetEmployeeData()
        {
            //create a data table and then specify columns for the data table the add rows
            DataTable dt = new DataTable();
            dt.Columns.Add("ID");  //add columns
            dt.Columns.Add("Name");
            dt.Columns.Add("JobTitle");
            dt.Columns.Add("DeptID");

            dt.Rows.Add(txtEmpID1.Text, txtName1.Text, txtTitle1.Text, txtDeptID1.Text); //add rows of data
            dt.Rows.Add(txtEmpID2.Text, txtName2.Text, txtTitle2.Text, txtDeptID2.Text);
            dt.Rows.Add(txtEmpID3.Text, txtName3.Text, txtTitle3.Text, txtDeptID3.Text);
            dt.Rows.Add(txtEmpID4.Text, txtName4.Text, txtTitle4.Text, txtDeptID4.Text);


            return dt;

          /** from sql server
           * Create type EmpTableType as Table
               (
                 ID int primary key,
                 Name varchar(30),
                 JobTitle varchar(30),
                 DeptID int
                );
             ***/
        }//end GetEmployeeData
    }
}
 