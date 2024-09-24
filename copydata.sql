-- Copy the data into the table
COPY fact_vehicle_sales (
    year,
    month,
    new,
    used,
    total_sales_new,
    total_sales_used
)
FROM 'C:\Users\ander\OneDrive\Documents\Projects Practices\Projects_SQL\Vehicle_Sales_Count_by_Year_2002_2023\MVA_Vehicle_Sales_Counts_by_Month_for_Calendar_Year_2002_through_December_2023.csv' WITH (
        FORMAT csv,
        HEADER true,
        DELIMITER ',',
        ENCODING 'UTF8'
    );