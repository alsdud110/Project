select * from member;

select * from manager;

select * from book;

select * from bank;

select * from cart;

select * from buy;

delete from member;
drop table member;

drop table manager;

drop table book;

drop table bank;

drop table cart;

drop table buy;

create table member(
	id varchar(50) not null primary key,
	passwd varchar(16) not null,
	name varchar(10) not null,
	reg_date datetime not null,
	address varchar(100) not null,
	tel varchar(20) not null
);

insert into member values("hongkd@aaa.com","1111","홍길동",now(),"인천시 남동구 정각로 29","010-2222-1234");
insert into member values("aaaa@king.com","1234","박대로",now(),"서울시 마포구 양화로6길 9","010-1111-1111");
insert into member values("kingdora@dragon.com","1234","김개동",now(),"경기도 구리시 아차산로 439","010-3333-3333");
insert into member values("123","123","김개동",now(),"경기도 구리시 아차산로 439","010-3333-3333");

create table manager(
	managerId varchar(50) not null primary key,
	managerPasswd varchar(16) not null
);

insert into manager values("bookmaster@shop.com","123456");

create table book(
	book_id int not null primary key auto_increment,
	book_kind varchar(3) not null,
	book_title varchar(100) not null,
	book_price int not null,
	book_count smallint not null,
	author varchar(40) not null,
	publishing_com varchar(30) not null,
	publishing_date varchar(15) not null,
	book_image varchar(16) default 'nothing.jpg',
	book_content text not null,
	discount_rate tinyint default 10,
	reg_date datetime not null
);

create table bank(
	account varchar(30) not null,
	bank varchar(10) not null,
	name varchar(10) not null
);

insert into bank values("11111-111-11111","내일은행","오내일");

create table cart(
	cart_id int not null primary key auto_increment,
	buyer varchar(50) not null,
	book_id int not null,
	book_title varchar(100) not null,
	buy_price int not null,
	buy_count tinyint not null,
	book_image varchar(16) default 'nothing.jpg'
);

create table buy(
	buy_id bigint not null,
	buyer varchar(50) not null,
	book_id varchar(12) not null,
	book_title varchar(100) not null,
	buy_price int not null,
	buy_count tinyint not null,
	book_image varchar(16) default 'nothing.jpg',
	buy_date datetime not null,
	account varchar(50) not null,
	deliveryName varchar(10) not null,
	deliveryTel varchar(20) not null,
	deliveryAddress varchar(100) not null,
	sanction varchar(10) default '상품 준비중'
);

delete from book;
desc buy;
desc book;