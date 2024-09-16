SELECT *
FROM fact_vehicle_sales;
/* 
 Which year had the highest total of new vehicle sales, and what was the total?
 */
WITH fvs AS (
    SELECT year,
        SUM(total_sales_new)::money AS total_new_sales_by_year
    FROM fact_vehicle_sales
    GROUP BY year
)
SELECT *
FROM fvs
WHERE total_new_sales_by_year = (
        SELECT MAX(total_new_sales_by_year)
        FROM fvs
    )
    /* 
     Which month had the highest used vehicle sales in each year?
     */
SELECT year,
    month,
    total_sales_used::money
FROM fact_vehicle_sales fact_outer
WHERE total_sales_used = (
        SELECT MAX(total_sales_used)
        FROM fact_vehicle_sales fact_inner
        WHERE fact_outer.year = fact_inner.year
    )
    /* 
     How were the new and used vehicle sales throughout each year?
     */
SELECT year,
    SUM(total_sales_new)::money all_yearly_sales_new,
    SUM(total_sales_used)::money all_yearly_sales_used
FROM fact_vehicle_sales
GROUP BY year
ORDER BY year
    /*
     Which months had sales higher than their averages over each year?
     */
SELECT year,
    month,
    (total_sales_new + total_sales_used)::money total_sales
FROM fact_vehicle_sales AS sales_outer
WHERE total_sales_new + total_sales_used > (
        SELECT AVG(total_sales_new + total_sales_used)
        FROM fact_vehicle_sales AS sales_inner
        WHERE sales_outer.year = sales_inner.year
    )
    /* 
     Show the evolution of sales by year
     */
SELECT year,
    SUM(total_sales_new + total_sales_used)::money AS sales
FROM fact_vehicle_sales
GROUP BY year
ORDER BY sales DESC