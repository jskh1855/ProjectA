package org.kosta.model.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
import org.kosta.model.vo.PostVO;

@Mapper
public interface PostMapper {
	
	ArrayList<PostVO> showAll();

	void registerProduct(PostVO pvo);
	
	PostVO viewDetailPost(String productNo);
}
