create database company;

use company;

select * from sales;
-- Q1. Find all orders shipped via 'Economy' mode with a total amount is greater than 25000
select * from sales where Ship_Mode ='Economy' and Total_Amount > 25000;
 
 -- Q2. Find 
 select * from sales where Category='Technology' and Country='Ireland' and Order_Date > '2020-01-01';
  select * from sales where Country='Ireland' and Category='Technology'and  Order_Date> '01-01-2020';
   select * from sales where Order_Date>'01-01-2020' and Country='Ireland' and Category='Technology';
   select Order_Date from sales where Country='Ireland';
   
   --  Q3. List the top 10 most profitable sales transactions in descending order
   select Unit_Profit from sales order by Unit_Profit DESC limit 10;
   select Unit_Profit from sales order by Unit_Profit DESC limit 10, 20;  --- skip 10 records, showing next 20 records.
   
   -- Q4. Find all the customers whose name starts with 'J' and ends with 'n'.
   select Order_Id,Customer_Name from sales where Customer_Name like 'J%n';
   
   -- Q5. Retrieve all product names that contain 'Acco' anywhere in the name.
      select Order_ID,Product_Name from sales where Product_Name like '%Acco%';
      
      -- Q6. Get the top 5 cities with the highest total sales amount.
  select City,sum(Total_Amount) as Total_Sales from sales group by  City order by Total_Sales desc limit 5; -- WE have to use alias name when we use aggregate functions.
  
  -- Q7. Display the second set of 10 records for Customer_Name and Total_Amount in decresing order 
  select Customer_Name,Total_Amount from sales order by  Total_Amount desc limit 10,10;
  
  -- Q8. find the total revenue ,average unit cost and total no of orders.
  select sum(Total_Amount) as Total_Revenue ,avg(Unit_Cost) as Average_Unit_Cost ,count(Order_ID) as Total_Number_Of_Orders from sales ;
  
  -- Q9. count unique number of regions in dataset
  select distinct(count(Region)) as uniq_reg from sales ;
   select count(distinct(Region)) as uniq_reg from sales ;
   
   -- Q10. Find the number of orders placed by each customer 
   select Customer_Name,count(Order_ID) as Order_Count from sales group by Customer_Name order by Order_Count desc;
   
   -- Q11. Rank 5 products based on total sales using RANK(). 4 types: row number, rank,dense rank,ntile.
   
   select Product_Name,sum(Total_Amount) as Total_Sales,rank() over (order by sum(Total_Amount) desc)as Sales_Rank from sales group by Product_Name limit 5;
   