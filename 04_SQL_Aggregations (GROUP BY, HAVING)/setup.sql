CREATE TABLE orders (
    order_id INT,
    customer_name VARCHAR(50),
    city VARCHAR(50),
    category VARCHAR(30),
    amount NUMERIC(10,2),
    quantity INT,
    order_date DATE
);

INSERT INTO orders VALUES
(1,'Aarav','Mumbai','Electronics',5000,1,'2025-01-01'),
(2,'Meera','Pune','Furniture',7000,2,'2025-01-02'),
(3,'Rahul','Delhi','Electronics',12000,1,'2025-01-03'),
(4,'Priya','Mumbai','Furniture',3000,1,'2025-01-04'),
(5,'Karan','Bangalore','Electronics',15000,2,'2025-01-05'),
(6,'Sneha','Pune','Accessories',2000,3,'2025-01-06'),
(7,'Aditya','Delhi','Furniture',8000,1,'2025-01-07'),
(8,'Neha','Mumbai','Accessories',1500,2,'2025-01-08'),
(9,'Vikram','Chennai','Electronics',20000,1,'2025-01-09'),
(10,'Riya','Bangalore','Furniture',9000,2,'2025-01-10'),
(11,'Arjun','Mumbai','Electronics',7000,1,'2025-01-11'),
(12,'Pooja','Delhi','Accessories',2500,2,'2025-01-12'),
(13,'Kabir','Mumbai','Electronics',11000,1,'2025-01-13'),
(14,'Isha','Pune','Furniture',6000,1,'2025-01-14'),
(15,'Manish','Chennai','Accessories',3500,2,'2025-01-15');
