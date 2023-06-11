INSERT INTO hw1 (manufacturer,product_name, product_count, price)
 VALUES
('Apple', 'Iphone 5s', 3, 50000),
('Apple', 'Iphone 6plus', 3, 50000),
('Apple', 'Iphone 8', 1, 50000),
('Sony', 'Xperia', 5, 25000),
('ZTE', 'Blade', 2, 15000),
('Samsung', 'Note 10', 3, 85000),
('Samsung', 'Galaxy 10', 1, 9500);

SELECT * FROM hw1;
SELECT product_name, manufacturer, price from hw1
    WHERE product_count > 2
AND manufacturer = 'Samsung';