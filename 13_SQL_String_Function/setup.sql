---CUSTOMERS TABLE---

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    email VARCHAR(100),
    city VARCHAR(30),
    phone_number VARCHAR(20)
);

INSERT INTO customers VALUES
(1, 'Aarav Sharma', 'aarav@gmail.com', 'Mumbai', '9876543210'),
(2, 'meera joshi', 'MEERA@YAHOO.COM', 'Pune', '9123456780'),
(3, 'Rahul Verma', 'rahul123@outlook.com', 'Delhi', '9988776655'),
(4, 'PRIYA SINGH', 'priya.singh@gmail.com', 'Mumbai', '9000011111'),
(5, 'Karan Mehta', 'karan@company.com', 'Bangalore', '9555566666'),
(6, 'Sneha Patil', 'SNEHA@GMAIL.COM', 'Pune', '9888899999'),
(7, 'Aditya Rao', 'aditya@yahoo.com', 'Chennai', '9777711111'),
(8, 'Neha Kapoor', 'neha.kapoor@gmail.com', 'Delhi', '9666622222'),
(9, 'vikram patel', 'vikram@outlook.com', 'Mumbai', '9555512345'),
(10, 'Riya Sharma', 'riya123@gmail.com', 'Hyderabad', '9444433333');
