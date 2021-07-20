package org.kosta.controller;

import javax.annotation.Resource;

import org.kosta.model.mapper.PostMapper;
import org.kosta.model.vo.MemberVO;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.kosta.model.service.ProductService;
import org.kosta.model.vo.PostVO;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	@Resource
	PostMapper postMapper;
	

	@Resource
	private ProductService productService;
	
	@RequestMapping(value = {"/home","/"})
	public String home(Model model){
		//Spring Security 권한 출력 
		System.out.println("home "+SecurityContextHolder.getContext().getAuthentication().getPrincipal());		
		model.addAttribute("recentThree", postMapper.recentThree());
	    System.out.println("postMapper.recentThree()"+postMapper.recentThree());
		System.out.println("home "+SecurityContextHolder.getContext().getAuthentication().getPrincipal());
		List<String> list = productService.findPopular();
		List<PostVO> pList = new ArrayList<PostVO> ();
		//model.addAttribute("memberVO", productService.findPopular());
		for (int i=0;i<list.size();i++) {
			pList.add(productService.getproductDetails(list.get(i)));
		}
		model.addAttribute("pList", pList);
		System.out.println(pList);
		return "home.tiles";
	}
	
	@RequestMapping("/shop")
	public String shop() {
		return "member/shop.tiles";
	}
	
	
	
	/*
	 * @RequestMapping("productDetails") public String productDetails() { return
	 * "member/productDetails.tiles"; }
	 */

	/*	
		로그인 하였으나 권한이 없는 요청을 하였을 경우 보여지는 페이지를 지정  
		<security:access-denied-handler error-page="/accessDeniedView"/>
	 */
	@RequestMapping("/accessDeniedView")
	public String accessDeniedView() {
		return "auth/accessDeniedView.tiles";
	}

}
