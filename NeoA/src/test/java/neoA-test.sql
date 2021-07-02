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

-- 상품 등록 













