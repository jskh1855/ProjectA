package org.kosta.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.kosta.model.mapper.PostMapper;
import org.kosta.model.service.ProductService;
import org.kosta.model.vo.PagingBean;
import org.kosta.model.vo.PostVO;
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

	@RequestMapping("/user/productDetails")
	public String getDetailProduct(@RequestParam("productNo") String productNo, Model model) {
		model.addAttribute("viewDetailPost",productService.showDetails(productNo));
		System.out.println(productService.showDetails(productNo));
		System.out.println("show this!!!");

		return "member/showDetails.tiles";
	}

	@RequestMapping("/user/showAll")
	public String showAll(Model model, @RequestParam("pageNo") String pageNo) {
		
		PagingBean pagingBean=null;
		if(pageNo.equals("0")) {
			pagingBean=new PagingBean(19);
		}else {
			pagingBean=new PagingBean(19, Integer.parseInt(pageNo));
		}

		// new PagingBean(19) <- 총 개수 확인하는 sql구문 mapper에 추가하기 
		// select count(*) from post; 만해도 될 듯
		
		// 카테고리에 따라 변경할수 있도록 sql에 where 절 추가 
		// pagingBean에 get set 추가하면 될 듯
		System.out.println("1 test  "+pagingBean.getStartRowNumber());
		
		
		model.addAttribute("postVOList", productService.showAll(pagingBean));
		System.out.println("show all !!!");
		model.addAttribute("pagingBean", pagingBean);
		return "member/showAll.tiles";
	}
	@RequestMapping("addCart")
	public String addCart(String productNo, Model model) {
//		model.addAttribute("postVO",postMapper.addCart(productNo, memberId)); 
		System.out.println("picked");
		return "member/productDetails.tiles";
		
	}

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
	@RequestMapping("productUpload")
	public String productUpload() {

		return "member/productUpload.tiles";
	}
	
	@RequestMapping(value = "upload", method = RequestMethod.POST)
	public String upload(HttpServletRequest request, @RequestParam("filename") MultipartFile[] mFiles) {
		StringBuilder images = new StringBuilder();
		try {
			String path2 = "..\\resources\\static\\myweb\\images\\";
			String path = request.getSession().getServletContext().getRealPath("");
			
			for (int i=0;i<mFiles.length;i++) {
				mFiles[i].transferTo(new File(path+path2+mFiles[i].getOriginalFilename()));
				images.append(mFiles[i].getOriginalFilename());
				images.append(";");
				
			}
			
			
			

			// mFile.transferTo(new File("c:/Users/short/kosta/ProjectA/NeoA/src/main/resources/static/myweb/images/"+mFile.getOriginalFilename()));
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return "redirect:productUpload_ok";
	}
	
	@RequestMapping("/productUpload_ok")
	public String productUpload_ok() {
	
		return "member/productUpload_ok.tiles";
	}
	
	@RequestMapping("/user/searchByTitle")
	public String searchByTitle(String title, Model model) {
		model.addAttribute("searchResult", postMapper.searchByTitle(title));
		
		
		return "member/search_result.tiles";
		
	}
	
	
	
}
