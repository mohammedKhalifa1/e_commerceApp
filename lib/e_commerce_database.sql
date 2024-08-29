create table users(
 users_id int(11) not null auto_increment   
 users_name varchar(50) not null  
 users_password varchar(100) not null    
 users_approved varchar(100) not null    
 primary key(users_id)
)
CREATE table categories(
    categories_id int(11)auto_increment not null,
    categories_name varchar(20) not null,
    categories_items int(11) ,
    primary key(categories_id)
) 
CREATE TABLE items(
    items_id int(11)not null auto_increment,
    items_name varchar(50) not null, 
    items_image varchar(50) not null, 
    items_categories int(11) not null ,
    primary key(items_id),FOREIGN KEY (`items_categories`) REFERENCES `categories`(`categories_id`) 
)
/* ALTER TABLE `items` ADD FOREIGN KEY (`items_categories`) REFERENCES `categories`(`categories_id`)*/
CREATE TABLE favorite(
favorite_id int(11)not null AUTO_INCREMENT,
    favorite_items int(11),
    PRIMARY KEY(favorite_id),FOREIGN KEY(favorite_items) REFERENCES `items`(`items_id`)
)

/* create view table */
CREATE or REPLACE view itemsF AS 
select items.* , favorite.* FROM `items` ,`favorite` WHERE items.items_id = favorite_items 


 /* ========================== items view ======================= */

CREATE or replace view itemsView as 
SELECT items.* , itemssmall.* FROM items , itemssmall WHERE items.items_id = itemssmall.items_items

/* ===============cart view =============== */
CREATE or REPLACE VIEW CartView AS
SELECT cart.* ,items.* FROM cart, items WHERE  cart.Cart_items=items.items_id

/* ===============orders =============== */
create TABLE orders (
orders_id int(11) auto_increment ,
orders_address varchar(200) ,
orders_phone varchar(100),
orders_user int(11),
  primary key(orders_id) ,foreign key(orders_user) REFERENCES `users`(users_id)
) 
ALTER TABLE `orders` ADD `orders_paymentmethode` INT(2) NOT NULL COMMENT '0 => cash | 1=> card | 2=>pay' AFTER `orders_user`;

/* ================== order view=============== */
CREATE or REPLACE VIEW OrderView as 
SELECT cart.* , orders.* ,items.* FROM cart , orders , items WHERE cart.Cart_userId = orders.orders_user AND cart.Cart_items= items.items_id AND cart.cart_status = 1 
GROUP BY orders.orders_id