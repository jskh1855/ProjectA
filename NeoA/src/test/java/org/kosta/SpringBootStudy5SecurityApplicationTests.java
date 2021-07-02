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
		
		
	}
	
	
	
	
	
}
