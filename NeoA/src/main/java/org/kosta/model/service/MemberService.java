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

	List<PostVO> getBidProductListById(String id, PagingBean pagingBean);
	
	int getTotalBidProductCountById(String id);

	void updateMemberWithoutPasswrod(MemberVO memberVO);

	int getTotalPickProductCountById(String id);

	List<PostVO> getPickProductListById(String id, PagingBean pagingBean);

	void deleteMember(String memberId);

	List<PostVO> getMySellSuccessList(String memberId, PagingBean pagingBean);

	int getMySellSucessCountById(String memberId);
}
