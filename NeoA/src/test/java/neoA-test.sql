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

	select p.product_no, p.title, p.product_name, p.now_price, p.post_image, p.member_id, m.name
	from(
		select row_number() over(order by product_up_time desc) as rnum,product_no,title,product_name,now_price,bid_end_time,post_image,member_id
		from post
		where product_name like '%' 
	) p, a_member m
	where p.member_id=m.member_id and rnum between 1 and 6 

-- + 찜했는지 유무도 조회 해야함.ㅠ

	select p.product_no, p.title, p.product_name, p.now_price, p.post_image, p.member_id, m.name
	from(
		select row_number() over(order by product_up_time desc) as rnum,product_no,title,product_name,now_price,bid_end_time,post_image,member_id
		from post
		where product_name like '%' 
	) p, a_member m
	where p.member_id=m.member_id and rnum between 1 and 6 
-- 아우터조인 동일한 제품에 좋아요 여러개 들어가면 중복값출력함 ㅠ
select row_number() over(order by product_up_time desc) as rnum, p.product_no, p.title, p.product_name, p.now_price, p.bid_end_time, p.post_image, p.member_id, pi.member_id
from post p, pick pi
where p.product_no = pi.product_no(+) and p.product_name like '%' 

select row_number() over(order by product_up_time desc) as rnum, p.product_no, p.title, p.product_name, p.now_price, p.bid_end_time, p.post_image, p.member_id, pi.member_id
from post p, pick pi
where p.product_no = pi.product_no(+) and pi.member_id(+) = '' and p.product_name like '%' 


select p.product_no, p.title, p.product_name, p.now_price, p.post_image, p.member_id, m.name, p.pick_member
from(
	select row_number() over(order by product_up_time desc) as rnum, po.product_no, po.title, po.product_name, po.category, po.now_price, po.bid_end_time, po.post_image, po.member_id, pi.member_id as pick_member
	from post po, pick pi
	where po.product_no = pi.product_no(+) and pi.member_id(+) = '' and category = '패션;신발;'
) p, a_member m
where p.member_id=m.member_id and rnum between 1 and 6 



select * 
from post
where category like '패션;%';

select p.product_no, p.title, p.product_name, p.now_price, p.post_image, p.member_id, m.name, p.pick_member
from(
	select row_number() over(order by product_up_time desc) as rnum, product_no, title, product_name, now_price, post_image, member_id, pick_member
	from(
		select po.product_no, po.title, po.product_up_time, po.product_name, po.category, po.now_price, po.bid_end_time, po.post_image, po.member_id, pi.member_id as pick_member
		from post po, pick pi
		where po.product_no = pi.product_no(+) and pi.member_id(+) = ''
	) subpost
	where category like '패션*신발*%' and title like '%%'
) p, a_member m
where p.member_id=m.member_id and rnum between 1 and 6

select * from post

select p.product_no, p.title, p.product_name, p.now_price, p.post_image, p.member_id, m.name, p.bid_end_time, p.pick_member
from(
	select row_number() over(order by ${pagingBean.sortBy}) as rnum, product_no, title, product_name, now_price, bid_end_time, post_image, member_id, pick_member
	from(
		select po.product_no, po.title, po.product_up_time, po.product_name, po.category, po.now_price, po.bid_end_time, po.post_image, po.member_id, pi.member_id as pick_member
		from post po, pick pi
		where po.product_no = pi.product_no(+) and pi.member_id(+) = '${memberVO.memberId}'
	) subpost
	where category like '${pagingBean.category}%' and title like '%%'
) p, a_member m
where p.member_id=m.member_id and rnum between #{pagingBean.startRowNumber} and #{pagingBean.endRowNumber}



--찜 유무 

select count(*) from pick where product_no = '4' and member_id = '1234';

insert into 


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
		
select p.title, p.product_name, p.now_price, to_char(p.bid_end_time, 'YYYY-MM-DD HH24:MI:SS') as bid_end_time, p.post_image,
b.bid_no, b.bid_time, b.bid_price, b.member_id, b.product_no
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

--qna
select * from qna
		
delete from qna
where qna_no ='1' and qna_type='1'

insert into qna(qna_no, qna_time, qna_type, qna_content, member_id, product_no)
values('2', sysdate, '0', 'answer', 'kobos', '9')

select qna_no, qna_time, qna_type, qna_content, member_id
from qna
where product_no='9'

		select bid_no, to_char(bid_time, 'YYYY-MM-DD HH24:MI:SS') as bid_time, bid_price, member_id
		from bid_log
		where product_no = '9'
		
-- pick 
select count(*) from pick where member_id='spring'

select p.title, p.product_name, p.now_price, to_char(p.bid_end_time, 'YYYY-MM-DD HH24:MI:SS') as bid_end_time,p.post_image,
		k.pick_no, k.pick_time, k.member_id, k.product_no
		from (select row_number() over(ORDER BY pick_time DESC) as rnum,
		 		pick_no,to_char(pick_time, 'YYYY-MM-DD HH24:MI:SS') as pick_time,member_id,product_no 
		 		from  pick) k, post p
		where p.product_no = k.product_no AND k.member_id='spring'
		
insert into pick
		values(pick_no_seq.nextval, sysdate, 'spring','21')		
		
select * from pick		

select
     row_number() over(order by c.pick_no desc) as num,
     c.pick_no, c.member_id, c.pick_time, c.product_no, 
     p.product_name, p.now_price, p.post_image, p.product_no , p.title , to_char(p.bid_end_time, 'YYYY-MM-DD HH24:MI:SS') as bid_end_time
 	from pick c
     inner join post p
     on c.product_no = p.product_no   
     where c.member_id = 'spring'