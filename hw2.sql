CREATE DATABASE hw2;
USE hw2;
CREATE TABLE sales
(
id SERIAL PRIMARY KEY,
order_date DATE NOT NULL,
count_product INT UNSIGNED NOT NULL
);
INSERT INTO sales (order_date, count_product) VALUES
('2022-01-01', 156), 
('2022-01-02', 180),
('2022-01-03', 21),
('2022-01-04', 124),
('2022-01-05', 341);
SELECT * FROM hw2.sales;

# Сгруппируйте значений количества в 3 сегмента — меньше 100, 100-300 и больше 300, используя функцию IF.

SELECT id AS "id заказа",
CASE
	WHEN count_product < 100 THEN 'Маленький заказ'
    WHEN count_product BETWEEN 100 AND 300 THEN 'Средний заказ'
    WHEN count_product > 300 THEN 'Большой заказ'
END AS 'Тип заказа'
FROM sales;

-- Создайте таблицу “orders”, заполните ее значениями. 
-- Покажите “полный” статус заказа, используя оператор CASE

DROP TABLE IF EXISTS orders;
CREATE TABLE orders
(
	id SERIAL PRIMARY KEY,
    employee_id VARCHAR(6) NOT NULL,
    amount DECIMAL(9, 2) NOT NULL,
    order_status VARCHAR(10) NOT NULL
);

INSERT INTO orders (employee_id, amount, order_status) VALUES
("e03", 15.00, "OPEN"),
("e01", 25.50, "OPEN"),
("e05", 100.70, "CLOSED"),
("e02", 22.18, "OPEN"),
("e04", 9.50, "CANCELLED");

SELECT * FROM orders;
  