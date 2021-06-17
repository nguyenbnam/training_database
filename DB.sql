-- 1: Liệt kê danh sách khách hàng
SELECT  id, name, address, email FROM training_mw.customers;
-- 2: liệt kê danh sách sản phẩm được tạo trong tháng 
SELECT  * FROM training_mw.products WHERE MONTH(cdate) = MONTH(CURDATE()) ;
-- 3: Liệt kê số lượng khách hàng trong từng tháng của năm 2021  
SELECT MONTH(cdate), COUNT(name) FROM training_mw.customers GROUP BY MONTH(cdate) ; 
-- 4: liệt kê danh sách 5 khách hàng có tổng tiền mua hàng lớn nhất; // sắp xếp từ to -> bé r lấy  select n theo limit=10
select  customers.name, sum(unit_price) from training_mw.invoice_lines 
inner join training_mw.invoices on invoice_lines.invoice_id = invoices.id  
inner join training_mw.customers on invoices.customer_id = customers.id
group by customers.name
order by sum(unit_price) desc  limit 3;
-- 5: liệt kê danh sách 5 sản phẩm được mua nhiều nhất : 
select products.name, count(product_id) from training_mw.invoice_lines 
inner join training_mw.products
on invoice_lines.product_id = products.id
group by products.name
order by count(product_id) desc limit 5;
-- 6: liệt kê khách hàng cùng số lần mua hàng của họ 
SELECT customers.name, count(customer_id)  FROM training_mw.customers 
INNER JOIN training_mw.invoices 
ON customers.id = invoices.customer_id 
group by customers.name; 
-- 7: thống kê tổng tiền thu được trong từng tháng của năm 2021
 SELECT MONTH(invoices.date), SUM(unit_price)  
 FROM training_mw.invoice_lines 
 INNER JOIN training_mw.invoices ON invoice_lines.invoice_id = invoices.id 
 group by invoices.date; 
-- 8: Tìm 'số sản phẩm bán được' bán trong tháng 3
select count(invoice_lines.product_id) from training_mw.products 
join training_mw.invoice_lines on products.id=invoice_lines.product_id
where month(cdate) = 3
-- 9: Liệt kê danh sách 3 khách hàng mà không mua hàng trong 6 tháng gần nhất./.
-- select * from training_mw.customers
-- 	inner join training_mw.invoices on customers.id=invoices.customer_id
--     where (year(curdate())-year(invoices.date)>1) or (year(curdate())-year(invoices.date)=0 and month(curdate())-month(invoices.date)>=5) 
-- hàm mới bài 9: 3 thang gan nhat 
select * from training_mw.customers
inner join training_mw.invoices on customers.id = invoices.customer_id
where  DATEDIFF(curdate(), invoices.date) > 100;

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
Alter table training_mw.invoices add constraint FK_id_customer		foreign key (customer_id)		references training_mw.customers(id);
Alter table training_mw.invoice_lines add constraint FK_id_invoice		foreign key (invoice_id)		references training_mw.invoices(id);
Alter table training_mw.invoice_lines add constraint FK_id_product		foreign key (product_id)		references training_mw.products(id);


/**
* add infor
*/

-- customers
INSERT INTO `training_mw`.`customers`(`name`, `address`, `email`, `cdate`, `mdate` ) VALUES ('nam1','hn0', 'abc@123', '2021-06-15', '2021-06-17');
INSERT INTO `training_mw`.`customers`( `name`, `address`, `email`, `cdate`, `mdate`) VALUES ('nam2','hn1','nam@123','2021-06-15','2021-06-19');
INSERT INTO `training_mw`.`customers`( `name`, `address`, `email`, `cdate`, `mdate`) VALUES ('nam3','hn2','nam@123','2021-06-15','2021-06-19');
INSERT INTO `training_mw`.`customers`( `name`, `address`, `email`, `cdate`, `mdate`) VALUES ('nam4','hn3','nam@123','2021-06-15','2021-06-19');
INSERT INTO `training_mw`.`customers`( `name`, `address`, `email`, `cdate`, `mdate`) VALUES ('nam5','hn4','nam@123','2021-04-15','2021-06-19');
INSERT INTO `training_mw`.`customers`( `name`, `address`, `email`, `cdate`, `mdate`) VALUES ('nam6','hn5','nam@123','2021-05-15','2021-06-19');
INSERT INTO `training_mw`.`customers`( `name`, `address`, `email`, `cdate`, `mdate`) VALUES ('nam7','hn5','nam@123','2021-06-15','2021-06-19');
INSERT INTO `training_mw`.`customers`( `name`, `address`, `email`, `cdate`, `mdate`) VALUES ('nam8','hn5','nam@123','2021-03-15','2021-06-19');

-- products
INSERT INTO `training_mw`.`products`( `name`, `qty`, `price`, `cdate`, `mdate`) VALUES ('sp1', 20, 12.000, '2021-06-15', '2021-06-17');
INSERT INTO `training_mw`.`products`( `name`, `qty`, `price`, `cdate`, `mdate`) VALUES ('sp2', 56, 15.000,'2021-05-15','2021-06-19');
INSERT INTO `training_mw`.`products`( `name`, `qty`, `price`, `cdate`, `mdate`) VALUES ('sp3', 10, 16.000,'2021-04-14','2021-06-19');
INSERT INTO `training_mw`.`products`( `name`, `qty`, `price`, `cdate`, `mdate`) VALUES ('sp4', 20, 30.000,'2021-06-10','2021-06-19');
INSERT INTO `training_mw`.`products`( `name`, `qty`, `price`, `cdate`, `mdate`) VALUES ('sp5', 100, 100.000,'2021-06-11','2021-06-19');
INSERT INTO `training_mw`.`products`( `name`, `qty`, `price`, `cdate`, `mdate`) VALUES ('sp6', 50, 200.000,'2021-03-1','2021-06-19');
INSERT INTO `training_mw`.`products`( `name`, `qty`, `price`, `cdate`, `mdate`) VALUES ('sp7', 50, 200.000,'2021-02-10','2021-06-19');
INSERT INTO `training_mw`.`products`( `name`, `qty`, `price`, `cdate`, `mdate`) VALUES ('sp8', 50, 200.000,'2021-01-13','2021-06-19');
INSERT INTO `training_mw`.`products`( `name`, `qty`, `price`, `cdate`, `mdate`) VALUES ('sp9', 50, 200.000,'2021-06-12','2021-06-19');

-- invoices 
INSERT INTO `training_mw`.`invoices`( `date`, `customer_id`, `cdate`, `mdate`) VALUES ('2021-05-16', 1,'2021-04-12','2021-06-19');
INSERT INTO `training_mw`.`invoices`( `date`, `customer_id`, `cdate`, `mdate`) VALUES ('2021-02-16', 2,'2021-04-12','2021-06-19');
INSERT INTO `training_mw`.`invoices`( `date`, `customer_id`, `cdate`, `mdate`) VALUES ('2021-01-16', 3,'2021-02-12','2021-06-19');
INSERT INTO `training_mw`.`invoices`( `date`, `customer_id`, `cdate`, `mdate`) VALUES ('2021-01-16', 4,'2021-06-12','2021-06-19');
INSERT INTO `training_mw`.`invoices`( `date`, `customer_id`, `cdate`, `mdate`) VALUES ('2021-03-16', 5,'2021-05-12','2021-06-19');
INSERT INTO `training_mw`.`invoices`( `date`, `customer_id`, `cdate`, `mdate`) VALUES ('2021-04-16', 6,'2021-01-12','2021-06-19');
INSERT INTO `training_mw`.`invoices`( `date`, `customer_id`, `cdate`, `mdate`) VALUES ('2021-06-15', 7,'2021-03-12','2021-06-19');
INSERT INTO `training_mw`.`invoices`( `date`, `customer_id`, `cdate`, `mdate`) VALUES ('2021-01-15', 8,'2021-05-12','2021-06-19');
INSERT INTO `training_mw`.`invoices`( `date`, `customer_id`, `cdate`, `mdate`) VALUES ('2021-02-1', 9,'2021-04-12','2021-06-19');

-- invoice_lines
INSERT INTO `training_mw`.`invoice_lines`( `invoice_id`, `product_id`, `qty`, `unit_price`) VALUES ( 1, 1,50, 500.000);
INSERT INTO `training_mw`.`invoice_lines`( `invoice_id`, `product_id`, `qty`, `unit_price`) VALUES ( 2, 2,50, 500.000);
INSERT INTO `training_mw`.`invoice_lines`( `invoice_id`, `product_id`, `qty`, `unit_price`) VALUES ( 1, 3,50, 500.000);
INSERT INTO `training_mw`.`invoice_lines`( `invoice_id`, `product_id`, `qty`, `unit_price`) VALUES ( 3, 4,50, 500.000);
INSERT INTO `training_mw`.`invoice_lines`( `invoice_id`, `product_id`, `qty`, `unit_price`) VALUES ( 5, 2,50, 500.000);
INSERT INTO `training_mw`.`invoice_lines`( `invoice_id`, `product_id`, `qty`, `unit_price`) VALUES ( 10, 5,50, 500.000);
INSERT INTO `training_mw`.`invoice_lines`( `invoice_id`, `product_id`, `qty`, `unit_price`) VALUES ( 8, 6,50, 500.000);
INSERT INTO `training_mw`.`invoice_lines`( `invoice_id`, `product_id`, `qty`, `unit_price`) VALUES ( 6, 7,50, 500.000);






