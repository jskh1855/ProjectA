package org.kosta.model.service;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.model.mapper.MemberMapper;
import org.kosta.model.vo.Authority;
import org.kosta.model.vo.MemberVO;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class MemberServiceImpl implements MemberService {
	@Resource
	private MemberMapper memberMapper;

	@Resource
	private BCryptPasswordEncoder passwordEncoder;

	@Transactional
	@Override
	public void registerMember(MemberVO memberVO) {
		System.out.println("register member");
		String encodedPwd = passwordEncoder.encode(memberVO.getPassword());
		memberVO.setPassword(encodedPwd);
		System.out.println("register member2");
		System.out.println(memberVO);
		memberMapper.registerMember(memberVO);
		System.out.println("register member3");
		Authority authority = new Authority(memberVO.getMemberId(), "ROLE_MEMBER");
		System.out.println("register member4");
		System.out.println(authority);
		memberMapper.registerRole(authority);
		System.out.println("register member5");
	}

	@Override
	public void updateMember(MemberVO memberVO) {
		String encodePassword = passwordEncoder.encode(memberVO.getPassword());
		memberVO.setPassword(encodePassword);
		memberMapper.updateMember(memberVO);
	}

	@Override
	public String idcheck(String id) {
		int count = memberMapper.idcheck(id);
		return (count == 0) ? "ok" : "fail";
	}

	@Override
	public List<Authority> selectAuthorityByUsername(String username) {
		return memberMapper.selectAuthorityByUsername(username);
	}

	@Override
	public MemberVO findMemberById(String id) {
		return memberMapper.findMemberById(id);
	}
	
	
}
