/** setting up two test cases for ADO.NET where the two transactions will cause a deadlock on the test tables.
/*
---create table tblTestB
create table tblTestA
(
   id int primary key,
   name varchar(20)
)

insert into tblTestA values(1,'Name A');
insert into tblTestB values(1,'Name B');
update tblTestA set name = 'Name A';
update tblTestB set name = 'Name B';
*/



/** TRANSACTION 1 ****/
  create procedure spTransaction1
  as
  begin
     begin tran
	    Update tblTestA set name = 'Name A Transaction 1'
		where id = 1
		Waitfor delay '00:00:15' --wait 15 seconds
		Update tblTestB set name = 'Name B Transaction 1'
		where id = 1
	 commit transaction
  end

 --- spTransaction1

create procedure spTransaction2
  as
  begin
     begin tran
	    Update tblTestA set name = 'Name A Transaction 2'
		where id = 1
		Waitfor delay '00:00:05' --wait 15 seconds
		Update tblTestB set name = 'Name B Transaction 2'
		where id = 1
	 commit transaction
  end

   --- spTransaction2

  select * from tblTestA;
  select * from tblTestB;

