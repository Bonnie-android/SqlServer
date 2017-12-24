/***
Concurrent Transactions
What happens if transactions are running concurrently?
What are the isolation levels provided by SQL Server to address concurrency side effects?
  Common concurrency problems - dirty reads, lost updates, nonrepeatable reads, phantom reads 
***/

/** A transaction is a group of sql statements that change data in a data store.
  A transaction is treated as a single unit of work and leave the data in the data store
  in a consistent state. Either all tables are committed to an update or all tables are rolled back to their original version
  A transaction ensures that either all of the commands succeed or none of them and that the data is always left in a consistent state.
  Transaction Isolation Levels --> Read Uncommitted, Read Committed, Repeatable Read, Snapshot, Serializable
  ***/

 
  create table dbo.tblAccounts
  (
     AccountID int primary key,
	 AccountOwner varchar(20),
	 AccountBalance money
  )

  insert into tblAccounts values (1, 'Mark', 1000);
  insert into tblAccounts values (2, 'Mary', 1000);

  BEGIN TRY
     BEGIN TRANSACTION
	   UPDATE tblAccounts SET AccountBalance = AccountBalance - 100 WHERE AccountID = 1
	   UPDATE tblAccounts SET AccountBalance = AccountBalance + 100 WHERE AccountID = 2
	 COMMIT TRANSACTION
	 PRINT 'Transaction was completed'
  END TRY
  BEGIN CATCH
     ROLLBACK TRANSACTION
	 PRINT 'Rollback of Transaction'
  END CATCH

 select * from tblAccounts;


   