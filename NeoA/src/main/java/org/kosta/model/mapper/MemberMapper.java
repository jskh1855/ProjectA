package org.kosta.model.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.kosta.model.vo.Authority;
import org.kosta.model.vo.BidLogVO;
import org.kosta.model.vo.MemberVO;
import org.kosta.model.vo.PostVO;

@Mapper
public interface MemberMapper {
	void registerMember(MemberVO memberVO);
	
	void updateMember(MemberVO memberVO);
	
	void registerRole(Authority authority);
	
	int idcheck(String id);
	
	List<Authority> selectAuthorityByUsername(String username);
	
	MemberVO findMemberById(String id);

	List<PostVO> getSellProductListById(HashMap<String, Object> map);

	int getTotalSellProductCountById(String id);

	List<PostVO> getBidProductListById(HashMap<String, Object> map);

	int getTotalBidProductCountById(String id);

	void updateMemberWithoutPasswrod(MemberVO memberVO);

	List<BidLogVO> getBidCountByProductNo(String productNo);

	int getTotalPickProductCountById(String id);

	List<PostVO> getPickProductListById(HashMap<String, Object> map);
	
	MemberVO deleteMember(String memberId);
	
	List<String> getMyBidProductList(String memberId);

	MemberVO getMemberVOByProductNo(String productNo);

	List<PostVO> getMySellSuccessList(HashMap<String, Object> map);

	int getMySellSucessCountById(String memberId);

	List<BidLogVO> getBidHighestByProductNo(String productNo);

	List<String> getMyBidSuccessList(String memberId);

	List<String> getMyBidLog(String id);

	int isBidSuccess(String id, String productNo);

	String getHighestBidMemberIdByProductNo(String productNo);
	
	
}

