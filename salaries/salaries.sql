create schema salary;
use salary
#  show all columns and rows
 
 select * from salaries;
 
 # show only employeename and job title
 
 select EmployeeName, JobTitle from salaries
 
 # show number of employees in the table
 
 select count(*) from salaries;
 
 # show the unique job titles in the table
 
 select distinct JobTitle  from salaries; #1632
 
 #show the job title and overtime pay for all employeeswith grethe than 50000
 
 select JobTitle, OvertimePay from salaries where OvertimePay > 50000;
 
 
 # show average base pay for all employees
 
 select AVG(BasePay) as "Avg BasePay"  from salaries;
 
 # show the top 10 highest paying employees
 
 select EmployeeName, TotalPay from Salaries
 order by TotalPay desc
 limit 10;
 
 
 # show avg of basaepay, overtimepay, other pay for each employee
 
 
 select EmployeeName, (BasePay + OvertimePay + OtherPay)/3 as "avg_of_bp_op_ot" from salaries;
 
 # show all the employeeswho had the word amanager in the JobTitle
 
 select EmployeeName, JobTitle from salaries
 where JobTitle LIKE '%Manager%';
 
 # show all other employees who are not employes
 
 select EmployeeName, JobTitle from salaries
 where JobTitle <> '%Manager%';
 
 #show all employess whose basepay is less than 50000
 
 select EmployeeName, BasePay from salaries where BasePay < 50000;	
 
 #show all the employees with total pay between 50000 and 75000
 
 select EmployeeName, TotalPay from salaries
 where TotalPay  between 50000 and 75000 ;
 
 #show all employess whose basepay is less than 50000 or total pay greater than100000
 
 select * from salaries
 where BasePay < 50000 or TotalPay > 100000;
 
 
 # show all the employees with totalpay is between 12500 and 150000 and those employees titles are only directors
 
 select EmployeeName, TotalPay from salaries 
 where TotalPay  between 125000 and 150000 
 and JobTitle LIKE '%Director%';
 
 
 
 
 # show all employees ordered by their totalpaybenefits in descending order
 
 select EmployeeName, TotalPayBenefits from salaries
 order by TotalPayBenefits DESC;
 
 
 # show all the jobtitles with the avg basepay of atleast 100000 and orderthen by avg basepay in descending order
 
 select JobTitle, AVG(BasePay) as 'avgbasepay' from salaries
 group by JobTitle
 having avg(BasePay) >= 100000
 order by avgbasepay DESC ;
 
 
 SET SQL_SAFE_UPDATES = 0;

 
 #update the managers salary by 10%
 
UPDATE salaries
SET BasePay = BasePay * 1.1
WHERE JobTitle LIKE '%Manager%';
select * from salaries


# delete all employees who have no overtimepay

 SET SQL_SAFE_UPDATES = 0;
delete from salaries 
where OvertimePay = 0;
select * from salaries;

SET SQL_SAFE_UPDATES = 1;