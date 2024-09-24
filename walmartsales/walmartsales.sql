create schema walmart;

create table IF NOT EXISTS sales( 
    invoice_id VARCHAR(30) NOT NULL PRIMARY KEY,
    branch VARCHAR(5) NOT NULL,
    city VARCHAR(30) NOT NULL,
    customer_type VARCHAR(30) NOT NULL,
    gender VARCHAR(10) NOT NULL,
    product_line VARCHAR(100) NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    quantity INT NOT NULL,
    VAT FLOAT(6,4) NOT NULL,
    total DECIMAL(12,4) NOT NULL,
    date  DATETIME NOT NULL,
    time TIME NOT NULL,
    payment_method VARCHAR(15) NOT NULL,
    cogs DECIMAL(10,2) NOT NULL,
    gross_margin_pct FLOAT(10,9) NOT NULL,
    gross_income DECIMAL(12,4) NOT NULL,
    rating FLOAT(2,1)
    );
    
    
    
    
    
    ------------------ Feature Engineering -----------------
    
    --- time of day----
    
    
    
    
    select 
    time,
    (CASE
         WHEN time BETWEEN "00:00:00" AND "12:00:00" THEN "morning"
         WHEN time BETWEEN "12:01:00" AND "16:00:00" THEN "afternoon"
		 ELSE "evening"
    END) 
    AS time_of_date
    from sales;
    
    ALTER TABLE sales ADD COLUMN time_of_date VARCHAR(20);
    
    SET SQL_SAFE_UPDATES = 0;

    UPDATE sales
    SET time_of_date = (CASE
         WHEN time BETWEEN "00:00:00" AND "12:00:00" THEN "morning"
         WHEN time BETWEEN "12:01:00" AND "16:00:00" THEN "afternoon"
		 ELSE "evening"
    END); 
    
    
    
    
    -------------  day_name ------
    select
    date,
    DAYNAME(date)
    from sales; 
    
    
    ALTER TABLE sales ADD COLUMN day_name VARCHAR(10);
    
    UPDATE sales
    SET day_name = DAYNAME(date);
    
    
    
    ------ month_name -------
    
    select
    date, 
		MONTHNAME(date)
        from sales;
    
    
    ALTER TABLE sales ADD COLUMN month_name VARCHAR(10);
    
    
UPDATE sales
SET month_name = MONTHNAME(date);
    
    
    ---- how many unique cities does the data have ------
    
    select distinct city 
    from sales;
    
    ------ how many unique branches -----
    
    select distinct branch
    from sales;
    
    ------ Product---------
    
    select 
    count(distinct product_line)
    from sales;
    
    --most common payment method ------
    
    select payment_method,
    count(payment_method) AS count
    from sales
    group by payment_method
    order by count DESC;
    
    
    select product_line,
    count(product_line) AS count
    from sales
    group by product_line
    order by count DESC;
    
    
    ------- total revenue by month ------
    
    select month_name AS month,
    SUM(total) AS total_revenue
    from sales
    group by month_name 
    order by total_revenue DESC;
    
    
    ----------- month with largest COGS---------
   
   
   select month_name AS month,
   SUM(cogs) as cogs
   from sales
   group by month
   order by cogs DESC;
    
    
    -------- product line with highest Revenue ------
    
    select product_line,
    SUM(total) AS total_revenue
    from sales
    group by product_line
    order by total_revenue DESC;
    
    -------- city with largest revenue ---------
    
    
    select branch, city,
    SUM(total) AS total_revenue
    from sales
    group by city, branch
    order by total_revenue DESC;
      
      
      
      --------- product line has largest VAT ---------    
    
    select product_line ,
    SUM(VAT) AS vat, 
    AVG(VAT) AS avg_vat
    FROM sales
    group by product_line
    order by avg_vat DESC;
    
    
    ------- branch sold more products than the average products ---------
    
    select 
    branch, 
    SUM(quantity) as qty
    from sales
    group by branch
    HAVING SUM(quantity) > (select AVG(quantity) from sales);
    
    
    ------ most product line by gender -----
    
    select product_line,
    gender,
    COUNT(gender) as gndr
    from sales
    group by product_line,
    gender
    order by gndr DESC;
    
    
    -------- average rating of each product line --------
    
    select product_line,
    ROUND(AVG(rating), 2)  as avg_rating
    from sales
    group by product_line
    order by avg_rating DESC;
    
    ----------- sales---------
    -------- sales made in each time of day per weekday ---------
    
    select
    time_of_date,
    COUNT(*) AS total_sales
    from sales
    WHERE day_name = 'Monday'
    group by time_of_date
    order by total_sales DESC;
    
    
    ----------- customer types giving most revenue ---------
    
    select 
    customer_type,
    SUM(total) AS total_revenue
    from sales
    group by customer_type
    order by total_revenue DESC;
    
    
    
    ------------- city has largest VAT -------------
    
    select city,
    AVG(VAT) AS vat
    FROM sales
    group by city
    order by vat DESC;
    
    ---------- customer typt pay haighest vat -------
    
     select customer_type,
    AVG(VAT) AS vat
    FROM sales
    group by customer_type
    order by vat DESC;
    
    
    ---------- customer --------------
    
    --------- unique customer_types --------
    
    select distinct customer_type from sales;
    
    ---------- unique payment method doed the data have --------
    
    select distinct payment_method from sales;
    
    ----------- customer type buys the most -------
    
    
     select customer_type,
    COUNT(*) AS custmr_cnt
    FROM sales
    group by customer_type
    order by custmr_cnt DESC; 
    
    -------grnder of most of customers-----------
    
    select gender, 
    COUNT(gender) AS count_gender
    from sales
    group by gender
    order by count_gender DESC;
    
    ---------- gender distribution per branch ----------
    
    select branch,
    COUNT(gender) AS count_gender
    from sales
    where branch = 'B'
    GROUP BY branch
    ORDER BY count_gender DESC;
    
    
    
    --------- which time of day customer gives most ratings------------
    
    select
    time_of_date,
    AVG(rating) AS avg_rating
    FROM sales
    group by time_of_date
    order by avg_rating;
    
   --------- which time of day customer gives most ratings per branch ------------  
    
    select
    time_of_date,
    AVG(rating) AS avg_rating
    FROM sales
    where branch = 'B'
    group by time_of_date
    order by avg_rating;
    
    
    ---------- which day has most ratings ---------
    
    select day_name,
    AVG(rating) AS avg_rating
    from sales
    group by day_name
    order by avg_rating DESC;
    
    
        ---------- which day has most ratings per branch ---------
        
        
        
      select day_name,
    AVG(rating) AS avg_rating
    from sales
    where branch = 'B'
    group by day_name
    order by avg_rating DESC;
        
        
        
        
       ----------------- 
        
        
        
    
    
    
    