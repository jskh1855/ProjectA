package org.kosta.neoA.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.kosta.neoA.model.vo.Authority;
import org.kosta.neoA.model.vo.MemberVO;
@Mapper
public interface MemberMapper {

	MemberVO findMemberById(String id);

	List<String> getAddressList();

	List<MemberVO> findMemberListByAddress(String address);	

	int getMemberCount();

	void updateMember(MemberVO vo);

	void registerMember(MemberVO vo);

	int idcheck(String id);

	List<Authority> selectAuthorityByUsername(String username);

	void registerRole(Authority authority);

}