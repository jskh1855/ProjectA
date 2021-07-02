package org.kosta.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.kosta.model.service.MemberService;
import org.kosta.model.vo.MemberVO;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MemberController {
	
	@Resource
	private MemberService memberService;

	//@Secured("ROLE_MEMBER")
	@RequestMapping("updateForm")
	public String updateForm() {
		return "member/updateForm.tiles";
	}

	//@Secured("ROLE_MEMBER")
	@RequestMapping("updateMemberAction")
	public String updateMemberAction(HttpServletRequest request, MemberVO memberVO) {
		
		MemberVO pvo = (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		memberService.updateMember(memberVO); 
		
		pvo.setPassword(memberVO.getPassword());
		pvo.setName(memberVO.getName());
		pvo.setAddress(memberVO.getAddress());
		
		return "member/update_result.tiles";
	}
	
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
	public ModelAndView registerResultView(String id) {
		MemberVO vo = memberService.findMemberById(id);
		return new ModelAndView("member/register_result.tiles", "memberVO", vo);
	}

	@RequestMapping("user/idcheckAjax")
	@ResponseBody
	public String idcheckAjax(String id) {
		return memberService.idcheck(id);
	}

	
}
