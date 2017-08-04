DROP DATABASE IF EXISTS bamazonDB;
CREATE DATABASE bamazonDB;

USE bamazonDB;



CREATE TABLE products(
  id INT NOT NULL AUTO_INCREMENT,
  product_name VARCHAR(100) NOT NULL,
  department_name VARCHAR(100) NOT NULL,
  price INT default 0,
  stock_quantity VARCHAR(100) NOT NULL,
  PRIMARY KEY (id)
);

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("Pink blush", "Cosmetics", 25, 15);

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("Breakfast At Tiffany's", "Books", 10, 12);

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("Red Lipstick", "Cosmetics", 20, 15);

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("Night Circus", "Books", 10, 10);

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("Spatula", "Kitchen", 10, 25);

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("Plates", "Kitchen", 12,30);

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("Racket", "Sports", 50, 5);

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("Shampoo", "Cosmetics", 10, 25);

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("The Longest Ride", "Books", 12, 10);

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("T-shirt", "Clothes", 10, 5);

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("Pride and Prejudice", "Books", 12, 25);

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("Slaughterhouse Five", "Books", 12, 50);

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("Perfume", "Makeup", 50, 5);

SELECT * FROM products;