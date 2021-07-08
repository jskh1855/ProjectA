-- test 1 : 상품 검색



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


