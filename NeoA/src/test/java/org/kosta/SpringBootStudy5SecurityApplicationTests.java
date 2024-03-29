﻿package org.kosta;

import java.util.HashMap;
import java.util.List;

import org.junit.jupiter.api.Test;
import org.kosta.model.mapper.MemberMapper;
import org.kosta.model.mapper.PostMapper;
import org.kosta.model.service.MemberService;
import org.kosta.model.service.ProductService;
import org.kosta.model.vo.MemberVO;
import org.kosta.model.vo.PagingBean;
import org.kosta.model.vo.PostVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class SpringBootStudy5SecurityApplicationTests {
	@Autowired
	MemberMapper mm;
	@Autowired
	PostMapper pm;
	
	@Autowired
	ProductService productService;
	
	@Autowired
	MemberService memberService;
	
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
		
		//pm.showAll();
		
		//물품등록
		/*
		 * PostVO pvo = new PostVO(); pvo.setProductName("롤렉스");
		 * pvo.setStartPrice(2000); pvo.setNowPrice(2000); pvo.setBidTimeUnit(3);
		 * pvo.setUnitPrice(100); pvo.setGiveMeThatPrice(4000); pvo.setDetail("dddddd");
		 * MemberVO mvo = new MemberVO(); mvo.setMemberId("java2"); CategoryVO cvo = new
		 * CategoryVO(); cvo.setCategoryNo("1"); pvo.setCategoryVO(cvo);
		 * pvo.setMemberVO(mvo);
		 * 
		 * pm.registerProduct(pvo);
		 */
		
		
		// detail view
		// mapper에 sql에 select 항목 설정~~~~ 할것
		/*
		 * PostVO pvo= new PostVO(); pvo = pm.viewDetailPost("1");
		 * System.out.println(pvo);
		 */
		
		
		//pick add cart
		
		 
		  
		//pm.addCart("1", "java");
		 
		
		/*
		 * List<PostVO> list = productService.showAll();
		 * 
		 * 
		 * System.out.println(list);
		 */
		
		/*
		 * 상세보기
		 * 
		 * PostVO vo = new PostVO();
		 * 
		 * vo = pm.viewDetailPost("2"); System.out.println(vo);
		 */
		
		//제목으로 찾기
		/*
		 * PostVO vo = new PostVO(); vo = pm.searchByTitle("제목");
		 * 
		 * System.out.println(vo);
		 * 
		
		int totalPostCount = memberService.getTotalSellProductCountById("spring");
		PagingBean pagingBean = new PagingBean(totalPostCount);
		System.out.println(memberService.getSellProductListById("spring", pagingBean));
		 */
		/*
		 * int totalPostCount = memberService.getTotalBidProductCountById("spring");
		 * PagingBean pagingBean = new PagingBean(totalPostCount);
		 * System.out.println(memberService.getBidProductListById("spring",
		 * pagingBean));
		 */
		
		//pm.randPost();
		
		
		//productService.registerQuestion("content test", "kobos", "9");
		//productService.registerAnswer("1", "answer test", "kobos", "9");
		//System.out.println(productService.getQnAList("9"));
		//System.out.println(productService.getQnAList("9"));
		//System.out.println(productService.getproductDetails("9"));
		//System.out.println(productService.getQnAList("9"));
		
		//int totalPostCount = memberService.getTotalPickProductCountById("spring");
		//PagingBean pagingBean = new PagingBean(totalPostCount);
		//System.out.println(memberService.getPickProductListById("spring", pagingBean));
		
		//productService.addPick("spring", "23");
		
		
		//System.out.println(productService.getQnAList("1"));
		
		//int totalPostCount = memberService.getMySellSucessCountById("kobos");
		//System.out.println(totalPostCount);
		
//		List<String> myBidLogList = mm.getMyBidLog("kobos");
//		System.out.println(myBidLogList);
		/*
		int totalPostCount = 10;
		PagingBean pagingBean = new PagingBean(totalPostCount);
		int startRowNumber = pagingBean.getStartRowNumber();
		int endRowNumber = pagingBean.getEndRowNumber();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("id", "kobos");
		map.put("startRowNumber", startRowNumber);
		map.put("endRowNumber", endRowNumber);
		System.out.println(memberService.getMyBidSuccessList("kobos", pagingBean));
		*/
		String pageNo = null;
		String memberId = "kobos";
		//int totalPostCount = memberService.getMySellSucessCountById("kobos");
		//System.out.println(totalPostCount);
		int totalPostCount = memberService.getMySellSucessCountById(memberId);
		PagingBean pagingBean = null;
		if (pageNo == null) {
			pagingBean = new PagingBean(totalPostCount);
		} else {
			pagingBean = new PagingBean(totalPostCount, Integer.parseInt(pageNo));
		}
		List<PostVO> list = memberService.getMySellSuccessList(memberId, pagingBean);
		MemberVO buyerMemberVO = null;
		for (int i = 0; i < list.size(); i++) {
			if (list.get(i).getBidLogVOList().get(0) != null) {
				buyerMemberVO = memberService.findMemberById(list.get(i).getBidLogVOList().get(0).getMemberId());
			}
		}
		//System.out.println(list);
		
		
		
	}
}
