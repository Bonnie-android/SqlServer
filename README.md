# SqlServer
DBA Routines, Optimizing Queries
Which is better a subquery or a join? How can you tell which will be more efficient?
Included here is a script which generates two sample tables, tblProduct and tblProductSales. tblProduct and tblProductSales are linked by  productId which is a primary key in tblProduct and a foreign key in tblProductSales.
The records for each table are generated using a random number generator and a while loop. 
We can compare methods by utilizing "Client Statistics" and "Actual Execution Plan" which will help to choose the optimal pathway.

