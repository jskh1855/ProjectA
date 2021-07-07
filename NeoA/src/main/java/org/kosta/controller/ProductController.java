package org.kosta.controller;

import java.io.File;
import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.kosta.model.mapper.PostMapper;
import org.kosta.model.service.ProductService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class ProductController {

	@Resource
	private PostMapper postMapper;
	
	@Resource
	private ProductService productService;
	

	@RequestMapping("/product")
	public String getDetailProduct(String productNo, Model model) {
		return "";
	}

	@RequestMapping("/user/showAll")
	public String showAll(Model model) {
		model.addAttribute("postVOList", productService.showAll());
		System.out.println("쇼올");
		return "member/showAll.tiles";
	}
	@RequestMapping("addCart")
	public String addCart(String productNo, Model model) {
//		model.addAttribute("postVO",postMapper.addCart(productNo, memberId)); 
		System.out.println("picked");
		return "member/productDetails.tiles";
		
	}
	@RequestMapping("productUpload")
	public String productUpload() {
		
		return "member/productUpload.tiles";
	}

	//@PostMapping("/user/productUpload2")
	//@RequestMapping("/user/productUpload2")
//	@RequestMapping("productUpload2")
//	public String productUpload2(HttpServletRequest request , @RequestParam("filename") MultipartFile mFile){
//		
//		System.out.println("AAAAAAAAAAAAAAAAAAA");
//		try {
//			mFile.transferTo(new File("c:/kosta215/"+mFile.getOriginalFilename()));
//			System.out.println("BBBBBBBBBBBBBBBBB");
//		} catch (Exception e) {
//			e.getStackTrace();
//		}
//		
//		return "member/productUpload_ok.tiles";
//		//return "redirect:productUpload_ok";
//	}
	
	@RequestMapping(value = "upload", method = RequestMethod.POST)
	public String upload(HttpServletRequest request, @RequestParam("filename") MultipartFile[] mFiles) {

		try {
			String path2 = "..\\resources\\static\\myweb\\images\\";
			String path = request.getSession().getServletContext().getRealPath("");
			
			for (int i=0;i<mFiles.length;i++) {
				mFiles[i].transferTo(new File(path+path2+mFiles[i].getOriginalFilename()));
			}
			

			// mFile.transferTo(new File("c:/Users/short/kosta/ProjectA/NeoA/src/main/resources/static/myweb/images/"+mFile.getOriginalFilename()));
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		

		System.out.println("AAA");
		return "redirect:productUpload_ok";
	}
	
	@RequestMapping("productUpload_ok")
	public String productUpload_ok() {
	
		return "member/productUpload_ok.tiles";
	}
	
}
