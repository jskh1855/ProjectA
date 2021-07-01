Create table a_member(
	member_id varchar2(100) primary key,
	name varchar2(100) not null,
	password varchar2(100) not null,
	address varchar2(100) not null,
	phoneNo varchar2(100) not null,
	credit varchar2(100) not null,
	bankName varchar2(100) not null,
	accountNo varchar2(100) not null,
	enabled int default 1 not null
)

create table authority(
	authority varchar(30) not null,
	constraint fk_authorities foreign key(member_id) references a_member(member_id),
	constraint member_authorities primary key(member_id,authority)
)


