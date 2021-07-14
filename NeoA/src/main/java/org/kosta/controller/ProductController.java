package org.kosta.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.kosta.model.mapper.PostMapper;
import org.kosta.model.service.ProductService;
import org.kosta.model.vo.MemberVO;
import org.kosta.model.vo.PagingBeanMain;
import org.kosta.model.vo.PostVO;
import org.kosta.model.vo.QnAVO;
import org.springframework.lang.Nullable;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class ProductController {

	@Resource
	private PostMapper postMapper;

	@Resource
	private ProductService productService;

	// private PagingBeanMain pagingBean=new PagingBeanMain();

	@RequestMapping("/user/showAll")
	public String showAll(Model model, @RequestParam("pageNo") @Nullable String pageNo,
			@RequestParam("category") @Nullable String category, @RequestParam("sortBy") @Nullable String sortBy,
			@RequestParam("perPage") @Nullable String perPage) {

		PagingBeanMain pagingBean = new PagingBeanMain();

		// 카테고리
		if (category != null) {
			pagingBean.setCategory(category);
		}
		// 정렬
		if (sortBy != null) {
			pagingBean.setSortBy(sortBy);
		}

		// 그룹당 페이지수
		if (perPage != null) {
			pagingBean.setPostCountPerPage(Integer.parseInt(perPage));
		}

		int totalpostCount = postMapper.showAllCount(pagingBean);
		pagingBean.setTotalPostCount(totalpostCount);

		if (pageNo != null) {
			pagingBean.setNowPage(Integer.parseInt(pageNo));
		}

		// pagingBean.setPostCountPerPage(12);

		// new PagingBean(19) <- 총 개수 확인하는 sql구문 mapper에 추가하기
		// select count(*) from post; 만해도 될 듯

		// 카테고리에 따라 변경할수 있도록 sql에 where 절 추가
		// pagingBean에 get set 추가하면 될 듯
		System.out.println("1 test  " + pagingBean.getStartRowNumber());

		model.addAttribute("postVOList", productService.showAll(pagingBean));
		System.out.println("show all !!!");
		model.addAttribute("pagingBean", pagingBean);
		return "member/showAll.tiles";
	}

	@RequestMapping("productUpload")
	public String productUpload() {

		return "member/productUpload.tiles";
	}

	@RequestMapping(value = "upload", method = RequestMethod.POST)
	public String upload(HttpServletRequest request, @RequestParam("filename") MultipartFile[] mFiles, PostVO pvo) {
		System.out.println("AA");
		
		StringBuilder images = new StringBuilder();
		try {
			String path2 = "..\\resources\\static\\myweb\\images\\";
			String path = request.getSession().getServletContext().getRealPath("");

			for (int i = 0; i < mFiles.length; i++) {
				mFiles[i].transferTo(new File(path + path2 + mFiles[i].getOriginalFilename()));
				images.append(mFiles[i].getOriginalFilename());
				images.append(";");

			}
			System.out.println(images);

			// mFile.transferTo(new
			// File("c:/Users/short/kosta/ProjectA/NeoA/src/main/resources/static/myweb/images/"+mFile.getOriginalFilename()));
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(pvo);
		MemberVO memberVO = (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		pvo.setPostImage(images.toString());
		pvo.setCategory("가전;스마트폰;삼성;");
		pvo.setMemberVO(memberVO);
		System.out.println(pvo);
		productService.registerProduct(pvo);

		return "redirect:productUpload_ok";
	}

	@RequestMapping("/productUpload_ok")
	public String productUpload_ok() {

		return "member/productUpload_ok.tiles";
	}

	@RequestMapping("/user/searchByTitle")
	public String searchByTitle(@RequestParam("title") String title, Model model) {
		model.addAttribute("searchResult", productService.searchByTitle(title));

		return "member/search_result.tiles";
	}

	@RequestMapping("/user/productDetails")
	public String getDetailProduct(@RequestParam("productNo") @Nullable String productNo, Model model) {
		//model.addAttribute("viewDetailPost", productService.showDetails(productNo));
		//System.out.println(productService.showDetails(productNo));
		return "member/productDetails.tiles";
	}

//	@PostMapping("productRegister")
//	public String productRegister(PostVO pvo, MultipartFile file, HttpServletRequest request) throws IOException, Exception {
//		String uploadPath = request.getSession().getServletContext().getRealPath("/");
//		System.out.println(uploadPath);
//		/*
//		 * String Path = "..\\resources\\static\\myweb\\images\\";
//		 */		
//		String imgUploadPath = uploadPath + File.separator + "imgUpload"; //이미지 업로드 폴더를 설정 = /uploadPath/imgUpload
//		 String ymdPath = UpLoadFileUtils.calcPath(imgUploadPath); // 위의 폴더를 기준으로 연월일 폴더를 생성	
//		 
//		 String fileName = null;  // 기본 경로와 별개로 작성되는 경로 + 파일이름
//		 System.out.println("imgUploadPath:"+imgUploadPath);
//		 if(file.getOriginalFilename() != null && !file.getOriginalFilename().equals("")) {
//			 System.out.println("파일업로드시작!!");
//			  // 파일 인풋박스에 첨부된 파일이 없다면(=첨부된 파일이 이름이 없다면)  
//              fileName=UpLoadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);
//              System.out.println("업로드할파일명"+fileName);
//			  // postImage에 원본 파일 경로 + 파일명 저장
//			  pvo.setPostImage(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
//			  System.out.println(pvo);			  		  
//				/*
//				 * pvo.setGdsThumbImg(File.separator + "imgUpload" + ymdPath + File.separator +
//				 * "s" + File.separator + "s_" + fileName);
//				 */			 } else {  // 첨부된 파일이 없으면
//			  fileName = uploadPath + File.separator + "images" + File.separator + "none.png";
//			  // 미리 준비된 none.png파일을 대신 출력함
//			  System.out.println("업로드파일:"+fileName);
//			  pvo.setPostImage(fileName);
//				/*
//				 * pvo.setGdsThumbImg(fileName);
//				 */			 }
//		 
//		productService.registerProduct(pvo);
//		return "redirect:member/registerproduct-result";
//		
//	}

	@RequestMapping("member/registerproduct-result")
	public String registerfin() {
		return "member/productUpload_ok.tiles";
	}

	@RequestMapping("/user/randPost")
	public String randPost(Model model) {
		System.out.println("random!");
		model.addAttribute("random", postMapper.randPost());
		return "member/randompost.tiles";
	}
	
	@PostMapping("/registerQuestion")
	public void registerQuestion(String qnaContent, String productNo) {
		MemberVO memberVO = (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String memberId = memberVO.getMemberId();
		productService.registerQuestion(qnaContent, memberId, productNo);
	
	}
	
	@PostMapping("/registerAnswer")
	public void registerAnswer(String qnaNo, String qnaContent, String productNo) {
		MemberVO memberVO = (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String memberId = memberVO.getMemberId();
		productService.registerAnswer(qnaNo, qnaContent, memberId, productNo);
	
	}
	
	@ResponseBody
	@RequestMapping("/user/getQnAList")
	public List<QnAVO> getQnAList(String productNo) {
		productNo = "9";
		List<QnAVO> list = productService.getQnAList(productNo);
		return list;
	}

}
