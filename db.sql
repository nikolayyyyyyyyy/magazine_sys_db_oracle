create table clients(
    "id" number primary key,
    first_name varchar(50) not null,
    middle_name varchar(50) not null,
    last_name varchar(50) not null,
    telephone_number varchar(10) unique not null
);

create table positions(
    "id" number primary key,
    position_type varchar(50) unique not null
);

create table employees(
    "id" number primary key,
    first_name varchar(50) not null,
    middle_name varchar(50) not null,
    last_name varchar(50) not null,
    telephone_number varchar(10) unique not null,
    position_id number not null,
    constraint employee_position foreign key(position_id) references positions("id")
);

create table product_groups(
    "id" number primary key,
    group_type varchar(50) unique not null
);

create table products(
    "id" number primary key,
    "name" varchar(50) unique not null,
    price decimal(18,2) not null,
    product_group_id number not null,
    constraint product_group_fk foreign key (product_group_id) references product_groups("id")
);

create table sales(
    "id" number primary key,
    client_id number not null,
    employee_id number not null,
    "date" date not null,
    price decimal(18,2) not null,
    constraint sales_client foreign key (client_id) references clients("id"),
    constraint sales_employee foreign key (employee_id) references employees("id")
);

create table sales_products(
    product_id number not null,
    sale_id number not null,
    constraint sales_product_id foreign key (product_id) references products("id"),
    constraint sales_sale_id foreign key (sale_id) references sales("id")
);

alter table clients
add constraint ck_client_telephone_length
check (length(telephone_number) = 10);

alter table employees
add constraint ck_employee_telephone_length
check (length(telephone_number) = 10);

create sequence client_seq start with 1 increment by 1;
create sequence position_seq start with 1 increment by 1;
create sequence employee_seq start with 1 increment by 1;
create sequence product_seq start with 1 increment by 1;
create sequence sale_seq start with 1 increment by 1;
create sequence group_seq start with 1 increment by 1;

insert into clients("id",first_name,middle_name,last_name,telephone_number)
    values (client_seq.nextval,'Николай','Христов','Николаев','0822312312');
insert into clients("id",first_name,middle_name,last_name,telephone_number)
    values (client_seq.nextval,'Иван','Димитров','Калимаров','0856327312');
insert into clients("id",first_name,middle_name,last_name,telephone_number)
    values (client_seq.nextval,'Кристиян','Мераков','Иванов','0822442892');
insert into clients("id",first_name,middle_name,last_name,telephone_number)
    values (client_seq.nextval,'Атанас','Атанасов','Генчев','0872312992');
    
insert into positions("id",position_type) values (position_seq.nextval,'Касиер');
insert into positions("id",position_type) values (position_seq.nextval,'Собственик');
insert into positions("id",position_type) values (position_seq.nextval,'Чистач');
insert into positions("id",position_type) values (position_seq.nextval,'Мениджър');

insert into employees("id",first_name,middle_name,last_name,position_id,telephone_number)
    values (employee_seq.nextval,'Христо','Николаев','Христов',1,'0983562008');
insert into employees("id",first_name,middle_name,last_name,position_id,telephone_number)
    values (employee_seq.nextval,'Дияна','Иванова','Радкева',1,'0939999008');
insert into employees("id",first_name,middle_name,last_name,position_id,telephone_number)
    values (employee_seq.nextval,'Иван','Христов','Радкев',1,'0987772008');

insert into product_groups("id",group_type) values (group_seq.nextval,'AAA');
insert into product_groups("id",group_type) values (group_seq.nextval,'BBB');
insert into product_groups("id",group_type) values (group_seq.nextval,'CCC');

insert into products("id","name",price,product_group_id) values (product_seq.nextval,'Бира',2.40,1);
insert into products("id","name",price,product_group_id) values (product_seq.nextval,'Чипс',4.20,3);
insert into products("id","name",price,product_group_id) values (product_seq.nextval,'Вода',1.40,1);
insert into products("id","name",price,product_group_id) values (product_seq.nextval,'Кока Кола',2.30,3);
insert into products("id","name",price,product_group_id) values (product_seq.nextval,'Янълки',1.40,1);
insert into products("id","name",price,product_group_id) values (product_seq.nextval,'Спагети',3.45,2);
insert into products("id","name",price,product_group_id) values (product_seq.nextval,'Кайма',5.45,1);
insert into products("id","name",price,product_group_id) values (product_seq.nextval,'Паста',1.45,3);
insert into products("id","name",price,product_group_id) values (product_seq.nextval,'Кори за баница',1.15,1);
insert into products("id","name",price,product_group_id) values (product_seq.nextval,'Фанта',1.55,3);
insert into products("id","name",price,product_group_id) values (product_seq.nextval,'Газирана вода',1.05,1);
insert into products("id","name",price,product_group_id) values (product_seq.nextval,'Боровец',0.45,3);
insert into products("id","name",price,product_group_id) values (product_seq.nextval,'Кюфтета',2.22,3);
insert into products("id","name",price,product_group_id) values (product_seq.nextval,'Банани',4.15,1);

insert into sales("id",client_id,employee_id,"date",price) values (sale_seq.nextval,1,1,'2024-12-21',12.21);
insert into sales("id",client_id,employee_id,"date",price) values (sale_seq.nextval,2,2,'2024-12-14',100.12);
insert into sales("id",client_id,employee_id,"date",price) values (sale_seq.nextval,3,1,'2024-12-11',1043.21);
insert into sales("id",client_id,employee_id,"date",price) values (sale_seq.nextval,4,3,'2024-12-12',55);

insert into sales_products(product_id,sale_id) values (1,1);
insert into sales_products(product_id,sale_id) values (14,1);
insert into sales_products(product_id,sale_id) values (11,1);
insert into sales_products(product_id,sale_id) values (12,1);
insert into sales_products(product_id,sale_id) values (10,1);
insert into sales_products(product_id,sale_id) values (1,2);
insert into sales_products(product_id,sale_id) values (2,2);
insert into sales_products(product_id,sale_id) values (3,2);
insert into sales_products(product_id,sale_id) values (4,2);
insert into sales_products(product_id,sale_id) values (9,2);
insert into sales_products(product_id,sale_id) values (7,2);
insert into sales_products(product_id,sale_id) values (3,3);
insert into sales_products(product_id,sale_id) values (10,3);
insert into sales_products(product_id,sale_id) values (7,3);
insert into sales_products(product_id,sale_id) values (6,3);
insert into sales_products(product_id,sale_id) values (8,3);
insert into sales_products(product_id,sale_id) values (5,3);
insert into sales_products(product_id,sale_id) values (4,4);
insert into sales_products(product_id,sale_id) values (5,4);
insert into sales_products(product_id,sale_id) values (2,4);
insert into sales_products(product_id,sale_id) values (1,4);
insert into sales_products(product_id,sale_id) values (3,4);
insert into sales_products(product_id,sale_id) values (9,4);

select 
    p."name",
    p.price,
    pg.group_type
from products p
join product_groups pg on pg."id" = p.product_group_id
where p.price = 4.15;

select
    p."name",
    p.price,
    pg.group_type
from products p
join product_groups pg on pg."id" = p.product_group_id
where p."name" = 'Чипс';

select
*
from products p
join product_groups pg on pg."id" =  p.product_group_id
where pg.group_type = 'AAA';

select
    c.first_name,
    c.middle_name,
    c.last_name,
    p."name",
    p.price as "Цена на продукта",
    s."date",
    s.price
from sales s
join sales_products sp on sp.sale_id = s."id"
join products p on sp.product_id = p."id"
join clients c on c."id" = s.client_id
where s."date" between to_date('2024-12-12','yyyy-mm-dd') and to_date('2024-12-21','yyyy-mm-dd');

select
    e.first_name,
    e.middle_name,
    e.last_name,
    p.position_type,
    pr."name",
    s."date"
from sales s
join sales_products sp on sp.sale_id = s."id"
join products pr on pr."id" = sp.product_id
join employees e on e."id" = s.employee_id
join positions p on p."id" = e.position_id
join product_groups pg on pg."id" = pr.product_group_id
where e."id" = 1 or e."id" = 2
order by s."date" desc;

select
    c.first_name || ' ' || c.middle_name || ' ' || c.last_name,
    e.first_name || ' ' || e.middle_name || ' ' || e.last_name,
    p.position_type,
    pg.group_type,
    pr."name",
    pr.price
from sales s 
join sales_products sp on sp.sale_id = s."id"
join products pr on pr."id" = sp.product_id
join employees e on e."id" = s.employee_id
join clients c on c."id" = s.client_id
join positions p on p."id" = e.position_id
join product_groups pg on pg."id" = pr.product_group_id
where c."id" = 3
