package org.kosta.neoA.model.service;

import java.util.List;

import org.kosta.neoA.model.vo.Authority;
import org.kosta.neoA.model.vo.MemberVO;

public interface MemberService {
	MemberVO findMemberById(String id);

	List<String> getAddressList();

	List<MemberVO> findMemberListByAddress(String address);

	int getMemberCount();

	void updateMember(MemberVO vo);

	void registerMember(MemberVO vo);

	String idcheck(String id);
	
	List<Authority> selectAuthorityByUsername(String username);
}
