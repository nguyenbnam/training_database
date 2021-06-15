-- CREAT DATBASE NAME  training_mw 
CREATE DATABASE IF NOT EXISTS `training_mw`;
/**
* create customer
*/
CREATE TABLE IF NOT EXISTS `training_mw`.`customers`(
	`id` INT NOT NULL , 
    `name` VARCHAR(255), 
    `address` VARCHAR(255), 
    `email` VARCHAR(255), 
    `cdate` DATE, 
    `mdate` DATE
)ENGINE = InnoDB  CHARSET = utf8;
/**
* create invoices 
*/
CREATE TABLE IF NOT EXISTS `training_mw`.`invoices`(
	`id` INT NOT NULL, 
    `date` DATETIME NOT NULL, 
    `customer_id` INT NOT NULL , 
    `cdate` DATE NOT NULL, 
    `mdate` DATE NOT NULL
) ENGINE = InnoDB  CHARSET = utf8;
/**
* create invoice_lines
*/
CREATE TABLE IF NOT EXISTS `training_mw`.`invoice_lines`(
	`id` INT NOT NULL , 
    `invoice_id` INT NOT NULL, 
    `product_id` INT NOT NULL, 
    `qty` INT NOT NULL, 
    `unit_price` FLOAT NOT NULL
)ENGINE = InnoDB   CHARSET = utf8;
/**
* create products 
*/
CREATE TABLE IF NOT EXISTS `training_mw`.`products` (
	`id` INT NOT NULL , 
    `name` VARCHAR(255) NOT NULL, 
    `qty` INT NOT NULL, 
    `price` FLOAT NOT NULL, 
    `cdate` DATE NOT NULL, 
    `mdate` DATE NOT NULL
)ENGINE = InnoDB CHARSET = utf8; 

/**
* ADD PRIMARY KEY 
*/
ALTER TABLE `training_mw`.`customers` ADD PRIMARY KEY(`id`);
ALTER TABLE `training_mw`.`invoices` ADD PRIMARY KEY(`id`);
ALTER TABLE `training_mw`.`invoice_lines` ADD PRIMARY KEY(`id`);
ALTER TABLE `training_mw`.`products` ADD PRIMARY KEY(`id`);



ALTER TABLE `training_mw`.`customers` CHANGE `id` `id` INT(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `training_mw`.`invoices` CHANGE `id` `id` INT(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `training_mw`.`invoice_lines` CHANGE `id` `id` INT(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `training_mw`.`products` CHANGE `id` `id` INT(11) NOT NULL AUTO_INCREMENT;

-- khoa ngoai
ALTER TABLE `training_mw`.`invoices` ADD CONSTRAINT `id_customer` FOREIGN KEY (`customer_id`) REFERENCES `training_mw`.`customers`(`id`);
ALTER TABLE `training_mw`.`invoice_lines` ADD CONSTRAINT `id_invoice` FOREIGN KEY (`invoice_id`) REFERENCES `training_mw`.`invoices`(`id`);
ALTER TABLE `training_mw`.`invoice_lines` ADD CONSTRAINT `id_products_` FOREIGN KEY (`product_id`) REFERENCES `training_mw`.`products`(`id`);

/**
* add infor
*/
-- customers
INSERT INTO `training_mw`.`customers`(`id`,`name`, `address`, `email`, `cdate`, `mdate` ) VALUES ('1','nam1','hn0', 'abc@123', '2021-06-15', '2021-06-17');
INSERT INTO `training_mw`.`customers`(`id`, `name`, `address`, `email`, `cdate`, `mdate`) VALUES ('2','nam2','hn1','nam@123','2021-06-15','2021-06-19');
INSERT INTO `training_mw`.`customers`(`id`, `name`, `address`, `email`, `cdate`, `mdate`) VALUES ('3','nam3','hn2','nam@123','2021-06-15','2021-06-19');
INSERT INTO `training_mw`.`customers`(`id`, `name`, `address`, `email`, `cdate`, `mdate`) VALUES ('4','nam4','hn3','nam@123','2021-06-15','2021-06-19');
INSERT INTO `training_mw`.`customers`(`id`, `name`, `address`, `email`, `cdate`, `mdate`) VALUES ('5','nam5','hn4','nam@123','2021-04-15','2021-06-19');
INSERT INTO `training_mw`.`customers`(`id`, `name`, `address`, `email`, `cdate`, `mdate`) VALUES ('6','nam6','hn5','nam@123','2021-05-15','2021-06-19');
INSERT INTO `training_mw`.`customers`(`id`, `name`, `address`, `email`, `cdate`, `mdate`) VALUES ('7','nam7','hn5','nam@123','2021-06-15','2021-06-19');
INSERT INTO `training_mw`.`customers`(`id`, `name`, `address`, `email`, `cdate`, `mdate`) VALUES ('8','nam8','hn5','nam@123','2021-03-15','2021-06-19');

-- products
INSERT INTO `training_mw`.`products`(`id`, `name`, `qty`, `price`, `cdate`, `mdate`) VALUES ('1','sp1', 20, 12.000, '2021-06-15', '2021-06-17');
INSERT INTO `training_mw`.`products`(`id`, `name`, `qty`, `price`, `cdate`, `mdate`) VALUES ('2','sp2', 56, 15.000,'2021-05-15','2021-06-19');
INSERT INTO `training_mw`.`products`(`id`, `name`, `qty`, `price`, `cdate`, `mdate`) VALUES ('3','sp3', 10, 16.000,'2021-04-14','2021-06-19');
INSERT INTO `training_mw`.`products`(`id`, `name`, `qty`, `price`, `cdate`, `mdate`) VALUES ('4','sp4', 20, 30.000,'2021-06-10','2021-06-19');
INSERT INTO `training_mw`.`products`(`id`, `name`, `qty`, `price`, `cdate`, `mdate`) VALUES ('5','sp5', 100, 100.000,'2021-06-11','2021-06-19');
INSERT INTO `training_mw`.`products`(`id`, `name`, `qty`, `price`, `cdate`, `mdate`) VALUES ('6','sp6', 50, 200.000,'2021-03-1','2021-06-19');
INSERT INTO `training_mw`.`products`(`id`, `name`, `qty`, `price`, `cdate`, `mdate`) VALUES ('7','sp7', 50, 200.000,'2021-02-10','2021-06-19');
INSERT INTO `training_mw`.`products`(`id`, `name`, `qty`, `price`, `cdate`, `mdate`) VALUES ('8','sp8', 50, 200.000,'2021-01-13','2021-06-19');
INSERT INTO `training_mw`.`products`(`id`, `name`, `qty`, `price`, `cdate`, `mdate`) VALUES ('9','sp9', 50, 200.000,'2021-06-12','2021-06-19');

-- invoices 
INSERT INTO `training_mw`.`invoices`(`id`, `date`, `customer_id`, `cdate`, `mdate`) VALUES (1,'2021-05-16', 1,'2021-04-12','2021-06-19');
INSERT INTO `training_mw`.`invoices`(`id`, `date`, `customer_id`, `cdate`, `mdate`) VALUES (2,'2021-02-16', 2,'2021-04-12','2021-06-19');
INSERT INTO `training_mw`.`invoices`(`id`, `date`, `customer_id`, `cdate`, `mdate`) VALUES (3,'2021-01-16', 3,'2021-02-12','2021-06-19');
INSERT INTO `training_mw`.`invoices`(`id`, `date`, `customer_id`, `cdate`, `mdate`) VALUES (4,'2021-01-16', 4,'2021-06-12','2021-06-19');
INSERT INTO `training_mw`.`invoices`(`id`, `date`, `customer_id`, `cdate`, `mdate`) VALUES (5,'2021-03-16', 5,'2021-05-12','2021-06-19');
INSERT INTO `training_mw`.`invoices`(`id`, `date`, `customer_id`, `cdate`, `mdate`) VALUES (6,'2021-04-16', 6,'2021-01-12','2021-06-19');
INSERT INTO `training_mw`.`invoices`(`id`, `date`, `customer_id`, `cdate`, `mdate`) VALUES (7,'2021-06-15', 7,'2021-03-12','2021-06-19');
INSERT INTO `training_mw`.`invoices`(`id`, `date`, `customer_id`, `cdate`, `mdate`) VALUES (8,'2021-01-15', 8,'2021-05-12','2021-06-19');
INSERT INTO `training_mw`.`invoices`(`id`, `date`, `customer_id`, `cdate`, `mdate`) VALUES (9,'2021-02-1', 9,'2021-04-12','2021-06-19');

-- invoice_lines
INSERT INTO `training_mw`.`invoice_lines`(`id`, `invoices_id`, `product_id`, `qty`, `unit_price`) VALUES (1, 22222, 111212,50, 500.000);
INSERT INTO `training_mw`.`invoice_lines`(`id`, `invoices_id`, `product_id`, `qty`, `unit_price`) VALUES (2, 12111, 120202,50, 500.000);
INSERT INTO `training_mw`.`invoice_lines`(`id`, `invoices_id`, `product_id`, `qty`, `unit_price`) VALUES (3, 22100, 504234,50, 500.000);
INSERT INTO `training_mw`.`invoice_lines`(`id`, `invoices_id`, `product_id`, `qty`, `unit_price`) VALUES (4, 23000, 654746,50, 500.000);
INSERT INTO `training_mw`.`invoice_lines`(`id`, `invoices_id`, `product_id`, `qty`, `unit_price`) VALUES (5, 502001, 52544,50, 500.000);
INSERT INTO `training_mw`.`invoice_lines`(`id`, `invoices_id`, `product_id`, `qty`, `unit_price`) VALUES (6, 320102, 65254,50, 500.000);
INSERT INTO `training_mw`.`invoice_lines`(`id`, `invoices_id`, `product_id`, `qty`, `unit_price`) VALUES (7, 802121, 88745,50, 500.000);
INSERT INTO `training_mw`.`invoice_lines`(`id`, `invoices_id`, `product_id`, `qty`, `unit_price`) VALUES (8, 989014, 99968,50, 500.000);


-- 1: Liệt kê danh sách khách hàng
-- SELECT  `id`, `name`, `address`, `email` FROM `training_mw`.`customers`;
-- 2: liệt kê danh sách sản phẩm được tạo trong tháng 
-- SELECT  * FROM `training_mw`.`products` WHERE MONTH(cdate) = MONTH(CURDATE()) ;
-- 3: Liệt kê số lượng khách hàng trong từng tháng của năm 2021  
-- SELECT * FROM `training_mw`.`customers` WHERE MONTH(cdate) = 6; 
-- 4: liệt kê danh sách 10 khách hàng có tổng tiền mua hàng lớn nhất; // sắp xếp từ to -> bé r lấy  select n theo limit=10
-- SELECT * FROM `training_mw`.`customers` ORDER BY `training_mw`.`invoice_lines`(`unit_price`) ASC ;
-- 5: liệt kê danh sách 10 sản phẩm được mua nhiều nhất : 
-- 6: liệt kê khách hàng cùng số lần mua hàng của họ 
-- 7: thống kê tổng tiền thu được trong từng tháng của năm 2021
-- 8: Tìm số sản phẩm được bán nhiều trong tháng 3 trong năm 2021 mà được tạo tháng 2/2021
-- 9: Liệt kê danh sách các khách hàng mà không mua hàng trong 6 tháng gần nhất./.