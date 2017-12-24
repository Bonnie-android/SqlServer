using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


public partial class Employee_LookUp_App : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            getEmployeeData();
        }
    }

    private void getEmployeeData()
    {
        //Retrieve the requested data and bind it to the gridview control  EmployeeInfoCS
        string CS = ConfigurationManager.ConnectionStrings["EmployeeInfoCS"].ConnectionString;
        //create the connection object to connect to server and database
        using (SqlConnection con = new SqlConnection(CS))
        {

            //create the command object which calls the stored procedure
            //call the stored procedure and use the above connection to the server to access it
            SqlCommand cmd = new SqlCommand("spSearchEmployees", con);
            cmd.CommandType = CommandType.StoredProcedure;


            //what parameters should I attach to the stored procedure?
            //sp is set up to process NULLs as well as text- please see OptionalParametersinSqlServerStoredProcedures.sql
            //if parameter exists then add it to the stored procedure
            // getControl(SqlCommand command, string parameterName, Control control)
            getControl(cmd, "@ID", txtEmpID);
            getControl(cmd, "@Name", txtEmpName);
            getControl(cmd, "@Title", txtTitle);
            getControl(cmd, "@Salary", txtSalary);

            con.Open(); //open connection to load grid
            gridEmployees.DataSource = cmd.ExecuteReader();
            gridEmployees.DataBind();

            getControl(cmd, "@ID", txtEmpID);
        }
    }
    
    private void getControl(SqlCommand command, string parameterName, Control control)
    {
        //by passing a generic control any asp control can be passed to this function including drop down list, text box
        if(control is TextBox && ((TextBox)control).Text != string.Empty)
        {
            SqlParameter parameter = new SqlParameter(parameterName, ((TextBox)control).Text);
            command.Parameters.Add(parameter);
        }
        //what if we want to put in a dropdown list at a future time and accept its values
        else if(control is DropDownList && ((DropDownList)control).SelectedValue != "-1")
        {
            SqlParameter parameter = new SqlParameter(parameterName, ((DropDownList)control).SelectedValue);
            command.Parameters.Add(parameter);
        }


    }


    protected void btnSearch_Click(object sender, EventArgs e)
    {
        getEmployeeData();
    }
}