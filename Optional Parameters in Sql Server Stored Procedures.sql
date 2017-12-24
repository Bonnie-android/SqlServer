---- Optional Parameters in SQl Server Stored Procedures
---- Parameters of a SQL Server stored procedure can be made optional by specifying default values
---- In this case if we don't specify any parameters we receive all records
---- Also please see asp.net application which calls this stored proc called 'OptionalParametersInStoredProcedures'
Alter Proc spSearchEmployees
@Name varchar(50) = NULL,
@Title varchar(20) = NULL,
@Salary money = NULL
as
BEGIN
   SELECT [ID] //Identity column
      ,[Name]
      ,[Title]
      ,[Salary]
  FROM [ProductDB].[dbo].[Employees]
  WHERE (Name = @Name OR @Name IS NULL) AND
  (Title = @Title OR @Title IS NULL)  
END

spSearchEmployees ---- returns the full list
spSearchEmployees @Name ='Mary-Lee Scott' --- returns a single record
spSearchEmployees @Title= 'Manager' --- returns list of all managers


