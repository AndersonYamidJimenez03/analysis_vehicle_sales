# Vehicle Sales Analysis

The market for new and used vehicle sales has gone through a roller coaster of situations in this new century, including economic recessions, rising fuel prices, and even a pandemic. In the following analysis of vehicle sales📈, we will explore certain questions about this market using SQL 🔍 and Power BI 📊.

Data sourced from Kaggle (dataset: Vehicle_Sales_Count by Year 2002-2023).

### The questions I wanted to answer with SQL Queries were:

1. Which year had the highest total of new vehicle sales, and what was the total that year?
2. Which month had the highest used vehicle sales in each year?
3. How were the new and used vehicle sales throughout each year?
4. Which months had sales higher than their averages over each year?
5. How has the evolution of the vehicle sales market been from 2002 to 2023?

# Tools I used

These are the tools were used in this analysis:

- **SQL**
- **Power BI**
- **PostgreSQL**
- **Visual Studio Code**
- **Git & GitHub**

# Analysis

xxx

### 1. Which year had the highest total of new vehicle sales, and what was the total that year?

xxxx q estoy haciendo, y porque

```sql
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
```

xxx que encontre

![Top 10 new vehicles sales](assets\Graph_1.png)
_Graph showing the years with the highest new vehicle sales during the period from 2002 to 2023. The year 2023 is shown as the year with the highest sales, with a total of $13,755,763,434, approximately 14 billion_

### 2. Which month had the highest used vehicle sales in each year?

xxxx q estoy haciendo, y porque

```sql
SELECT year,
    month,
    total_sales_used::money
FROM fact_vehicle_sales fact_outer
WHERE total_sales_used = (
        SELECT MAX(total_sales_used)
        FROM fact_vehicle_sales fact_inner
        WHERE fact_outer.year = fact_inner.year
    )
```

xxx que encontre

![Top highest used vehicle sales monthly each year](assets\Graph_2.png)
_Explicacion de la grafica_

![Percentage of months with the highets sales](assets\Graph_3.png)
_Explicacion de la grafica_

### 3. How were the new and used vehicle sales throughout each year?

xxxx q estoy haciendo, y porque

```sql
SELECT year,
    SUM(total_sales_new)::money all_yearly_sales_new,
    SUM(total_sales_used)::money all_yearly_sales_used
FROM fact_vehicle_sales
GROUP BY year
ORDER BY year
```

xxx que encontre

![Evoluation new and used vehicles by year](assets\Graph_4.png)
_Explicacion de la grafica_

### 4. Which months had sales higher than their averages over each year?

xxxx q estoy haciendo, y porque

```sql
SELECT year,
    month,
    (total_sales_new + total_sales_used)::money total_sales
FROM fact_vehicle_sales AS sales_outer
WHERE total_sales_new + total_sales_used > (
        SELECT AVG(total_sales_new + total_sales_used)
        FROM fact_vehicle_sales AS sales_inner
        WHERE sales_outer.year = sales_inner.year
    )
```

xxx que encontre

![Top 6 months with the highest sales above average by year](assets\Graph_5.png)

_Explicacion de la grafica_

### 5. How has the evolution of the vehicle sales market been from 2002 to 2023?

xxxx q estoy haciendo, y porque

```sql
SELECT year,
    SUM(total_sales_new + total_sales_used)::money AS sales
FROM fact_vehicle_sales
GROUP BY year
ORDER BY sales DESC
```

xxx que encontre

![alt text](URL_image)
_Explicacion de la grafica_

# What I learned

xxx

- **Data**
- **Analysis**
- **Economic**

# Conclusions

3 conclusions

## Closing Thoughts

que me dejo este projecto a mi, tanto en skills como en analisys y experiencia
