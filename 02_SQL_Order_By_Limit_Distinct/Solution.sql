CREATE TABLE sales_orders (
	order_id INT PRIMARY KEY,
	order_date DATE,
	customer_name VARCHAR(50),
	city VARCHAR(50),
	product_name VARCHAR(50),
	category VARCHAR(50),
	quantity INT,
	unit_price NUMERIC(10,2),
	discount NUMERIC(10,2),
	total_amount NUMERIC(10,2),
	sales_channel VARCHAR(50)
);

INSERT INTO sales_orders
(order_id, order_date, customer_name, city, product_name, category, quantity, unit_price, discount, total_amount, sales_channel)
VALUES
(1,  '2025-01-02', 'Aarav Sharma',   'Pune',      'Laptop Bag',        'Accessories', 2,  1200.00,  100.00,  2300.00,  'Online'),
(2,  '2025-01-03', 'Meera Iyer',     'Mumbai',    'Gaming Laptop',     'Electronics', 1,  8500.00,    0.00,  8500.00,  'Offline'),
(3,  '2025-01-04', 'Rahul Verma',    'Delhi',     'Office Chair',      'Furniture',   3,  1500.00,  150.00,  4350.00,  'Online'),
(4,  '2025-01-05', 'Priya Nair',     'Bangalore', 'Mouse',             'Accessories', 5,   450.00,   50.00,  2200.00,  'Online'),
(5,  '2025-01-06', 'Karan Patel',    'Hyderabad', 'Smartwatch',        'Electronics', 2,  2200.00,  200.00,  4200.00,  'Offline'),
(6,  '2025-01-07', 'Sneha Kapoor',   'Pune',      'Office Desk',       'Furniture',   1,  6800.00,  300.00,  6500.00,  'Online'),
(7,  '2025-01-08', 'Aditya Rao',     'Mumbai',    'USB Cable',         'Accessories', 4,   300.00,    0.00,  1200.00,  'Offline'),
(8,  '2025-01-09', 'Neha Joshi',     'Chennai',   '4K Monitor',        'Electronics', 2, 12500.00,  500.00, 24500.00,  'Online'),
(9,  '2025-01-10', 'Vikram Singh',   'Delhi',     'Notebook Set',      'Stationery',   1,   999.00,    0.00,   999.00,  'Offline'),
(10, '2025-01-11', 'Riya Mehta',     'Mumbai',    'Pen Pack',          'Stationery',   6,   180.00,   60.00,  1020.00,  'Online'),
(11, '2025-01-12', 'Arjun Malhotra', 'Pune',      'Tablet',            'Electronics', 3,  2400.00,  100.00,  7100.00,  'Online'),
(12, '2025-01-13', 'Pooja Shah',     'Bangalore', 'Bookshelf',         'Furniture',   2,  3200.00,  150.00,  6250.00,  'Offline'),
(13, '2025-01-14', 'Kabir Khan',     'Chennai',   'Headphones',        'Electronics', 1, 14500.00,  700.00, 13800.00,  'Online'),
(14, '2025-01-15', 'Isha Gupta',     'Hyderabad', 'Printer',           'Electronics', 2,  7600.00,  600.00, 14600.00,  'Offline'),
(15, '2025-01-16', 'Manish Bhat',    'Delhi',     'Water Bottle',      'Accessories', 4,   950.00,  100.00,  3700.00,  'Online'),
(16, '2025-01-17', 'Saanvi Desai',   'Mumbai',    'Smart TV',          'Electronics', 1, 18000.00, 1000.00, 17000.00,  'Offline'),
(17, '2025-01-18', 'Tanya Roy',      'Pune',      'Diary Pack',        'Stationery',   5,   520.00,  120.00,  2480.00,  'Online'),
(18, '2025-01-19', 'Nikhil Jain',    'Bangalore', 'Router',            'Electronics', 2,  4100.00,  200.00,  8000.00,  'Online'),
(19, '2025-01-20', 'Reyansh Kulkarni','Chennai',   'Gaming Mouse',      'Accessories', 3,  2750.00,  150.00,  8100.00,  'Offline'),
(20, '2025-01-21', 'Ananya Reddy',   'Hyderabad', 'Projector',         'Electronics', 1, 21000.00,  500.00, 20500.00,  'Online');

SELECT * FROM sales_orders;

---Practice Question ---

-- Q1: Display all records sorted by total_amount in descending order.--

SELECT *
FROM sales_orders
ORDER BY total_amount DESC;

-- Q2: Display all records sorted by order_date in ascending order.--

SELECT *
FROM sales_orders
ORDER BY order_date ASC;

-- Q3: Show the top 5 highest-value orders.--

SELECT *
FROM sales_orders
ORDER BY total_amount DESC
LIMIT 5;

-- Q4: Show the 5 cheapest orders in the dataset.--

SELECT *
FROM sales_orders
ORDER BY total_amount ASC
LIMIT 5;

-- Q5: Display only the unique city names present in the table.--

SELECT DISTINCT city
FROM sales_orders;

-- Q6: Display only the unique category names present in the table, sorted alphabetically.--

SELECT DISTINCT category
FROM sales_orders
ORDER BY category ASC;

-- Q7: Show unique combinations of city and category.--

SELECT DISTINCT city, category
FROM sales_orders;

/* Q8: Show all orders from Mumbai, 
sorted by total_amount in descending order and then by order_date in descending order.*/

SELECT *
FROM sales_orders
WHERE city = 'Mumbai'
ORDER BY total_amount DESC, order_date DESC;

-- Q9: Show the next 5 highest-value orders after the top 5.--

SELECT *
FROM sales_orders
ORDER BY total_amount DESC
LIMIT 5 OFFSET 5 ;

/* Q10: Return the first 7 orders sorted by category ascending, 
then total_amount descending, then order_date ascending.*/

SELECT *
FROM sales_orders
ORDER BY category ASC, total_amount DESC, order_date ASC
LIMIT 7;