package org.kosta.model.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
import org.kosta.model.vo.MemberVO;
import org.kosta.model.vo.PostVO;

@Mapper
public interface MemberMapper {
	void registerMember(MemberVO memberVO);
	
	void updateMember(MemberVO memberVO);
	
	ArrayList<PostVO> showAll();
}

