package org.kosta.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.kosta.model.vo.Authority;
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

	List<PostVO> findSellProductListById(String id);
	
}

