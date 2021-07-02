package org.kosta.model.service;

import java.util.List;

import org.kosta.model.vo.Authority;
import org.kosta.model.vo.MemberVO;

public interface MemberService {

	void registerMember(MemberVO vo);

	void updateMember(MemberVO memberVO);

	String idcheck(String id);

	List<Authority> selectAuthorityByUsername(String username);

	MemberVO findMemberById(String id);

}
