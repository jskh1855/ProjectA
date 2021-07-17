package org.kosta.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import org.springframework.web.bind.annotation.PostMapping;
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

		
		//mapper로 보낼 객체
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		// 로그인 유무확인
		MemberVO memberVO = null;
		if (SecurityContextHolder.getContext().getAuthentication().getPrincipal().equals("anonymousUser")) { // 비회원으로
			System.out.println("비회원!");
			memberVO = new MemberVO();
		} else { // 회원일때
			System.out.println("회원!");
			memberVO = (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		}
	
		
		//회원일땐 아이디 출력, 비회원일땐 null
		System.out.println("id:"+memberVO.getMemberId());
		
		PagingBeanMain pagingBean = new PagingBeanMain();

		System.out.println("param @pageNo:"+pageNo+" @category:"+category+" @sortBy:"+sortBy+" @perPage:"+perPage);

		// 카테고리
		if (category != "" && category!=null ) {
			
			pagingBean.setCategory(category);
			
			String[] ca=category.split("a");
			System.out.println(ca.length);
			for(int i=0; i<ca.length; i++) {
				System.out.println(ca[i]);
				if(i==0) {
					pagingBean.setCa1(ca[i]);
				}else if(i==1) {
					pagingBean.setCa2(ca[i]);
				}
			}
		}
		
		
		System.out.println("테스트 : 1:"+pagingBean.getCa1()+" 2:"+pagingBean.getCa2());
		
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
		
		map.put("memberVO", memberVO);
		map.put("pagingBean", pagingBean);
		
		
		System.out.println("1 test  " + pagingBean.getStartRowNumber());

		model.addAttribute("postVOList", productService.showAll(map));
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
		MemberVO memberVO = (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String path = request.getSession().getServletContext().getRealPath("");
		System.out.println(memberVO.getMemberId());
		File Folder = new File(path + "..\\resources\\static\\myweb\\images\\"+memberVO.getMemberId());
		if (!Folder.exists()) {
			try{
			    Folder.mkdir(); //폴더 생성합니다.
			    System.out.println("폴더가 생성되었습니다.");
		        } 
		        catch(Exception e){
			    e.getStackTrace();
			}
		}
		StringBuilder images = new StringBuilder();
		try {
			String path2 = "..\\resources\\static\\myweb\\images\\"+memberVO.getMemberId()+"\\";


			for (int i = 0; i < mFiles.length; i++) {
				mFiles[i].transferTo(new File(path + path2 + mFiles[i].getOriginalFilename()));
				images.append(mFiles[i].getOriginalFilename());
				images.append(";");

			}
			System.out.println(images);
			// img1.jpg;img2.jpg;img3.jpg;
			
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
		/*
		 * System.out.println(pvo.getDetail());
		 */		
		
		pvo.setPostImage(images.toString());
		String category1 = request.getParameter("top");
		String category2 = request.getParameter("mid");
		pvo.setCategory(category1+'a'+category2+'a');
		pvo.setMemberVO(memberVO);
		pvo.setNowPrice(pvo.getStartPrice());
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
	public String getproductDetails(@RequestParam("productNo") String productNo, Model model) {
		model.addAttribute("productDetails", productService.getproductDetails(productNo));
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
	
	@ResponseBody
	@PostMapping("/registerQuestion")
	public List<QnAVO> registerQuestion(String qnaContent, String productNo) {
		//System.out.println("test = " + qnaContent + " " + productNo);
		MemberVO memberVO = (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String memberId = memberVO.getMemberId();
		productService.registerQuestion(qnaContent, memberId, productNo);
		List<QnAVO> list = productService.getQnAList(productNo);
		return list;
	}
	
	@ResponseBody
	@PostMapping("/registerAnswer")
	public List<QnAVO> registerAnswer(String qnaNo, String qnaContent, String productNo) {
		MemberVO memberVO = (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String memberId = memberVO.getMemberId();
		//System.out.println("test="+qnaNo+" "+ qnaContent+ " "+ memberId+ " "+ productNo);
		productService.registerAnswer(qnaNo, qnaContent, memberId, productNo);
		List<QnAVO> list = productService.getQnAList(productNo);
		return list;
	}
	
	@ResponseBody
	@RequestMapping("/user/getQnAList")
	public List<QnAVO> getQnAList(String productNo) {
		//System.out.println("testsssssssssss");
		List<QnAVO> list = productService.getQnAList(productNo);
		//System.out.println(list);
		return list;
	}
	
	@PostMapping("/updatePick")
	@ResponseBody
	public Map<String,String> updatePick(HttpServletRequest request) {
		System.out.println("실행완료");
		
		MemberVO memberVO = (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		String productNo = request.getParameter("data");
		String memberId = memberVO.getMemberId();
		
		//service -> postmapper
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("productNo", productNo);
		map.put("memberId", memberId);
		
		//리턴값
		Map<String,String> param=new HashMap<String,String>();
		param.put("pick",productService.updatePick(map));
		return param;
	}
	
    @RequestMapping(value = "/bid",method = RequestMethod.POST)
    public String dataSend(Model model){
        //model.addAttribute("msg",dto.getResult()+"/ this is the value sent by the server ");
        return "index :: #resultDiv";
    }
    
	
}
