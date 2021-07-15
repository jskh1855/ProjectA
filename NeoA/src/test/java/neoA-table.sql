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

/*
create table post(
	product_no varchar2(100) primary key,
	title varchar2(100) not null,
	product_name varchar2(100) not null,
	start_price number default 0,
	now_price number default 0,
	product_up_time date default sysdate,
	bid_time_unit number default 0,
	bid_end_time date,
	unit_price number,
	give_me_that_price number,
	detail clob,
	post_image varchar2(100),
	category_no varchar2(100) constraint fk_post_category_no references category(category_no),
	member_id varchar2(100) constraint fk_post references a_member(member_id)
);
*/

create table post(
	product_no varchar2(100) primary key,
	title varchar2(100) not null,
	product_name varchar2(100) not null,
	start_price number default 0,
	now_price number default 0,
	product_up_time date default sysdate,
	bid_time_unit number default 0,
	bid_end_time date,
	unit_price number,
	give_me_that_price number,
	detail clob,
	post_image varchar2(100),
	category varchar2(100),
	member_id varchar2(100) constraint fk_post references a_member(member_id)
);

create sequence product_no_seq;

/*
create table qna(
	qna_no varchar2(100) primary key,
	qna_time date not null,
	qna_type int default 1 not null,
	qna_content clob not null,
	member_id varchar2(100) constraint fk_member_id references a_member(member_id),
	product_no varchar2(100) constraint fk_product_no references post(product_no)
);
*/

--qna 테이블 변경 변경, qna_no 와 qna_type 을 복합기본키로. qna_type 이 0이면 질문, 1 이면 대답.
drop table qna;
create table qna (
	qna_no varchar2(100) not null,    
	qna_time date not null,
 	qna_type int not null,
 	qna_content clob not null,
 	member_id varchar2(100) constraint fk_member_id references a_member(member_id),
 	product_no varchar2(100) constraint fk_product_no references post(product_no),
	constraint pk_qna primary key (qna_no, qna_type)
);
create sequence qna_no_seq;

create table bid_log(
	bid_no varchar2(100) primary key,
	bid_time date,
	bid_price varchar2(100) not null,
	member_id varchar2(100) constraint fk_bid_id references a_member(member_id),
	product_no varchar2(100) constraint fk_bid_no references post(product_no)
);
create sequence bid_no_seq;

insert into bid_log values(bid_no_seq.nextval,sysdate,'20000','java','9');
insert into bid_log values(bid_no_seq.nextval,sysdate,'30000','java','8');
insert into bid_log values(bid_no_seq.nextval,sysdate,'30000','java','7');

create table pick(
	pick_no varchar2(20) primary key,
	pick_time date,
	member_id varchar2(100) constraint fk_pick_id references a_member(member_id),
	product_no varchar2(100) constraint fk_pick_no references post(product_no)
);
create sequence pick_no_seq;

insert into pick values(pick_no_seq.nextval,sysdate,'spring','9');
insert into pick values(pick_no_seq.nextval,sysdate,'spring','8');
insert into pick values(pick_no_seq.nextval,sysdate,'spring','7');
insert into pick values(pick_no_seq.nextval,sysdate,'spring','21');
insert into pick values(pick_no_seq.nextval,sysdate,'spring','22');
insert into pick values(pick_no_seq.nextval,sysdate,'spring','22');
insert into pick values(pick_no_seq.nextval,sysdate,'spring','23');
insert into pick values(pick_no_seq.nextval,sysdate,'spring','27');
insert into pick values(pick_no_seq.nextval,sysdate,'spring','28');
insert into pick values(pick_no_seq.nextval,sysdate,'spring','29');
insert into pick values(pick_no_seq.nextval,sysdate,'spring','30');

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
drop sequence pick_no_seq;

-- **************************************
-- insert ( sample )  
-- **************************************

insert into a_member(member_id, member_email, name, password, address, phone_no, credit, bank_name, account_no, enabled) values('java','a@abc.com','아이유','$2a$10$GrxFYOzS9U3gkV4lHUIX8OWoou7f/FVyPiPKOEuQkeJskanfxxqHO','오리','010-1234-5678', 'gold','국민은행','111-111-1111','1'); 
insert into a_member(member_id, member_email, name, password, address, phone_no, credit, bank_name, account_no, enabled) values('java2','222@abc.com','어른이유','a2','서울','010-1234-2222', 'gold2','국민은행','111-1112222','1');
insert into a_member(member_id, member_email, name, password, address, phone_no, credit, bank_name, account_no, enabled) values('java3','3333@abc.com','학생이유','a3','천안','010-1234-3333', 'gold3','국민은행','111-111-11333','1');

insert into category values(category_seq.nextval, '1','0','0','가전');
insert into category values(category_seq.nextval, '1','1','0','영상가전');
insert into category values(category_seq.nextval, '1','1','1','TV');


insert into post values(product_no_seq.nextval, '제목1','롤렉스','2000','2000',sysdate,3,sysdate+3,'100','4000','afadafad','1.jpg','1','spring');
insert into post values(product_no_seq.nextval, '제목2','프라다','2000','2000',sysdate,3,sysdate+3,'100','4000','afadafad','2.jpg','1','spring');
insert into post values(product_no_seq.nextval, '제목3','좋은물건','2000','2000',sysdate,3,sysdate+3,'100','4000','afadafad','3.jpg','1','spring');

insert into post values(product_no_seq.nextval, '제목1','롤렉스','2000','2000',sysdate,3,sysdate+3,'100','4000','afadafad','1.jpg','1','java');
insert into post values(product_no_seq.nextval, '골동품','롤렉스','3000','3000',sysdate,5,sysdate+3,'100','4000','afadafad','1.jpg','1','java');
insert into post values(product_no_seq.nextval, '제목1','롤렉스','2000','2000',sysdate,3,sysdate+3,'100','4000','afadafad','1.jpg','1','java');

insert into post values(product_no_seq.nextval, '제목2','나이키슈즈','300','300',sysdate,3,sysdate+3,'10','2000','hahaha','2.jpg','1','java2');
insert into post values(product_no_seq.nextval, '제목3','롤스로이스','30000','30000',sysdate,5,sysdate+5,'1000','100000','ㅎㄷㄷ','3.jpg','2','java2');
insert into post values(product_no_seq.nextval, '한번신은','아디다스슈즈','300','300',sysdate,7,sysdate+7,'10','2000','hahaha','4.jpg','1','java2');
insert into post values(product_no_seq.nextval, '제목5','람보','30000','30000',sysdate,5,sysdate+5,'1000','100000','ㅎㄷㄷ','5.jpg','2','java2');
insert into post values(product_no_seq.nextval, '제목6','컨버스슈즈','300','300',sysdate,3,sysdate+3,'10','2000','hahaha','6.jpg','1','java2');
insert into post values(product_no_seq.nextval, '제목7','페라리','30000','30000',sysdate,5,sysdate+5,'1000','100000','ㅎㄷㄷ','7.jpg','2','java2');
insert into post values(product_no_seq.nextval, '제목8','파텍필립','300','300',sysdate,4,sysdate+4,'10','2000','hahaha','8.jpg','1','java2');
insert into post values(product_no_seq.nextval, '제목9','라페라리','30000','30000',sysdate,4,sysdate+4,'1000','100000','ㅎㄷㄷ','9.jpg','2','java2');
insert into post values(product_no_seq.nextval, '제목10','롤렉스','2000','2000',sysdate,2,sysdate+2,'100','4000','afadafad','10.jpg','1','java');

insert into post values(product_no_seq.nextval, '제목11','롤렉스','2000','2000',sysdate+3,'100','4000','afadafad','11.jpg','1','java');
insert into post values(product_no_seq.nextval, '제목12','나이키슈즈','300','300',sysdate+3,'10','2000','hahaha','12.jpg','1','java');
insert into post values(product_no_seq.nextval, '제목13','롤스로이스','30000','30000',sysdate,sysdate+5,'1000','100000','ㅎㄷㄷ','13.jpg','2','java');
insert into post values(product_no_seq.nextval, '제목14','아디다스슈즈','300','300',sysdate,sysdate+3,'10','2000','hahaha','14.jpg','1','java');
insert into post values(product_no_seq.nextval, '제목15','람보','30000','30000',sysdate,sysdate+5,'1000','100000','ㅎㄷㄷ','15.jpg','2','java');
insert into post values(product_no_seq.nextval, '제목16','컨버스슈즈','300','300',sysdate,sysdate+3,'10','2000','hahaha','16.jpg','1','java');
insert into post values(product_no_seq.nextval, '제목17','페라리','30000','30000',sysdate,sysdate+5,'1000','100000','ㅎㄷㄷ','17.jpg','2','java');
insert into post values(product_no_seq.nextval, '제목18','파텍필립','300','300',sysdate,sysdate+3,'10','2000','hahaha','18.jpg','1','java2');
insert into post values(product_no_seq.nextval, '제목19','라페라리','30000','30000',sysdate,sysdate+5,'1000','100000','ㅎㄷㄷ','19.jpg','2','java');
insert into post(product_no,title,product_name,start_price,now_price,bid_time_unit,bid_end_time,unit_price,give_me_that_price,detail,post_image,category,member_id)
values(product_no_seq.nextval,'제목', '로골','1000','1000','2',sysdate+2,'100','10000','ㅗㅜㅑ','rg.img','가전노트북맥북','java');


insert into bid_log values(bid_no_seq.nextval, sysdate,'30000','java','9');

insert into bid_log values(bid_no_seq.nextval, sysdate,'30000','kobos','9');

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
select * from pick;
select * from qna;

-- **************************************
-- delete 
-- **************************************
delete from a_member;
delete from a_authorities;
delete from post;
delete from  bid_log;
delete from  pick;




















