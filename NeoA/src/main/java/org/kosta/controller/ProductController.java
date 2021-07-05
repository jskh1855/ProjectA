package org.kosta.controller;

import javax.annotation.Resource;

import org.kosta.model.mapper.MemberMapper;
import org.kosta.model.mapper.PostMapper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ProductController {

	@Resource
	private PostMapper postMapper;

	@RequestMapping("/product")
	public String getDetailProduct(String productNo, Model model) {
		return "";
	}

	@RequestMapping("/user/showAll")
	public String showAll(Model model) {
		model.addAttribute("postVO", postMapper.showAll());
		System.out.println("쇼올");
		return "member/showAll.tiles";
	}

}
