CREATE TABLE customers
                (
                    id      bigserial not null unique ,
                    name    text,
                    address text,
                    age     int,
                    primary key (id)
                );

CREATE TABLE products
                (
                    id      bigserial not null,
                    name    text,
                    price   int,
                    category text,
                    vendor text,
                    primary key (id)
                );

CREATE TABLE orders
                (
                    id      bigserial not null primary key ,
                    product_id bigserial not null,
                    customer_id bigserial not null,
                    primary key (id),
                    foreign key (product_id) references products (id),
                    foreign key (customer_id) references customers (id)
                );

insert into customers
VALUES (1,'Bob','Tel Aviv Begin',25),
       (2,'Jhon','Hadera Hercel',42),
       (3,'Richard','Haifa Ahaluc',37),
       (4,'Miki','Tira Zait',21),
       (5,'Menashe','Afula Shoham',22),
       (6,'Mark','Nesher Keren Ayasod',35);

insert into Products
VALUES (1,'Washer',2700,'electrical goods','AEG'),
       (2,'Keyboard and mouse',234,'computer','Microsoft'),
       (3,'Dishwasher',1231,'electrical goods','Bosh'),
       (4,'Tableware',652,'kitchen utensils','Neofan'),
       (5,'Bad',3500,'Furniture','Pegas');

insert into orders
VALUES (1,1,1),
       (2,2,1),
       (3,2,1),
       (4,4,2),
       (5,4,2),
       (6,3,2),
       (7,4,3),
       (8,1,4),
       (9,2,5),
       (10,3,1),
       (11,4,3),
       (12,4,2),
       (13,3,4),
       (14,2,1),
       (15,1,2);

SELECT name,c.total_purchases
FROM (select customer_id, count(*) total_purchases
      from orders
      GROUP BY customer_id) c
JOIN customers on customer_id = customers.id
where c.total_purchases = (
                    select count(*)
                    from orders
                    GROUP BY customer_id
                    ORDER BY count(*) desc
                    limit 1
                )

-- 2. most expensive purchase

SELECT name,c.total_purchases
FROM (select customer_id, count(*) total_purchases
      from orders
      GROUP BY customer_id) c
JOIN customers on customer_id = customers.id
where c.total_purchases = (
                    select count(*)
                    from orders
                    GROUP BY customer_id
                    ORDER BY count(*) desc
                    limit 1
                )


