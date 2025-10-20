select *
from pg_tables
where schemaname = 'public';

create table products (
    id int not null,
    name varchar(50) not null,
    price decimal (10,2) not null
);

alter table products
    add primary key (id);

select * from products;

create table users (
    id int not null not null,
    username varchar(50) not null,
    password varchar(50) not null,
    role varchar(15) not null,
    name varchar (50) not null,
    phone varchar(20),
    address varchar(100),
    primary key (id)
);

select * from users;

create table members (
    id int not null,
    user_id int not null,
    poin int,
    primary key (id),
    constraint fk_member_user FOREIGN KEY (user_id) REFERENCES users (id)
);
select * from users;

create table sales (
    id bigserial primary key ,
    user_id int not null,
    member_id int,
    total decimal(10,2) not null,
    created_at timestamp not null,
    created_by int not null,
    updated_at timestamp,
    updated_by int,
    constraint fk_sales_user foreign key (user_id) references users (id),
    constraint fk_sales_member foreign key (member_id) references members (id),
    constraint fk_sales_created_by foreign key (created_by) references users (id),
    constraint fk_sales_updated_by foreign key (updated_by) references users (id)
);
select * from sales;

create table sales_item (
    id bigserial primary key,
    sales_id bigint not null,
    product_id int not null,
    product_name varchar(50) not null,
    price decimal(10,2) not null,
    qty smallint not null,
    subtotal decimal(10,2) not null,
    created_at timestamp not null,
    created_by int not null,
    updated_at timestamp,
    updated_by int,
    constraint fk_salesitem_sales foreign key (sales_id) references sales (id),
    constraint fk_salesitem_product foreign key (product_id) references products (id),
    constraint fk_salesitem_created_by foreign key (created_by) references users (id),
    constraint fk_salesitem_updated_by foreign key (updated_by) references users (id)
);

select * from sales_item;

DML

SELECT tablename
FROM pg_tables
WHERE schemaname = 'public';

/*
 add product data to 'product' table with id, name, and price column
 */
insert into products(name, price)
values ('beras', 10000),
       ('gula', 8000),
       ('minyak goreng', 12000),
       ('sabun', 4000),
       ('shampo', 5000),
       ('kopi bubuk', 15000),
       ('teh celup', 9000),
       ( 'susu kental manis', 12000),
       ('mie instan', 3500),
       ('tisu wajah', 8000);



/*
 add users data (customer and admin) to 'users' table for transaction purposes
 */
insert into users (id, username, password, role, name, phone, address)
values (1, 'cayott', '12345', 'admin', 'Charlotte Jocelynne', '08123456789', 'Denpasar'),
       (2, 'shifaa', '23456', 'customer', 'Luh Shifa', '08123456789', 'Denpasar'),
       (3, 'nilamm', '23456', 'customer', 'Nilam Marta', '08123456789', 'Denpasar'),
       (4, 'dewi', '34567', 'customer', 'Dewi Lestari', '08124567890', 'Gianyar'),
       (5, 'budi', '45678', 'customer', 'Budi Santoso', '08125678901', 'Tabanan'),
       (6, 'wulan', '56789', 'customer', 'Wulan Ayu', '08126789012', 'Denpasar'),
       (7, 'agus', '67890', 'customer', 'Agus Pratama', '08127890123', 'Bangli'),
       (8, 'tiara', '78901', 'customer', 'Tiara Putri', '08128901234', 'Badung'),
       (9, 'eka', '89012', 'customer', 'Eka Widi', '08129012345', 'Denpasar'),
       (10, 'rio', '90123', 'customer', 'Rio Saputra', '08120123456', 'Karangasem'),
       (11, 'lina', '01234', 'customer', 'Lina Sari', '08121234567', 'Buleleng'),
       (12, 'yoga', '11223', 'customer', 'I Made Yoga', '08122345678', 'Denpasar'),
       (13, 'fajar', '22334', 'customer', 'Fajar Nugraha', '08123456780', 'Klungkung');

/*
 add membership data to the 'members' table with a relationship to the users table (user_id).
 the points column stores the number of points.
 */
insert into members (id, user_id, poin)
values (1, 3, 13),
       (2, 2, 9),
       (3, 4, 15),
       (4, 5, 10),
       (5, 6, 25),
       (6, 7, 18),
       (7, 8, 9),
       (8, 9, 30),
       (9, 10, 5),
       (10, 11, 11),
       (11, 12, 22),
       (12, 13, 14);

/*
adds the main sales transaction data to the 'sales' table.
the 'total' column is the total transaction value.
 */

insert into sales (id, user_id, member_id, total, created_at, created_by)
values (1, 2, 1, 19000.00, now(), 2),
       (2, 3, 2, 22000.00, now(), 2),
       (3, 4, 3, 27000.00, NOW(), 2),
       (4, 5, 4, 16000.00, NOW(), 2),
       (5, 6, 5, 35000.00, NOW(), 2),
       (6, 7, 6, 19000.00, NOW(), 2),
       (7, 8, 7, 12000.00, NOW(), 2),
       (8, 9, 8, 28000.00, NOW(), 2),
       (9, 10, 9, 8000.00, NOW(), 2),
       (10, 11, 10, 15000.00, NOW(), 2),
       (11, 12, 11, 25000.00, NOW(), 2),
       (12, 13, 12, 10000.00, NOW(), 2);


/*
add item details per transaction to the 'sales_item' table.
each row represents the products purchased in a single transaction.
the 'subtotal' column = price * qty
 */

insert into sales_item
(id, sales_id, product_id, product_name, price, qty, subtotal, created_at, created_by, updated_at, updated_by)
values (1, 1, '001', 'beras', 10000, 1, 10000, NOW(), 2, NOW(), 1),
       (2, 1, '004', 'sabun', 4000, 1, 4000, NOW(), 2, NOW(), 1),
       (3, 1, '005', 'shampo', 5000, 1, 5000, NOW(), 2, NOW(), 1),
       (4, 2, '002', 'gula', 8000, 1, 8000, NOW(), 3, NOW(), 1),
       (5, 2, '003', 'minyak goreng', 12000, 1, 12000, NOW(), 3, NOW(), 1),
       (6, 2, '004', 'sabun', 4000, 1, 4000, NOW(), 3, NOW(), 1),
       (7, 3, '001', 'beras', 10000, 2, 20000, NOW(), 2, NOW(), 1),
       (8, 3, '004', 'sabun', 4000, 1, 4000, NOW(), 2, NOW(), 1),
       (9, 3, '005', 'shampo', 5000, 1, 5000, NOW(), 2, NOW(), 1),
       (10, 4, '002', 'gula', 8000, 2, 16000, NOW(), 2, NOW(), 1),
       (11, 5, '003', 'minyak goreng', 12000, 2, 24000, NOW(), 2, NOW(), 1),
       (12, 5, '009', 'mie instan', 3500, 3, 10500, NOW(), 2, NOW(), 1),
       (13, 6, '010', 'tisu wajah', 8000, 1, 8000, NOW(), 2, NOW(), 1),
       (14, 6, '004', 'sabun', 4000, 2, 8000, NOW(), 2, NOW(), 1),
       (15, 7, '005', 'shampo', 5000, 2, 10000, NOW(), 2, NOW(), 1),
       (16, 8, '006', 'kopi bubuk', 15000, 1, 15000, NOW(), 2, NOW(), 1),
       (17, 8, '007', 'teh celup', 9000, 1, 9000, NOW(), 2, NOW(), 1),
       (18, 9, '009', 'mie instan', 3500, 2, 7000, NOW(), 2, NOW(), 1),
       (19, 10, '004', 'sabun', 4000, 3, 12000, NOW(), 2, NOW(), 1),
       (20, 11, '008', 'susu kental manis', 12000, 2, 24000, NOW(), 2, NOW(), 1),
       (21, 12, '003', 'minyak goreng', 12000, 1, 12000, NOW(), 2, NOW(), 1);

/*
 this query take all members along with their user information.
 it joins the `members` table with the `users` table based on the matching `user_id` and `id` fields.
 only users with the role 'customer' are included in the result.
 */
select m.id as member_id, u.name AS member_name, u.username, m.poin
from members as m
join users as u on m.user_id = u.id
where u.role = 'customer';

/*
this query counts the total number of members in the table "members"using the COUNT() aggregate function.
it returns how many member records exist in the database.
 */
select count(*) as "Number of members"
from members;


/*
 this query take the total spending and point information for a specific user (with user_id = 12).
 it joins the "sales", "members", and "users" tables to display the members name, the total amount they have spent (SUM of sales.total), and their current points (m.poin)
 */
select
u.name as "Name",
SUM(s.total) as "Total",
m.poin as "Poin"
from sales as s
join members as m on s.member_id = m.id
join users as u on s.user_id = u.id
where s.user_id = 12
group by u.name, m.poin;

/*
this query displays product sales statistics for all time.
it uses aggregation to calculate the total quantity sold per product (SUM of qty) and total sales amount per product (SUM of subtotal)
the result is grouped by product name and price, and sorted from the highest to the lowest total sales.
 */
select
si.product_name AS "Product name",
si.price AS "Price",
SUM(si.qty) AS "Sold Qty",
SUM(si.subtotal) AS "Total Amount"
from sales_item si
group by si.product_name, si.price
order by "Total Amount" desc;


