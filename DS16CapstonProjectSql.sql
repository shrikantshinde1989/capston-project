create database termdeposit;
use termdeposit;
-- select month,count(1) from deposit group by month;
-- show databases;
-- select balance * 0.15 as 'fine',balance, MyUnknownColumn from deposit where balance < 100 group by month;


-- Q1. Write an SQL query to identify the age group which is taking more loan and then calculate the sum of all of the balances of it?
	
    select age,sum(balance) from deposit where loan = 'yes' or housing = 'yes' group by age order by sum(balance) desc ;
    
-- Q2. Write an SQL query to calculate for each record if a loan has been taken less than 100, then  calculate the fine of 15% of the current balance and create a temp table and     then add the amount for each month from that temp table? 
	
    Create temporary table tab_fine select balance * 0.15 as 'fine',balance from deposit where balance < 100 group by month;
    
-- Q3 Write an SQL query to calculate each age group along with each department's highest balance record? 
	
    select age, max(balance),job from deposit group by job order by job ;

-- Q4. Write an SQL query to find the secondary highest education, where duration is more than 150. The query should contain only married people, and then calculate the interest amount? (Formula interest => balance*15%).

	select education,marital,duration,balance,(balance * 0.15) as 'Interest Amount' from deposit where marital='married' and education = 'secondary' and duration > 150;

-- Q5. Write an SQL query to find which profession has taken more loan along with age?

	select count(1) as 'More Loan',job,age from deposit where loan = 'yes' or housing = 'yes' group by job order by count(job) desc;

-- Q6. Write an SQL query to calculate each month's total balance and then calculate in which month the highest amount of transaction was performed?

    select sum(balance) as 'Total Balance',month from deposit group by month order by sum(balance) desc;