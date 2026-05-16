---RAW_CUSTOMERS TABLE--

CREATE TABLE raw_customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    email VARCHAR(120),
    city VARCHAR(50),
    phone_number VARCHAR(30)
);

INSERT INTO raw_customers VALUES
(1, '  aarav sharma ', 'AARAV@GMAIL.COM', 'mumbai', '98765-43210'),
(2, 'MEERA   JOSHI', 'meera@yahoo.com ', 'PUNE', '(91)9123456780'),
(3, 'rahul verma', 'rahul123@outlook', ' delhi ', '99887 76655'),
(4, 'PRIYA SINGH', 'priya.singh@gmail.com', 'Mumbai', '90000-11111'),
(5, 'Karan@Mehta', 'karan.company.com', 'bangalore', '95555abc666'),
(6, 'Sneha   Patil', 'SNEHA@GMAIL.COM', ' pune', '98888-99999'),
(7, 'Aditya Rao', NULL, 'CHENNAI', '9777711111'),
(8, 'Neha Kapoor', 'neha.kapoor@gmail.com', 'Delhi', '96666 22222'),
(9, 'vikram   patel', 'vikram@@outlook.com', 'MUMBAI ', '9555512345'),
(10, ' Riya Sharma ', 'riya123@gmail.com', NULL, '94444-33333');
