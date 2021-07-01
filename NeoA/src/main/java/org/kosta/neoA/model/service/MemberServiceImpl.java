package org.kosta.neoA.model.service;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.neoA.model.mapper.MemberMapper;
import org.kosta.neoA.model.vo.Authority;
import org.kosta.neoA.model.vo.MemberVO;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class MemberServiceImpl implements MemberService {
	@Resource
	private MemberMapper memberMapper;
	/*
	 *  비밀번호 암호화처리를 위한 객체를 주입받는다
	 *  spring boot : org.kosta.config.security.WebSecurityConfig 에 @Bean 설정되어 있음
	 *  spring legacy : spring-security.xml 에서 bean 설정이 되어 있음 
	 */
	@Resource
	private BCryptPasswordEncoder passwordEncoder;

	@Override
	public MemberVO findMemberById(String id) {
		return memberMapper.findMemberById(id);
	}

	@Override
	public List<String> getAddressList() {
		return memberMapper.getAddressList();
	}

	@Override
	public List<MemberVO> findMemberListByAddress(String address) {
		return memberMapper.findMemberListByAddress(address);
	}

	@Override
	public int getMemberCount() {
		return memberMapper.getMemberCount();
	}

	// 회원가입시 반드시 권한까지 부여되도록 트랜잭션 처리한다
	@Transactional
	@Override
	public void registerMember(MemberVO vo) {
		// 비밀번호를 bcrypt 알고리즘으로 암호화하여 DB에 저장한다
		String encodedPwd = passwordEncoder.encode(vo.getPassword());
		vo.setPassword(encodedPwd);
		memberMapper.registerMember(vo);
		// 회원 가입시 반드시 권한이 등록되도록 트랜잭션처리를 한다
		Authority authority = new Authority(vo.getMemberId(), "ROLE_MEMBER");
		memberMapper.registerRole(authority);
	}

	@Override
	public void updateMember(MemberVO memberVO) {
		// 변경할 비밀번호를 암호화한다
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
}
