package org.kosta;

import org.junit.jupiter.api.Test;
import org.kosta.model.mapper.MemberMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class SpringBootStudy5SecurityApplicationTests {
	@Autowired
	MemberMapper mm;
	@Test
	public void contextLoads() {
		System.out.println(mm.findMemberById("java"));
		
<<<<<<< HEAD
=======
		// 회원가입 
		MemberVO mv = new MemberVO("java2","b@abc.com","아이유","a","오리","010-1234-5678","gold",true,"국민은행","111-111-1111");
		mm.registerMember(mv);
		
		// 회원정보 수정
		
		// test 
>>>>>>> 3e484ea4764064f2e9b52baf80db62a507530fac
		
	}
	
	
	
	
	
}
