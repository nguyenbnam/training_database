-- CREAT DATBASE NAME  training_mw 
CREATE DATABASE IF NOT EXISTS `training_mw`;
/**
* create customer
*/
CREATE TABLE IF NOT EXISTS `training_mw`.`customer`(
	`id` INT NOT NULL, 
    `name` VARCHAR(255), 
    `address` VARCHAR(255), 
    `email` VARCHAR(255), 
    `cdate` DATETIME, 
    `mdate` DATETIME
)ENGINE = InnoDB CHARSET = utf8;
/**
* create invoices 
*/
CREATE TABLE IF NOT EXISTS `training_mw`.`invoices`(
	`id` INT NOT NULL AUTO_INCREMENT, 
    `date` DATETIME NOT NULL, 
    `customer_id` INT NOT NULL , 
    `cdate` DATETIME NOT NULL, 
    `mdate` DATETIME NOT NULL
) ENGINE = InnoDB CHARSET = utf8;
/**
* create invoice_lines
*/
CREATE TABLE IF NOT EXISTS `training_mw`.`invoice_lines` (
	`id` INT NOT NULL AUTO_INCREMENT, 
    `invoices_id` INT NOT NULL, 
    `product_id` INT NOT NULL, 
    `qty` INT NOT NULL, 
    `unit_price` FLOAT NOT NULL
)ENGINE = InnoDB CHARSET = utf8;
/**
* create products 
*/
CREATE TABLE IF NOT EXISTS `training_mw`.`products` (
	`id` INT NOT NULL AUTO_INCREMENT, 
    `name` VARCHAR(255) NOT NULL, 
    `qty` INT NOT NULL, 
    `price` FLOAT NOT NULL, 
    `cdate` DATETIME NOT NULL, 
    `mdate` DATETIME NOT NULL
)ENGINE = InnoDB CHARSET = utf8; 

/**
* ADD PRIMARY KEY 
*/
-- ALTER TABLE `training_mw` ADD PRIMARY KEY(`id`);
-- ALTER TABLE `training_mw` ADD PRIMARY KEY(`id`);
-- ALTER TABLE `training_mw` ADD PRIMARY KEY(`id`);
-- ALTER TABLE `training_mw` ADD PRIMARY KEY(`id`);
