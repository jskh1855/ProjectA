-- **************************************
-- table 생성 순서대로 
-- **************************************

create table category(
	category_no varchar2(100) primary key,
	large_cate varchar2(100) not null,
	medium_cate varchar2(100) not null,
	small_cate varchar2(100) not null,
	category_name varchar2(100) not null
)

create table post(
	product_no varchar2(100) primary key,
	category_no varchar2(100),
	product_name varchar2(100) not null,
	start_price number default 0,
	now_price number default 0,
	product_up_time date,
	bid_end_time date,
	unit_price number,
	give_me_that_price number,
	detail clob,
	member_id varchar2(100) constraint fk_post references a_member(member_id)
)



create table a_member(
	member_id varchar2(100) primary key,
	member_email varchar2(100) not null,
	name varchar2(100) not null,
	password varchar2(100) not null,
	address varchar2(100) not null,
	phoneNo varchar2(100) not null,
	credit varchar2(100) not null,
	bankName varchar2(100) not null,
	accountNo varchar2(100) not null,
	enabled int default 1 not null
)

create table qna(
	qna_no varchar2(100) primary key,
	member_id varchar2(100),
	product_no varchar2(100),
	qna_time date not null,
	qna_type boolean not null,
	qna_content clob not null,
	constraint fk_member_id foreign key(member_id) references a_member(member_id),
	constraint fk_product_no foreign key(product_no) references post(product_no),
)

create table bid_log(
	bid_time date,
	bid_price varchar2(100) not null,
	member_id varchar2(100) constraint fk_bid_id references a_member(member_id),
	product_no varchar2(100) constraint fk_bid_no references post(product_no)
)

create table pick(
	pick_no varchar2(20) primary key,
	pick_time date,
	member_id varchar2(100) constraint fk_pick_id references a_member(member_id),
	product_no varchar2(100) constraint fk_pick_no references post(product_no)
)

-- **************************************
-- table 삭제 순서대로  
-- **************************************

drop table bid_log;
drop table qna;
drop table a_member;
drop table post;
drop table category;
drop table pick;
