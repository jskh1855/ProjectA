package org.kosta.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.kosta.model.service.MemberService;
import org.kosta.model.vo.MemberVO;
import org.kosta.model.vo.PagingBean;
import org.kosta.model.vo.PostVO;
import org.springframework.lang.Nullable;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MemberController {

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
	public String registerResultView(String id, Model model) {
		MemberVO vo = memberService.findMemberById(id);
		model.addAttribute("memberVO", vo);
		return "member/register_result.tiles";
	}

	@RequestMapping("user/idcheckAjax")
	@ResponseBody
	public String idcheckAjax(String id) {
		return memberService.idcheck(id);
	}

	// ***************************register
	// end****************************************

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

	@RequestMapping("login_fail")
	public String loginFail() {
		return "member/login_fail.tiles";
	}

	@RequestMapping("user/loginPage")
	public String loginPage() {
		return "member/loginPage.tiles";
	}

	// ***************************update end****************************************

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
		List<PostVO> list= memberService.getBidProductListById(id, pagingBean);
		model.addAttribute("list", list);
		
		return "member/mypage_bid_list.tiles";
	}

	@RequestMapping("/mypagePickList")
	public String mypagePickList() {

		return "member/mypage_pick_list.tiles";
	}

	@RequestMapping("/mypageMyInfo")
	public String mypageMyInfo() {

		return "member/mypage_my_info.tiles";
	}

}
