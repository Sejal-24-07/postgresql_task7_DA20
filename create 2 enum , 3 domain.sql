--create 2 enum 


CREATE TYPE order_status_enum AS ENUM ('Pending', 'Shipped', 'Delivered', 'Cancelled');
CREATE TYPE payment_method_enum AS ENUM ('Cash', 'Card', 'UPI', 'NetBanking');



--3 domain 
CREATE DOMAIN phone_number_domain AS VARCHAR(10)
CHECK (VALUE ~ '^[0-9]{10}$');

CREATE DOMAIN email_domain AS VARCHAR(255)
CHECK (VALUE ~ '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$');

CREATE DOMAIN positive_price_domain AS NUMERIC(10,2)
CHECK (VALUE > 0);


--use alter or create or alter contraint 
CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    phone phone_number_domain,
    email email_domain,
    total_amount positive_price_domain,
    status order_status_enum DEFAULT 'Pending',
    payment_method payment_method_enum NOT NULL
);
ALTER TABLE orders
ADD CONSTRAINT max_amount CHECK (total_amount <= 100000);


ALTER TABLE orders
DROP CONSTRAINT max_amount,
ADD CONSTRAINT max_amount CHECK (total_amount <= 200000);