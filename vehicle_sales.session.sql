DROP TABLE fact_vehicle_sales;
-- Table creation
CREATE TABLE fact_vehicle_sales (
    id SERIAL,
    year INT,
    month VARCHAR(3),
    new DECIMAL,
    used DECIMAL,
    total_sales_new DECIMAL,
    total_sales_used DECIMAL,
    CONSTRAINT PK_id PRIMARY KEY (id)
);
-- Setting up ownership
ALTER TABLE fact_vehicle_sales OWNER TO postgres;
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