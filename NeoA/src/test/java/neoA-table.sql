-- **************************************
-- table ?ì„± ?œì„œ?€ë¡? 
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
create sequence product_no_seq;





--create table qna(
--	qna_no varchar2(100) primary key,
--	qna_time date not null,
--	qna_type int default 1 not null,
--	qna_content clob not null,
--	member_id varchar2(100) constraint fk_member_id references a_member(member_id),
--	product_no varchar2(100) constraint fk_product_no references post(product_no)
--);

-- qna ?Œì´ë¸? ë³€ê²?
drop table qna;
/*
create table qna(
	qna_no varchar2(100) not null,
	qna_time date not null,
	qna_type int not null,
	qna_content clob not null,
	member_id varchar2(100) constraint fk_member_id references a_member(member_id),
	product_no varchar2(100) constraint fk_product_no references post(product_no),
);
*/

--qna ?Œì´ë¸? ë³€ê²? ë³€ê²?, qna_no ?€ qna_type ?? ë³µí•©ê¸°ë³¸?¤ë¡œ. qna_type ?? 0?´ë©´ ì§ˆë¬¸, 1 ?´ë©´ ?€??.
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

insert into bid_log values(bid_no_seq.nextval,sysdate,'20000','spring','9');
insert into bid_log values(bid_no_seq.nextval,sysdate,'30000','spring','8');
insert into bid_log values(bid_no_seq.nextval,sysdate,'30000','spring','7');

create table pick(
	pick_no varchar2(20) primary key,
	pick_time date,
	member_id varchar2(100) constraint fk_pick_id references a_member(member_id),
	product_no varchar2(100) constraint fk_pick_no references post(product_no)
);

-- **************************************
-- table ?? œ ?œì„œ?€ë¡?  
-- **************************************

drop table pick;
drop table bid_log;
drop table qna;
drop table post;
drop table a_authorities;
drop table a_member;
drop table category;

--sequence ?œë
drop sequence category_seq;
drop sequence product_no_seq;
drop sequence bid_no_seq;

-- **************************************
-- insert ( sample )  
-- **************************************

insert into a_member(member_id, member_email, name, password, address, phone_no, credit, bank_name, account_no, enabled) values('java','a@abc.com','?„ì´??','$2a$10$GrxFYOzS9U3gkV4lHUIX8OWoou7f/FVyPiPKOEuQkeJskanfxxqHO','?¤ë¦¬','010-1234-5678', 'gold','êµ???€??','111-111-1111','1'); 
insert into a_member(member_id, member_email, name, password, address, phone_no, credit, bank_name, account_no, enabled) values('java2','222@abc.com','?´ë¥¸?´ìœ ','a2','?œìš¸','010-1234-2222', 'gold2','êµ???€??','111-1112222','1');
insert into a_member(member_id, member_email, name, password, address, phone_no, credit, bank_name, account_no, enabled) values('java3','3333@abc.com','?™ìƒ?´ìœ ','a3','ì²œì•ˆ','010-1234-3333', 'gold3','êµ???€??','111-111-11333','1');

insert into category values(category_seq.nextval, '1','0','0','ê°€??');
insert into category values(category_seq.nextval, '1','1','0','?ìƒê°€??');
insert into category values(category_seq.nextval, '1','1','1','TV');


insert into post values(product_no_seq.nextval, '?œëª©1','ë¡¤ë ‰??','2000','2000',sysdate,3,sysdate+3,'100','4000','afadafad','1.jpg','1','spring');
insert into post values(product_no_seq.nextval, '?œëª©2','?„ë¼??','2000','2000',sysdate,3,sysdate+3,'100','4000','afadafad','2.jpg','1','spring');
insert into post values(product_no_seq.nextval, '?œëª©3','ì¢‹ì?ë¬¼ê±´','2000','2000',sysdate,3,sysdate+3,'100','4000','afadafad','3.jpg','1','spring');

insert into post values(product_no_seq.nextval, '?œëª©1','ë¡¤ë ‰??','2000','2000',sysdate,3,sysdate+3,'100','4000','afadafad','1.jpg','1','java');
insert into post values(product_no_seq.nextval, 'ê³¨ë™??','ë¡¤ë ‰??','3000','3000',sysdate,5,sysdate+3,'100','4000','afadafad','1.jpg','1','java');
insert into post values(product_no_seq.nextval, '?œëª©1','ë¡¤ë ‰??','2000','2000',sysdate,3,sysdate+3,'100','4000','afadafad','1.jpg','1','java');

insert into post values(product_no_seq.nextval, '?œëª©1','ë¡¤ë ‰??','2000','2000',sysdate,3,'100','4000','afadafad','1.jpg','1','java');
insert into post values(product_no_seq.nextval, '?œëª©2','?˜ì´?¤ìŠˆì¦?','300','300',sysdate,3,sysdate+3,'10','2000','hahaha','2.jpg','1','java2');
insert into post values(product_no_seq.nextval, '?œëª©3','ë¡¤ìŠ¤ë¡œì´??','30000','30000',sysdate,5,sysdate+5,'1000','100000','?ã„·??','3.jpg','2','java2');
insert into post values(product_no_seq.nextval, '?œë²ˆ? ì?','?„ë””?¤ìŠ¤?ˆì¦ˆ','300','300',sysdate,7,sysdate+7,'10','2000','hahaha','4.jpg','1','java2');
insert into post values(product_no_seq.nextval, '?œëª©5','?Œë³´','30000','30000',sysdate,sysdate+5,'1000','100000','?ã„·??','5.jpg','2','java2');
insert into post values(product_no_seq.nextval, '?œëª©6','ì»¨ë²„?¤ìŠˆì¦?','300','300',sysdate,sysdate+3,'10','2000','hahaha','6.jpg','1','java2');
insert into post values(product_no_seq.nextval, '?œëª©7','?˜ë¼ë¦?','30000','30000',sysdate,sysdate+5,'1000','100000','?ã„·??','7.jpg','2','java2');
insert into post values(product_no_seq.nextval, '?œëª©8','?Œí…?„ë¦½','300','300',sysdate,sysdate+3,'10','2000','hahaha','8.jpg','1','java2');
insert into post values(product_no_seq.nextval, '?œëª©9','?¼í˜?¼ë¦¬','30000','30000',sysdate,sysdate+5,'1000','100000','?ã„·??','9.jpg','2','java2');
insert into post values(product_no_seq.nextval, '?œëª©10','ë¡¤ë ‰??','2000','2000',sysdate,sysdate+3,'100','4000','afadafad','10.jpg','1','java');

insert into post values(product_no_seq.nextval, '?œëª©11','ë¡¤ë ‰??','2000','2000',sysdate+3,'100','4000','afadafad','11.jpg','1','java');
insert into post values(product_no_seq.nextval, '?œëª©12','?˜ì´?¤ìŠˆì¦?','300','300',sysdate+3,'10','2000','hahaha','12.jpg','1','java');
insert into post values(product_no_seq.nextval, '?œëª©13','ë¡¤ìŠ¤ë¡œì´??','30000','30000',sysdate,sysdate+5,'1000','100000','?ã„·??','13.jpg','2','java');
insert into post values(product_no_seq.nextval, '?œëª©14','?„ë””?¤ìŠ¤?ˆì¦ˆ','300','300',sysdate,sysdate+3,'10','2000','hahaha','14.jpg','1','java');
insert into post values(product_no_seq.nextval, '?œëª©15','?Œë³´','30000','30000',sysdate,sysdate+5,'1000','100000','?ã„·??','15.jpg','2','java');
insert into post values(product_no_seq.nextval, '?œëª©16','ì»¨ë²„?¤ìŠˆì¦?','300','300',sysdate,sysdate+3,'10','2000','hahaha','16.jpg','1','java');
insert into post values(product_no_seq.nextval, '?œëª©17','?˜ë¼ë¦?','30000','30000',sysdate,sysdate+5,'1000','100000','?ã„·??','17.jpg','2','java');
insert into post values(product_no_seq.nextval, '?œëª©18','?Œí…?„ë¦½','300','300',sysdate,sysdate+3,'10','2000','hahaha','18.jpg','1','java2');
insert into post values(product_no_seq.nextval, '?œëª©19','?¼í˜?¼ë¦¬','30000','30000',sysdate,sysdate+5,'1000','100000','?ã„·??','19.jpg','2','java');



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
delete from post;
delete from  bid_log;




















