---ONLINE TABLE---

CREATE TABLE online_orders (
    order_id INT,
    customer_name VARCHAR(50),
    city VARCHAR(30),
    amount NUMERIC(10,2)
);

INSERT INTO online_orders VALUES
(101, 'Aarav', 'Mumbai', 5000),
(102, 'Meera', 'Pune', 7000),
(103, 'Rahul', 'Delhi', 6000),
(104, 'Priya', 'Mumbai', 4000),
(105, 'Karan', 'Bangalore', 9000);

---OFFLINE TABLE----

CREATE TABLE offline_orders (
    order_id INT,
    customer_name VARCHAR(50),
    city VARCHAR(30),
    amount NUMERIC(10,2)
);

INSERT INTO offline_orders VALUES
(201, 'Sneha', 'Mumbai', 3000),
(202, 'Aditya', 'Delhi', 4500),
(203, 'Riya', 'Pune', 8000),
(204, 'Vikram', 'Chennai', 10000),
(205, 'Aarav', 'Mumbai', 5000);
