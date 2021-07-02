package org.kosta.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ProductController {
	@RequestMapping("/product")
	public String getDetailProduct(String productNo, Model model) {
		return "";
	}
	
	
	
}
