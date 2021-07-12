package org.kosta.model.service;

import java.util.List;

import org.kosta.model.vo.Authority;
import org.kosta.model.vo.MemberVO;
import org.kosta.model.vo.PagingBean;
import org.kosta.model.vo.PostVO;

public interface MemberService {

	void registerMember(MemberVO vo);

	void updateMember(MemberVO memberVO);

	String idcheck(String id);

	List<Authority> selectAuthorityByUsername(String username);

	MemberVO findMemberById(String id);

	List<PostVO> getSellProductListById(String id, PagingBean pagingBean);

	int getTotalSellProductCountById(String id);

}
