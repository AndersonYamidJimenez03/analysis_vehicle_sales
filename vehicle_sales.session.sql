DROP TABLE IF EXISTS fact_vehicle_sales;
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
