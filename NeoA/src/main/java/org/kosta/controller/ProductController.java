package org.kosta.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.kosta.model.mapper.PostMapper;
import org.kosta.model.service.MemberService;
import org.kosta.model.service.ProductService;
import org.kosta.model.vo.BidLogVO;
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
		StringBuilder images = new StringBuilder();
		try {
			images.append(mFiles[0].getOriginalFilename());
		} catch (IllegalStateException e) {
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

		productService.registerProduct(pvo);
		File Folder = new File(path + "..\\resources\\static\\myweb\\images\\"+pvo.getProductNo());
		try{
		    Folder.mkdir(); //폴더 생성합니다.
		    System.out.println("폴더가 생성되었습니다.");
			String path2 = "..\\resources\\static\\myweb\\images\\"+pvo.getProductNo()+"\\";


			for (int i = 0; i < mFiles.length; i++) {
				mFiles[i].transferTo(new File(path + path2 + mFiles[i].getOriginalFilename()));

			}
		    
        } 
	        catch(Exception e){
		    e.getStackTrace();
        }
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
	
	//파일 리스트 가져오기 테스트용/////////////////////////////////////////////////////
	@RequestMapping("/user/picsTest")
	public void pics(HttpServletRequest request) {
		String path = request.getSession().getServletContext().getRealPath("");
		String productNo = "41";
		File dir = new File(path + "..\\resources\\static\\myweb\\images\\"+productNo);
		String files[] = dir.list();
		for (int i = 0; i < files.length; i++) {
		    System.out.println("file: " + files[i]);
		}
	}
	
	@RequestMapping("/user/productDetails")
	public String getproductDetails(@RequestParam("productNo") String productNo, Model model, HttpServletRequest request) {
		String path = request.getSession().getServletContext().getRealPath("");
		String path2 = "..\\resources\\static\\myweb\\images\\";
		File dir = new File(path + path2 + productNo);
		String imagesList[] = dir.list();
		model.addAttribute("imagesList",imagesList);
		model.addAttribute("productDetails", productService.getproductDetails(productNo));
		List<BidLogVO> bList = productService.recentBids(productNo);
		ArrayList<String> checkList = new ArrayList<String>();
		System.out.println("AA");
		int size = bList.size();
		for (int j=0;j<size;j++) {
			checkList.add("1");
		}
		

		if (size < 3) {
			for (int i = size;i<3;i++) {
				checkList.add("0");
			}
		}
		model.addAttribute("recentThree", bList);
		model.addAttribute("listCheck",checkList);
		return "member/productDetails.tiles";
	}

	@RequestMapping("member/registerproduct-result")
	public String registerfin() {
		return "member/productUpload_ok.tiles";
	}

	@RequestMapping("/user/randPost")
	public String randPost(Model model, HttpServletRequest request) {
		System.out.println("random!");
		PostVO pvo = postMapper.randPost();
		String path = request.getSession().getServletContext().getRealPath("");
		String path2 = "..\\resources\\static\\myweb\\images\\";
		File dir = new File(path + path2 + pvo.getProductNo());
		String imagesList[] = dir.list();
		model.addAttribute("imagesList",imagesList);
		model.addAttribute("productDetails", productService.getproductDetails(pvo.getProductNo()));
		model.addAttribute("recentThree", productService.recentBids(pvo.getProductNo()));
		return "member/productDetails.tiles";
	}
	
	@ResponseBody
	@PostMapping("/registerQuestion")
	public List<QnAVO> registerQuestion(String qnaContent, String productNo) {
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
		productService.registerAnswer(qnaNo, qnaContent, memberId, productNo);
		List<QnAVO> list = productService.getQnAList(productNo);
		return list;
	}
	
	@ResponseBody
	@RequestMapping("/user/getQnAList")
	public List<QnAVO> getQnAList(String productNo) {
		List<QnAVO> list = productService.getQnAList(productNo);
		return list;
	}
	
	@PostMapping("/complteBid")
	public String completeBid(String productNo) {
		productService.updateState(productNo);
		String memberId = productService.getHighestBidMemberIdByProductNo(productNo);
		productService.insertBidComplete(productNo, memberId);
		return "redirect:user/productDetails?productNo="+productNo;
	}

	
	@PostMapping("/updatePick")
	@ResponseBody
	public Map<String,String> updatePick(HttpServletRequest request) {
		System.out.println("실행완료");
		
		MemberVO memberVO = (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		String productNo = request.getParameter("data");
		String memberId = memberVO.getMemberId();
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("productNo", productNo);
		map.put("memberId", memberId);
		
		//리턴값
		Map<String,String> param=new HashMap<String,String>();
		param.put("pick",productService.updatePick(map));
		return param;
	}
	
	@PostMapping("/nowPriceCheck")
	@ResponseBody
	public Map<String, String> nowPriceCheck(HttpServletRequest request) {
		String productNo = request.getParameter("data");
		System.out.println("오나?");
		Map<String, String> param = new HashMap<String, String>();
		param.put("nowPrice", productService.nowPriceCheck(productNo));
		return param;
	}
	
	
    @RequestMapping(value = "/bid",method = RequestMethod.POST)
    @ResponseBody
    public List<String> dataSend(HttpServletRequest request){
    	System.out.println("AA");
		MemberVO memberVO = (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String memberId = memberVO.getMemberId();
		String id = request.getParameter("id");
		String bidPrice = request.getParameter("bidPrice");

		HashMap<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("bidPrice", bidPrice);
		productService.bid(map);
    	
    	BidLogVO bvo = new BidLogVO(Integer.parseInt(bidPrice),memberId,id);
    	productService.insertLog(bvo);
    	List<BidLogVO> bidList = productService.recentBids(id);
    	System.out.println("BB");
    	List<String> list = new ArrayList<String>();
    	for (int i=0;i<bidList.size();i++) {
    		list.add(bidList.get(i).getMemberId()+"님  " +Integer.toString(bidList.get(i).getBidPrice()) + "원" );
    		list.add(bidList.get(i).getBidTime());
    	}
    	System.out.println(list);
        return list;
    }
    
   
    
}
