START TRANSACTION;

CREATE TABLE admins (
  admin_id int(11) NOT NULL AUTO_INCREMENT,
  username varchar(20) NOT NULL,
  password tinytext NOT NULL,
  PRIMARY KEY (admin_id)
);

CREATE TABLE products (
  product_id int(11) NOT NULL AUTO_INCREMENT,
  name varchar(32) NOT NULL,
  description tinytext DEFAULT NULL,
  price int(11) NOT NULL,
  stock int(10) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY(product_id)
);

CREATE TABLE customers (
  customer_id int(11) NOT NULL AUTO_INCREMENT,
  name tinytext NOT NULL,
  address tinytext NOT NULL,
  PRIMARY KEY (customer_id)
);

CREATE TABLE images (
  product_id int(11) NOT NULL,
  image_id int(11) NOT NULL AUTO_INCREMENT,
  image_path varchar(64) NOT NULL,
  FOREIGN KEY (product_id) REFERENCES products (product_id) ON DELETE CASCADE ON UPDATE CASCADE,
  PRIMARY KEY (image_id)
);

CREATE TABLE orders (
  order_id int(11) NOT NULL AUTO_INCREMENT,
  customer_id int(11) NOT NULL,
  status enum('unpaid','paid','packaged','delivered') NOT NULL DEFAULT 'unpaid',
  time datetime NOT NULL DEFAULT current_timestamp(),
  FOREIGN KEY (customer_id) REFERENCES customers (customer_id),
  PRIMARY KEY (order_id)
);

CREATE TABLE order_items (
  order_id int(11) NOT NULL,
  order_item_id int(11) NOT NULL AUTO_INCREMENT,
  product_id int(11) NOT NULL,
  amount int(10) UNSIGNED NOT NULL,
  FOREIGN KEY (order_id) REFERENCES orders (order_id) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (product_id) REFERENCES products (product_id),
  PRIMARY KEY (order_item_id)
);

COMMIT;