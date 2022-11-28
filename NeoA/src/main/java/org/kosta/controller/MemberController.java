package org.kosta.controller;

import java.util.ArrayList;
import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.kosta.model.service.MemberService;
import org.kosta.model.service.ProductService;
import org.kosta.model.vo.MemberVO;
import org.kosta.model.vo.PagingBean;
import org.kosta.model.vo.PostVO;
import org.springframework.lang.Nullable;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MemberController {

	@Resource
	private ProductService productService;
	
	@Resource
	private MemberService memberService;

	// ***************************register***********************************

	@RequestMapping("user/registerForm")
	public String registerForm() {
		return "member/registerForm.tiles";
	}

	@RequestMapping(value = "user/registerMember", method = RequestMethod.POST)
	public String register(MemberVO vo) {
		memberService.registerMember(vo);
		return "redirect:/user/registerResultView?id=" + vo.getMemberId();
	}

	@RequestMapping("user/registerResultView")
	public ModelAndView registerResultView(String id, ModelAndView mv) {
		MemberVO vo = memberService.findMemberById(id);
		mv.addObject("id", vo.getMemberId());
		mv.addObject("name", vo.getName());
		mv.addObject("address", vo.getAddress());
		mv.addObject("phone", vo.getPhoneNo());
		mv.setViewName("member/register_result.tiles");
		return mv;
	}

	@RequestMapping("user/idcheckAjax")
	@ResponseBody
	public String idcheckAjax(String id) {
		return memberService.idcheck(id);
	}

	// ***************************update****************************************

	@RequestMapping("updateForm")
	public String updateForm() {
		return "member/updateForm.tiles";
	}

	@RequestMapping("updateMemberAction")
	public String updateMemberAction(HttpServletRequest request, MemberVO memberVO) {

		MemberVO pvo = (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		memberService.updateMember(memberVO);

		pvo.setPassword(memberVO.getPassword());
		pvo.setName(memberVO.getName());
		pvo.setAddress(memberVO.getAddress());

		return "member/update_result.tiles";
	}

	@RequestMapping("/user/loginPageFail")
	public String loginFail() {
		return "member/login_fail.tiles";
	}

	@RequestMapping("user/loginPage")
	public String loginPage() {
		return "member/loginPage.tiles";
	}

	// ***************************mypage********************************************
	@RequestMapping("/mypage")
	public String mypage(Model model, @RequestParam("pageNo") @Nullable String pageNo) {
		MemberVO memberVO = (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String id = memberVO.getMemberId();

		int totalPostCount = memberService.getTotalSellProductCountById(id);
		PagingBean pagingBean = null;
		if (pageNo == null) {
			pagingBean = new PagingBean(totalPostCount);
		} else {
			pagingBean = new PagingBean(totalPostCount, Integer.parseInt(pageNo));
		}
		model.addAttribute("pagingBean", pagingBean);
		List<PostVO> list = memberService.getSellProductListById(id, pagingBean);
		model.addAttribute("list", list);

		return "member/mypage.tiles";
	}

	@RequestMapping("/myBidList")
	public String myBidList(Model model, @RequestParam("pageNo") @Nullable String pageNo) {
		MemberVO memberVO = (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String id = memberVO.getMemberId();
		int totalPostCount = memberService.getTotalBidProductCountById(id);
		PagingBean pagingBean = null;
		if (pageNo == null) {
			pagingBean = new PagingBean(totalPostCount);
		} else {
			pagingBean = new PagingBean(totalPostCount, Integer.parseInt(pageNo));
		}
		
		model.addAttribute("pagingBean", pagingBean);
		List<PostVO> list = memberService.getBidProductListById(id, pagingBean);
		model.addAttribute("list", list);
		return "member/mypage_bid_list.tiles";
	}

	@RequestMapping("/mypagePickList")
	public String mypagePickList(Model model, @RequestParam("pageNo") @Nullable String pageNo) {
		MemberVO memberVO = (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String id = memberVO.getMemberId();

		int totalPostCount = memberService.getTotalPickProductCountById(id);
		PagingBean pagingBean = null;
		if (pageNo == null) {
			pagingBean = new PagingBean(totalPostCount);
		} else {
			pagingBean = new PagingBean(totalPostCount, Integer.parseInt(pageNo));
		}
		model.addAttribute("pagingBean", pagingBean);
		List<PostVO> list = memberService.getPickProductListById(id, pagingBean);
		model.addAttribute("list", list);

		return "member/mypage_pick_list.tiles";
	}

	@RequestMapping("/mypageMyInfo")
	public String mypageMyInfo(Model model) {
		MemberVO memberVO = (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		model.addAttribute("memberVO", memberService.findMemberById(memberVO.getMemberId()));
		return "member/mypage_my_info.tiles";
	}

	@PostMapping("/updateMemberInfo")
	public String updateMemberInfo(MemberVO memberVO) {

		if (memberVO.getPassword() == "") {
			System.out.println("updateMemberWithoutPasswrod");
			memberService.updateMemberWithoutPasswrod(memberVO);
		} else {
			memberService.updateMember(memberVO);
		}

		return "redirect:updateMemberInfoOk";
	}

	@RequestMapping("updateMemberInfoOk")
	public String updateMemberInfoOk(Model model) {
		MemberVO memberVO = (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		model.addAttribute("memberVO", memberService.findMemberById(memberVO.getMemberId()));
		model.addAttribute("message", "회원정보 수정이 완료되었습니다.");
		return "member/mypage_my_info.tiles";
	}

	@RequestMapping("/deleteMember")
	public String deleteMember() {

		MemberVO memberVO = (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String memberId = memberVO.getMemberId();

		memberService.deleteMember(memberId);
		return "redirect:deleteMemberResult";
	}

	@RequestMapping()
	public String deleteMemberResult(Model model) {

		model.addAttribute("message", "회원탈퇴가 완료되었습니다.");

		return "member/deleteMemberResult.tiles";
	}

	@RequestMapping("/mypageSellSuccess")
	public String mypageSellSuccess(Model model, @RequestParam("pageNo") @Nullable String pageNo) {
		MemberVO memberVO = (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String memberId = memberVO.getMemberId();
		int totalPostCount = memberService.getMySellSucessCountById(memberId);
		PagingBean pagingBean = null;
		if (pageNo == null) {
			pagingBean = new PagingBean(totalPostCount);
		} else {
			pagingBean = new PagingBean(totalPostCount, Integer.parseInt(pageNo));
		}
		model.addAttribute("pagingBean", pagingBean);
		List<PostVO> list = memberService.getMySellSuccessList(memberId, pagingBean);
		model.addAttribute("list", list);
		MemberVO buyerMemberVO = null;
		for (int i = 0; i < list.size(); i++) {
			if (list.get(i).getBidLogVOList().get(0) != null) {
				buyerMemberVO = memberService.findMemberById(list.get(i).getBidLogVOList().get(0).getMemberId());
			}
		}
		model.addAttribute("buyerMemberVO", buyerMemberVO);
		return "member/mypageSellSuccess.tiles";

	}

	@RequestMapping("/mypageBidSuccess")
	public String mypageBidSuccess(Model model, @RequestParam("pageNo") @Nullable String pageNo) {
		MemberVO memberVO = (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String memberId = memberVO.getMemberId();
		List<String> myBidSuccessList =  memberService.getMyBidSuccessList(memberId);
		
		
		int totalPostCount = myBidSuccessList.size();
		PagingBean pagingBean = null;
		if (pageNo == null) {
			pagingBean = new PagingBean(totalPostCount);
		} else {
			pagingBean = new PagingBean(totalPostCount, Integer.parseInt(pageNo));
		}
		model.addAttribute("pagingBean", pagingBean);
		
		List<PostVO> list = new ArrayList<PostVO>();
		
		for(int i=0; i<totalPostCount;i++) {
			list.add(productService.getproductDetails(myBidSuccessList.get(i)));
		}
		model.addAttribute("list", list);
		return "member/mypageBidSuccess.tiles";
	}

}
