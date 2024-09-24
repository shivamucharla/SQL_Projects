
# Salary Database Management in MySQL

## Project Description:
This project involves managing and querying an employee salary database using SQL. The queries demonstrate how to fetch, update, and manipulate employee data, including filtering based on conditions, calculating averages, counting entries, and deleting records with certain conditions.

## SQL Queries Overview:

### 1. **Create Schema and Use It:**
```sql
CREATE SCHEMA salary;
USE salary;
```

### 2. **Show All Columns and Rows:**
```sql
SELECT * FROM salaries;
```

### 3. **Show EmployeeName and JobTitle:**
```sql
SELECT EmployeeName, JobTitle FROM salaries;
```

### 4. **Show Number of Employees:**
```sql
SELECT COUNT(*) FROM salaries;
```

### 5. **Show Unique Job Titles:**
```sql
SELECT DISTINCT JobTitle FROM salaries;
```

### 6. **Show JobTitle and OvertimePay Greater than 50000:**
```sql
SELECT JobTitle, OvertimePay FROM salaries WHERE OvertimePay > 50000;
```

### 7. **Show Average Base Pay:**
```sql
SELECT AVG(BasePay) AS "Avg BasePay" FROM salaries;
```

### 8. **Top 10 Highest Paying Employees:**
```sql
SELECT EmployeeName, TotalPay FROM salaries
ORDER BY TotalPay DESC
LIMIT 10;
```

### 9. **Show Avg of BasePay, OvertimePay, and OtherPay for Each Employee:**
```sql
SELECT EmployeeName, (BasePay + OvertimePay + OtherPay)/3 AS "avg_of_bp_op_ot" FROM salaries;
```

### 10. **Show Employees with 'Manager' in Job Title:**
```sql
SELECT EmployeeName, JobTitle FROM salaries WHERE JobTitle LIKE '%Manager%';
```

### 11. **Show All Non-Manager Employees:**
```sql
SELECT EmployeeName, JobTitle FROM salaries WHERE JobTitle <> '%Manager%';
```

### 12. **Show Employees with BasePay Less than 50000:**
```sql
SELECT EmployeeName, BasePay FROM salaries WHERE BasePay < 50000;
```

### 13. **Show Employees with Total Pay Between 50000 and 75000:**
```sql
SELECT EmployeeName, TotalPay FROM salaries WHERE TotalPay BETWEEN 50000 AND 75000;
```

### 14. **Show Employees with BasePay Less than 50000 or Total Pay Greater than 100000:**
```sql
SELECT * FROM salaries WHERE BasePay < 50000 OR TotalPay > 100000;
```

### 15. **Show Employees with Total Pay Between 125000 and 150000 and Job Title is Director:**
```sql
SELECT EmployeeName, TotalPay FROM salaries WHERE TotalPay BETWEEN 125000 AND 150000 AND JobTitle LIKE '%Director%';
```

### 16. **Order Employees by TotalPayBenefits in Descending Order:**
```sql
SELECT EmployeeName, TotalPayBenefits FROM salaries ORDER BY TotalPayBenefits DESC;
```

### 17. **Job Titles with Average Base Pay of at Least 100000:**
```sql
SELECT JobTitle, AVG(BasePay) AS 'avgbasepay' FROM salaries
GROUP BY JobTitle
HAVING AVG(BasePay) >= 100000
ORDER BY avgbasepay DESC;
```

### 18. **Update Managers' Salary by 10%:**
```sql
UPDATE salaries
SET BasePay = BasePay * 1.1
WHERE JobTitle LIKE '%Manager%';
```

### 19. **Delete Employees with No OvertimePay:**
```sql
DELETE FROM salaries WHERE OvertimePay = 0;
```

## Safe Updates:
In MySQL, safe updates are enabled by default, which prevents updates and deletions without a WHERE clause. This can be disabled temporarily with:
```sql
SET SQL_SAFE_UPDATES = 0;
```
And re-enabled with:
```sql
SET SQL_SAFE_UPDATES = 1;
```

