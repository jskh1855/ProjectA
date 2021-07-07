-- **************************************
-- table 생성 순서대로 
-- **************************************

create table category(
	category_no varchar2(100) primary key,
	large_cate varchar2(100) not null,
	medium_cate varchar2(100) not null,
	small_cate varchar2(100) not null,
	category_name varchar2(100) not null
);
create sequence category_seq;

create table a_member(
	member_id varchar2(100) primary key,
	member_email varchar2(100) not null,
	name varchar2(100) not null,
	profile_image varchar2(100) default 'profile_default.jpg',
	password varchar2(100) not null,
	address varchar2(100) not null,
	phone_no varchar2(100) not null,
	credit varchar2(100) default 'bronze',
	bank_name varchar2(100) not null,
	account_no varchar2(100) not null,	
	enabled int default 1 not null
);

create table a_authorities(
	username varchar(100) not null,
	authority varchar(30) not null,
	constraint fk_a foreign key(username) references a_member(member_id),
	constraint member_a primary key(username,authority)
);

create table post(
	product_no varchar2(100) primary key,
	product_name varchar2(100) not null,
	start_price number default 0,
	now_price number default 0,
	product_up_time date,
	bid_end_time date,
	unit_price number,
	give_me_that_price number,
	detail clob,
	post_image varchar2(100),
	category_no varchar2(100) constraint fk_post_category_no references category(category_no),
	member_id varchar2(100) constraint fk_post references a_member(member_id)
);
create sequence product_no_seq;


create table qna(
	qna_no varchar2(100) primary key,
	qna_time date not null,
	qna_type int default 1 not null,
	qna_content clob not null,
	member_id varchar2(100) constraint fk_member_id references a_member(member_id),
	product_no varchar2(100) constraint fk_product_no references post(product_no)
);

create table bid_log(
	bid_no varchar2(100) primary key,
	bid_time date,
	bid_price varchar2(100) not null,
	member_id varchar2(100) constraint fk_bid_id references a_member(member_id),
	product_no varchar2(100) constraint fk_bid_no references post(product_no)
);
create sequence bid_no_seq;

create table pick(
	pick_no varchar2(20) primary key,
	pick_time date,
	member_id varchar2(100) constraint fk_pick_id references a_member(member_id),
	product_no varchar2(100) constraint fk_pick_no references post(product_no)
);

-- **************************************
-- table 삭제 순서대로  
-- **************************************

drop table pick;
drop table bid_log;
drop table qna;
drop table post;
drop table a_authorities;
drop table a_member;
drop table category;

--sequence 드랍
drop sequence category_seq;
drop sequence product_no_seq;
drop sequence bid_no_seq;

-- **************************************
-- insert ( sample )  
-- **************************************

insert into a_member(member_id, member_email, name, password, address, phone_no, credit, bank_name, account_no, enabled) values('java','a@abc.com','아이유','$2a$10$GrxFYOzS9U3gkV4lHUIX8OWoou7f/FVyPiPKOEuQkeJskanfxxqHO','오리','010-1234-5678', 'gold','국민은행','111-111-1111','1'); 
insert into a_member(member_id, member_email, name, password, address, phone_no, credit, bank_name, account_no, enabled) values('java2','222@abc.com','어른이유','a2','서울','010-1234-2222', 'gold2','국민은행','111-1112222','1');
insert into a_member(member_id, member_email, name, password, address, phone_no, credit, bank_name, account_no, enabled) values('java3','3333@abc.com','학생이유','a3','천안','010-1234-3333', 'gold3','국민은행','111-111-11333','1');

insert into category values(category_seq.nextval, '1','0','0','가전');
insert into category values(category_seq.nextval, '1','1','0','영상가전');
insert into category values(category_seq.nextval, '1','1','1','TV');

insert into post values(product_no_seq.nextval, '롤렉스','2000','2000',sysdate,sysdate+3,'100','4000','afadafad','1','java');
insert into post values(product_no_seq.nextval, '나이키슈즈','300','300',sysdate,sysdate+3,'10','2000','hahaha','1','java2');
insert into post values(product_no_seq.nextval, '롤스로이스','30000','30000',sysdate,sysdate+5,'1000','100000','ㅎㄷㄷ','2','java2');


commit


-- insert into post values(product_no_seq, );

insert into a_authorities(username,authority) values('java','ROLE_MEMBER');

-- **************************************
-- select  
-- **************************************
select * from a_member;
select * from post;
select * from a_authorities;
select * from bid_log;

-- **************************************
-- delete 
-- **************************************
delete from a_member;
delete from a_authorities;





















