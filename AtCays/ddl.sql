select *
from pg_tables
where schemaname = 'public';

create table products (
    id serial not null,
    name varchar(50) not null,
    price decimal (10,2) not null,
    primary key (id)
);


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


create table members (
    id int not null,
    user_id int not null,
    poin int,
    primary key (id),
    constraint fk_member_user FOREIGN KEY (user_id) REFERENCES users (id)
);

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

alter table sales
drop column user_id;

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


