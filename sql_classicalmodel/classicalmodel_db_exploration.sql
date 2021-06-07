USE classicmodels;
SELECT * FROM customers;

# AGGREGATIONS
# Average buy price 

SELECT 
    AVG(buyPrice) average_buy_price
FROM 
    products;
    
# Avg. payment amount
SELECT 
    AVG(amount) avg_payments
FROM
    payments;

# Avg. buy price per product line ordered from the biggest
SELECT 
    productline, AVG(buyPrice) avg_buyprice
FROM
    products
GROUP BY productline
ORDER BY 2 DESC;

# How many products?
SELECT 
    COUNT(*) total
FROM
    products;
    
#How many products for each prod line?
SELECT 
    COUNT(*) total, productLine
FROM
    products
GROUP BY productLine
ORDER BY 1 DESC;

# Find the biggest order from order details grouped by prodcode
SELECT 
    productCode,
    productName,
    SUM(priceEach * quantityOrdered) total
FROM
    orderDetails
        INNER JOIN
    products USING (productCode)
GROUP BY productCode
ORDER BY total;

# The following statement uses the GROUP_CONCAT() function to return the sales staffs 
# and list of customers that each sales staff is in charge of
SELECT 
    firstName,
    lastName,
    GROUP_CONCAT(
	DISTINCT customername
        ORDER BY customerName) customers
FROM
    employees
INNER JOIN customers 
	ON customers.salesRepEmployeeNumber = employeeNumber
GROUP BY employeeNumber
ORDER BY firstName , lastname;

# Date functions
salesRepEmployeeNumber