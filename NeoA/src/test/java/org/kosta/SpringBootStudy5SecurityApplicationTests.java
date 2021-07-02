package org.kosta;

import org.junit.jupiter.api.Test;
import org.kosta.model.mapper.MemberMapper;
import org.kosta.model.mapper.PostMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class SpringBootStudy5SecurityApplicationTests {
	@Autowired
	MemberMapper mm;
	@Autowired
	PostMapper pm;
	@Test
	public void contextLoads() {

		// 회원가입 
		/*
		 * MemberVO mv = new
		 * MemberVO("java2","b@abc.com","아이유","a","오리","010-1234-5678","gold",true,
		 * "국민은행","111-111-1111"); mm.registerMember(mv);
		 */
		
		// 회원정보 수정
		
		/*
		 * MemberVO mv = new MemberVO(); mv.setMemberId("java2"); mv.setPassword("a");
		 * mv.setName("이재훈"); mv.setAddress("천안"); mv.setAccountNo("111111-111111");
		 * mv.setBankName("bank"); mv.setPhoneNo("010-0000-00000"); mm.updateMember(mv);
		 */
		// 전체 물품 보기
		
		pm.showAll();
		
		
		// test 

		
	}
	
	
	
	
	
}
