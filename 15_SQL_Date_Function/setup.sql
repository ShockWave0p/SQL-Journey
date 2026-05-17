---ORDERS TABLE---

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(30),
    order_date DATE,
    delivery_date DATE,
    sales_amount NUMERIC(10,2)
);

INSERT INTO orders VALUES
(1, 'Aarav', 'Mumbai', '2025-01-05', '2025-01-08', 12000),
(2, 'Meera', 'Pune', '2025-01-10', '2025-01-14', 18000),
(3, 'Rahul', 'Delhi', '2025-02-01', '2025-02-06', 9000),
(4, 'Priya', 'Mumbai', '2025-02-12', '2025-02-15', 25000),
(5, 'Karan', 'Bangalore', '2025-03-03', '2025-03-08', 30000),
(6, 'Sneha', 'Pune', '2025-03-15', '2025-03-20', 15000),
(7, 'Aditya', 'Chennai', '2025-04-01', '2025-04-05', 21000),
(8, 'Neha', 'Delhi', '2025-04-18', '2025-04-23', 17000),
(9, 'Vikram', 'Mumbai', '2025-05-10', '2025-05-15', 26000),
(10, 'Riya', 'Hyderabad', '2025-05-20', '2025-05-25', 11000);
