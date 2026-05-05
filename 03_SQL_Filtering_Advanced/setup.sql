CREATE TABLE customers (
    customer_id INT,
    name VARCHAR(50),
    city VARCHAR(50),
    age INT,
    gender VARCHAR(10),
    signup_date DATE,
    total_spent NUMERIC(10,2),
    membership VARCHAR(20)
);

INSERT INTO customers VALUES
(1, 'Aarav', 'Mumbai', 25, 'Male', '2023-01-10', 12000, 'Gold'),
(2, 'Meera', 'Pune', 30, 'Female', '2022-05-12', 8000, 'Silver'),
(3, 'Rahul', 'Delhi', 35, 'Male', '2021-07-20', 15000, 'Gold'),
(4, 'Priya', 'Mumbai', 28, 'Female', '2023-03-15', 5000, 'Bronze'),
(5, 'Karan', 'Bangalore', 40, 'Male', '2020-11-01', 20000, 'Platinum'),
(6, 'Sneha', 'Pune', 22, 'Female', '2023-06-18', 3000, 'Bronze'),
(7, 'Aditya', 'Delhi', 31, 'Male', '2022-09-25', 11000, 'Silver'),
(8, 'Neha', 'Mumbai', 27, 'Female', '2023-08-05', 7000, 'Silver'),
(9, 'Vikram', 'Chennai', 45, 'Male', '2019-12-12', 25000, 'Platinum'),
(10, 'Riya', 'Bangalore', 29, 'Female', '2022-02-02', 9000, 'Gold'),
(11, 'Arjun', 'Hyderabad', NULL, 'Male', '2023-01-01', 6000, 'Silver'),
(12, 'Pooja', 'Delhi', 26, NULL, '2023-04-10', 4000, 'Bronze'),
(13, 'Kabir', 'Mumbai', 38, 'Male', '2021-10-30', 18000, 'Gold'),
(14, 'Isha', 'Pune', 24, 'Female', '2023-07-07', 3500, 'Bronze'),
(15, 'Manish', 'Chennai', 33, 'Male', '2022-06-14', 13000, 'Gold');
