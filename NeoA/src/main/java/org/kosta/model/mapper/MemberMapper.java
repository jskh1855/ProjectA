package org.kosta.model.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.kosta.model.vo.MemberVO;

@Mapper
public interface MemberMapper {
	void registerMember(MemberVO memberVO);
	
	void updateMember(MemberVO memberVO);
	
}

