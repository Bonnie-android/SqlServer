/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP 1000 [Id]
      ,[Name]
      ,[Title]
      ,[DeptId]
  FROM [ProductDB].[dbo].[tbl_Employees]


Create table tbl_EmployeeTest
(
  ID int primary key,
  Name varchar(30),
  JobTitle varchar(30),
  DeptID int
);

Create type EmpTableType as Table
(
  ID int primary key,
  Name varchar(30),
  JobTitle varchar(30),
  DeptID int
);

create procedure sp_InsertIntoEmployeeTest
@EmpTableType EmpTableType READONLY
AS
BEGIN
   Insert into tbl_EmployeeTest
   Select * from @EmpTableType
END



Declare @EmployeeTableVariable EmpTableType
Insert into @EmployeeTableVariable values (1,'Jenny Chang', 'Project Manager',3)
Insert into @EmployeeTableVariable values (2,'Tammy Smith', 'IT Project Manager',1)
Insert into @EmployeeTableVariable values (3,'Pavi Rahm', 'Programmer I',2)
Insert into @EmployeeTableVariable values (4,'Toni Jones', 'Programmer II',3)
Insert into @EmployeeTableVariable values (5,'Tim Jackson', 'Director',4)

---call stored procedure 
execute sp_InsertIntoEmployeeTest @EmployeeTableVariable

select * from tbl_EmployeeTest