---- Sales Performance Analysis of Walmart Stores Using Advanced MySQL Techniques
alter table walmartsales
add column day_name varchar(10);

update walmartsales
set day_name = dayname(Date);

alter table walmartsales add month_name varchar(110);

update  walmartsales
set month_name= monthname(Date);

---- task-1

WITH MonthlySales AS (
select branch,month_name,sum(total) as monthlysales from walmartsales
 group by branch,month_name),
 
GrowthCalculation AS (
    select
        Branch,
        Month_name,
        MonthlySales,
        LAG(MonthlySales) OVER (PARTITION BY Branch ORDER BY month_name) AS PreviousMonthSales,
        CASE 
            WHEN LAG(MonthlySales) OVER (PARTITION BY Branch ORDER BY month_name) IS NULL THEN NULL
            ELSE ROUND((MonthlySales - LAG(MonthlySales) OVER (PARTITION BY Branch ORDER BY month_name)) * 100.0 / LAG(MonthlySales) OVER (PARTITION BY Branch ORDER BY Month_name), 2)
        END AS GrowthRatePercent
    FROM 
        MonthlySales
)
SELECT 
    Branch,
    ROUND(AVG(GrowthRatePercent), 2) AS AvgGrowthRate
FROM 
    GrowthCalculation
WHERE 
    GrowthRatePercent IS NOT NULL
GROUP BY 
    Branch
ORDER BY 
    AvgGrowthRate DESC
LIMIT 1;

----- task 2

WITH profitableproduct AS (
    SELECT 
        Branch,
        `Product line`,
        SUM(`gross income` - cogs) AS profitmargin
    FROM 
        walmartsales
    GROUP BY 
        Branch, `Product line`
),
ranked_products AS (
    SELECT *,
        RANK() OVER (PARTITION BY Branch ORDER BY profitmargin DESC) AS rank_in_branch
    FROM 
        profitableproduct
)

SELECT 
    Branch,
    `Product line`,
    ROUND(profitmargin, 2) AS TotalProfit
FROM 
    ranked_products
WHERE 
    rank_in_branch = 1
ORDER BY 
    Branch;


----- task 3

WITH CustomerSpending AS (
    SELECT 
        `Customer ID`,
        AVG(Total) AS AvgSpending
    FROM 
        walmartsales
    GROUP BY 
        `Customer ID`
)


SELECT 
    `Customer ID`,
    AvgSpending,
    CASE
        WHEN AvgSpending > 300 THEN 'High'
        WHEN AvgSpending > 200 THEN 'Medium'
        ELSE 'Low'
    END AS SpendingCategory
FROM 
    CustomerSpending
ORDER BY 
    AvgSpending DESC;

---- task 4

WITH stats AS (
    SELECT 
        `Product line`,
        AVG(Total) AS avg_sales,
        STDDEV(Total) AS std_sales
    FROM 
        walmartsales
    GROUP BY 
        `Product line`
)

SELECT 
    ws.`Invoice ID`,
    ws.Branch,
    ws.`Product line`,
    ws.Total,
    s.avg_sales,
    s.std_sales,
    CASE 
        WHEN ws.Total > s.avg_sales + 2 * s.std_sales THEN 'High Anomaly'
        WHEN ws.Total < s.avg_sales - 2 * s.std_sales THEN 'Low Anomaly'
        ELSE 'Normal'
    END AS AnomalyType
FROM 
    walmartsales ws
JOIN 
    stats s ON ws.`Product line` = s.`Product line`
WHERE 
    ws.Total > s.avg_sales + 2 * s.std_sales
    OR ws.Total < s.avg_sales - 2 * s.std_sales
ORDER BY 
    `Product line`, Total DESC;

---- task 5

SELECT 
    city, 
    payment, 
    payment_count
FROM (
    SELECT 
        city,
        payment,
        COUNT(*) AS payment_count,
        ROW_NUMBER() OVER (PARTITION BY city ORDER BY COUNT(*) DESC) AS rn
    FROM 
        walmartsales
    GROUP BY 
        city, payment
) AS ranked_payments
WHERE 
    rn = 1
ORDER BY 
    city;
    
    
---- task 6

SELECT 
    Gender,
    month_name,
    SUM(Total) AS MonthlySales
FROM 
    walmartsales
GROUP BY 
    Gender, month_name
ORDER BY 
    month_name, Gender;

---- task 7

SELECT 
    `Customer type`, 
    `Product line`, 
    TotalSales
FROM (
    SELECT 
        `Customer type`, 
        `Product line`, 
        SUM(Total) AS TotalSales,
        ROW_NUMBER() OVER (PARTITION BY `Customer type` ORDER BY SUM(Total) DESC) AS rn
    FROM 
        walmartsales
    GROUP BY 
        `Customer type`, `Product line`
) AS ranked
WHERE 
    rn = 1;
    
    
----- task 8

SELECT 
    ws1.`Customer ID`,
    ws1.`Invoice ID` AS FirstPurchase,
    ws1.Date AS FirstDate,
    ws2.`Invoice ID` AS RepeatPurchase,
    ws2.Date AS RepeatDate,
    DATEDIFF(ws2.Date, ws1.Date) AS DaysBetween
FROM 
    walmartsales ws1
JOIN 
    walmartsales ws2 
    ON ws1.`Customer ID` = ws2.`Customer ID`
    AND ws2.Date > ws1.Date
    AND DATEDIFF(ws2.Date, ws1.Date) <= 30
ORDER BY 
    ws1.`Customer ID`, ws1.Date;



---- task 9
select `Customer ID`,sum(total) as totalsales from walmartsales group by `Customer ID`
order by totalsales desc limit 5;
     
     
---- task 10
select day_name,Round(sum(total),2) as sales  from walmartsales group by day_name;