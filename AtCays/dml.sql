SELECT tablename
FROM pg_tables
WHERE schemaname = 'public';

insert into products(id, name, price)
values ('001', 'beras', 10000),
       ('002', 'gula', 8000),
       ('003', 'minyak goreng', 12000),
       ('004', 'sabun', 4000),
       ('005', 'shampo', 5000);

insert into products (id, name, price)
values (006, 'kopi bubuk', 15000),(007, 'teh celup', 9000),
       (008, 'susu kental manis', 12000),
       (009, 'mie instan', 3500),
       (010, 'tisu wajah', 8000);

insert into users (id, username, password, role, name, phone, address)
VALUES (1, 'cayott', '12345', 'admin', 'Charlotte Jocelynne', '08123456789', 'Denpasar'),
       (2, 'shifaa', '23456', 'customer', 'Luh Shifa', '08123456789', 'Denpasar'),
       (3, 'nilamm', '23456', 'customer', 'Nilam Marta', '08123456789', 'Denpasar');

insert into users (id, username, password, role, name, phone, address)
values (4, 'dewi', '34567', 'customer', 'Dewi Lestari', '08124567890', 'Gianyar'),
       (5, 'budi', '45678', 'customer', 'Budi Santoso', '08125678901', 'Tabanan'),
       (6, 'wulan', '56789', 'customer', 'Wulan Ayu', '08126789012', 'Denpasar'),
       (7, 'agus', '67890', 'customer', 'Agus Pratama', '08127890123', 'Bangli'),
       (8, 'tiara', '78901', 'customer', 'Tiara Putri', '08128901234', 'Badung'),
       (9, 'eka', '89012', 'customer', 'Eka Widi', '08129012345', 'Denpasar'),
       (10, 'rio', '90123', 'customer', 'Rio Saputra', '08120123456', 'Karangasem'),
       (11, 'lina', '01234', 'customer', 'Lina Sari', '08121234567', 'Buleleng'),
       (12, 'yoga', '11223', 'customer', 'I Made Yoga', '08122345678', 'Denpasar'),
       (13, 'fajar', '22334', 'customer', 'Fajar Nugraha', '08123456780', 'Klungkung');


insert into members (id, user_id, poin)
values (1, 3, 13),
       (2, 2, 9);

insert into members (id, user_id, poin)
values
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

insert into sales (id, user_id, member_id, total, created_at, created_by)
values (1, 2, 1, 19000.00, now(), 2),
       (2, 3, 2, 22000.00, now(), 2);

insert into sales (id, user_id, member_id, total, created_at, created_by)
values (3, 4, 3, 27000.00, NOW(), 2),
       (4, 5, 4, 16000.00, NOW(), 2),
       (5, 6, 5, 35000.00, NOW(), 2),
       (6, 7, 6, 19000.00, NOW(), 2),
       (7, 8, 7, 12000.00, NOW(), 2),
       (8, 9, 8, 28000.00, NOW(), 2),
       (9, 10, 9, 8000.00, NOW(), 2),
       (10, 11, 10, 15000.00, NOW(), 2),
       (11, 12, 11, 25000.00, NOW(), 2),
       (12, 13, 12, 10000.00, NOW(), 2);

select * from sales;


insert into sales_item
(id, sales_id, product_id, product_name, price, qty, subtotal, created_at, created_by, updated_at, updated_by)
values
(1, 1, '001', 'beras', 10000, 1, 10000, NOW(), 2, NOW(), 1),
(2, 1, '004', 'sabun', 4000, 1, 4000, NOW(), 2, NOW(), 1),
(3, 1, '005', 'shampo', 5000, 1, 5000, NOW(), 2, NOW(), 1),
(4, 2, '002', 'gula', 8000, 1, 8000, NOW(), 3, NOW(), 1),
(5, 2, '003', 'minyak goreng', 12000, 1, 12000, NOW(), 3, NOW(), 1),
(6, 2, '004', 'sabun', 4000, 1, 4000, NOW(), 3, NOW(), 1);

insert into sales_item (sales_id, product_id, product_name, price, qty, subtotal, created_at, created_by, updated_at, updated_by)
values (3, '001', 'beras', 10000, 2, 20000, NOW(), 2, NOW(), 1),
       (3, '004', 'sabun', 4000, 1, 4000, NOW(), 2, NOW(), 1),
       (3, '005', 'shampo', 5000, 1, 5000, NOW(), 2, NOW(), 1),
       (4, '002', 'gula', 8000, 2, 16000, NOW(), 2, NOW(), 1),
       (5, '003', 'minyak goreng', 12000, 2, 24000, NOW(), 2, NOW(), 1),
       (5, '009', 'mie instan', 3500, 3, 10500, NOW(), 2, NOW(), 1),
       (6, '010', 'tisu wajah', 8000, 1, 8000, NOW(), 2, NOW(), 1),
       (6, '004', 'sabun', 4000, 2, 8000, NOW(), 2, NOW(), 1),
       (7, '005', 'shampo', 5000, 2, 10000, NOW(), 2, NOW(), 1),
       (8, '006', 'kopi bubuk', 15000, 1, 15000, NOW(), 2, NOW(), 1),
       (8, '007', 'teh celup', 9000, 1, 9000, NOW(), 2, NOW(), 1),
       (9, '009', 'mie instan', 3500, 2, 7000, NOW(), 2, NOW(), 1),
       (10, '004', 'sabun', 4000, 3, 12000, NOW(), 2, NOW(), 1),
       (11, '008', 'susu kental manis', 12000, 2, 24000, NOW(), 2, NOW(), 1),
       (12, '003', 'minyak goreng', 12000, 1, 12000, NOW(), 2, NOW(), 1);

select * from sales_item;

select m.id as member_id, u.name AS member_name, u.username, m.poin
from members as m
join users as u on m.user_id = u.id
where u.role = 'customer';

select count(*) as "Number of members"
from members;

select
u.name as "Name",
SUM(s.total) as "Total",
m.poin as "Poin"
from sales as s
join members as m on s.member_id = m.id
join users as u on s.user_id = u.id
where s.user_id = 12
group by u.name, m.poin;

select
si.product_name AS "Product name",
si.price AS "Price",
SUM(si.qty) AS "Sold Qty",
SUM(si.subtotal) AS "Total Amount"
from sales_item si
group by si.product_name, si.price
order by "Total Amount" desc;

