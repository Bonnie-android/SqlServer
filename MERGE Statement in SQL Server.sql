/** MERGE statement in SQL Server ***/
/** we require a SOURCE and TARGET table**/
/** the SOURCE and TARGET table are matched on column(s) for the join **/
/** the SOURCE table provides the information for the update **/

/** table 1 tblStudentSource **/
create table dbo.tblStudentSource
(
   ID int primary key ,
   Name varchar(20),
   GradeLevel varchar(20)
)
/** table 2 tblStudentTarget **/
create table dbo.tblStudentTarget
(
  ID int primary key ,
  Name varchar(20),
  GradeLevel varchar(20)

)

insert into tblStudentSource values(1,'Michelle ORama','Freshman'); -- to be updated
insert into tblStudentSource values(2,'Mike Ng','Freshman'); -- to be updated
insert into tblStudentSource values(3,'Chen Hernandez','Junior'); -- to be updated
insert into tblStudentSource values(4,'Ravi','Senior'); -- to be updated
insert into tblStudentSource values(5,'Jean','Sophomore'); -- to be added
insert into tblStudentSource values(6,'Burts Bees','Sophomore'); -- to be updated
insert into tblStudentSource values(7,'Rajesh Kelly','Junior'); -- to be added

insert into dbo.tblStudentTarget values(1,'Michelle','Freshman');
insert into dbo.tblStudentTarget values(2,'Mike','Freshman');
insert into dbo.tblStudentTarget values(3,'Chen','Junior');
insert into dbo.tblStudentTarget values(4,'Ravi','Junior');
insert into dbo.tblStudentTarget values(6,'Burt','Senior');
insert into dbo.tblStudentTarget values(8,'Clive','Senior'); -- to be deleted
insert into dbo.tblStudentTarget values(9,'Andrea','Senior'); -- to be deleted
insert into dbo.tblStudentTarget values(10,'Simpson','Freshman'); -- to be deleted


select * from dbo.tblStudentSource;
select * from dbo.tblStudentTarget;


/** Rules if record in source is different than record in target then update target record, 
    if record in source exists but not in target then insert record into target
	if record is in target but not in source then delete from target
	After the merge operation the two tables should be identical with the target updated against the source
***/
 

MERGE dbo.tblStudentTarget AS T
USING dbo.tblStudentSource AS S
ON T.ID = S.ID
WHEN MATCHED THEN 
   UPDATE SET T.NAME = S.NAME
WHEN NOT MATCHED BY TARGET THEN
   INSERT (ID,NAME) VALUES (S.ID,S.NAME)
WHEN NOT MATCHED BY SOURCE THEN 
   DELETE;

select * from dbo.tblStudentSource;
select * from dbo.tblStudentTarget;