-- test 1 : 상품 검색
select count(*) from post where member_id='spring'
select count(*) from  bid_log where member_id='spring'

select p.title, p.product_name, p.now_price, to_char(p.bid_end_time, 'YYYY-MM-DD HH24:MI:SS') as bid_end_time,p.post_image,b.bid_no,b.bid_time,b.bid_price, b.member_id, b.product_no
	from 
		 		(select row_number() over(ORDER BY bid_time DESC) as rnum,
		 		bid_no,to_char(bid_time, 'YYYY-MM-DD HH24:MI:SS') as bid_time, bid_price,member_id,product_no 
		 		from  bid_log) b, post p
		where p.product_no=b.product_no AND b.member_id='spring'
		
		
		
		
		
		
-- test 1 : 상품 등록


-- test 1 : 상품 등록 취소


-- test 1 : qna 댓글 


-- test 1 : 회원 탈퇴

-- test 1 : 상품 입찰


-- test 1 : 상품 낙찰


-- test 1 : 카테고리 등록


-- ***************************
-- MemberMapper 
-- ***************************
-- test : register member
insert into a_member(member_id, member_email, name, password, address, phone_no, credit, bank_name, account_no, enabled) values('java',   'a@abc.com',     '아이유','a',        '오리',   '010-1234-5678', 'gold','국민은행','111-111-1111','1');
insert into a_member(member_id, member_email, name, password, address, phone_no, credit, bank_name, account_no, enabled) values(#{memberId},#{memberEmail},#{name},#{password},#{address},#{phoneNo},#{credit},#{bankName},#{accountNo},#{enabled})

-- update 회원정보 변경 


-- 제품 전체 조회

select * 
from post p, a_member a
where p.member_id = a.member_id
order by product_up_time desc

	select p.product_no, p.title, p.product_name, p.now_price, p.post_image, p.member_id, m.name
	from(
		select row_number() over(order by product_no desc) as rnum,product_no,title,product_name,now_price,bid_end_time,post_image,member_id
		from post
	) p, a_member m
	where p.member_id=m.member_id and rnum between 1 and 6


-- 상품 등록 
insert into post values(product_no_seq.nextval, '롤렉스','2000','2000',sysdate,sysdate+3,'100','4000','afadafad','1','java')
insert into post values(product_no_seq.nextval, #{productName},#{startPrice},#{nowPrice},sysdate,sysdate+#{bidTimeUnit},#{unitPrice},#{giveMeThatPrice},#{detail},#{categoryVO.categoryNo},#{memberVO.memberID})


-- 상세보기

	select p.product_no, p.title, p.product_name, p.now_price, p.post_image, p.member_id, m.name, p.bid_end_time
		from post p, a_member m
		where p.product_no = '2' and p.member_id=m.member_id

			select *
		from post p, a_member m
		where p.product_no = '2' and p.member_id=m.member_id
		
		select *
		from (
		select row_number() over(order by product_no desc) as rnum,product_no,title,product_name,now_price,bid_end_time,post_image,member_id
		from post
		) p, a_member m
		where title like '%제목%' and p.member_id=m.member_id 
		
-- 상품 찾기
select p.product_no, p.title, p.product_name, p.now_price, p.post_image, p.member_id, m.name, p.bid_end_time
		from post p, a_member m 
		where p.title like '%제목%' and p.member_id = m.member_id

		
	select *
		from post
		where title like '%제목%' 		

select *
from post
where product_no = '1'




-- 입찰하기 버튼 눌렀을때
select now_price from post where product_no = '1' 
-- 있냐? --> 취소

-- 없냐? --> bid_log 인서트  post 테이블 now_price 업데이트 
update post set now_price = ( now_price + unit_price ) where product_no = '1';

insert into bid_log(bid_no, member_id, product_no, bid_time, bid_price)
values(bid_no_seq.nextval, 'java', '1',sysdate, 
(select now_price from post where product_no = '1' )
);

select * from post

--판매 물품 아이디로 조회
		select product_no, title, product_name, start_price, now_price, product_up_time, bid_time_unit, bid_end_time, unit_price, give_me_that_price, post_image
		from (select row_number() over(ORDER BY product_no DESC) as rnum, product_no, title, product_name, start_price, now_price, to_char(product_up_time, 'YYYY-MM-DD HH24:MI:SS') as product_up_time, bid_time_unit, to_char(bid_end_time, 'YYYY-MM-DD HH24:MI:SS') as bid_end_time, unit_price, give_me_that_price, post_image
		from post 
		where member_id='kobos')
		where rnum between '1' and '2'
		
select p.title, p.product_name, p.now_price, to_char(p.bid_end_time, 'YYYY-MM-DD HH24:MI:SS') as bid_end_time, p.post_image, b.bid_no, b.bid_time, b.bid_price, b.member_id, b.product_no
from (
	select row_number() over(ORDER BY bid_time DESC) as rnum, bid_no,to_char(bid_time, 'YYYY-MM-DD HH24:MI:SS') as bid_time, bid_price,member_id,product_no 
	from bid_log) b, post p
where p.product_no = b.product_no AND b.member_id='spring'

--random
select * from 
		(select * from post order by dbms_random.value)
		where rownum =1
		
select product_no from 
		(select * from post order by dbms_random.value)
		where rownum =1		
