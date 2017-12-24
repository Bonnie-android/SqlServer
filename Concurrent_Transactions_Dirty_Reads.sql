/** Concurrent Transactions Dirty Reads ***/
/** What is a 'dirty read'? When one transaction is permitted to read data that has been modified by another transaction that has not
yet been committed. If the first transaction is rolled back after the second reads the data, the second transaction has dirty data
that does not exist anymore
Set transaction isolation level read uncommitted
***/


/** Lost Update when a transaction overwrites another transaction and erases it. This is caused at read uncommitted and read committed access levels.
   It is not seen in Repeatable Read or Snapshot levels however. The default isolation level in Sql Server is read committed.
   Set Transaction Isolation Level Repeatable Read this is the default for SQL Server
  
**/

/** Non Repeatable Read Concurrency Problem
Non repeatable reads occur when one transaction reads the same data twice and another transaction updates that data in between
the first and second read of transaction one 
Set transaction isolation level repeatable read
***/

/** Phantom Reads occur when one transaction executes a query twice and obtains a different numer of rows in the result set 
each time. This happens when a second transaction inserts a new row that matches the WHERE clause of the query executed by
the first transaction 
set transaction isolation level serializable

Preventing non-repeatable reads by using the Repeatable Read transaction isolation level will prevent updates and deletes from those rows because they are locked by the first transaction. It will not prevent the occurrence of inserted rows which is called a phantom read. It starts out with 10 rows and ends up committing 12 rows.
The Serializable transaction isolation level prevents non-repeatable reads (updates, deletes to locked rows) and it also prevents phantom reads (inserted rows).


***/




