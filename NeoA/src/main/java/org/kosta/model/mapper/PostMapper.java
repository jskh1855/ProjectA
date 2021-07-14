package org.kosta.model.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.kosta.model.vo.PagingBean;
import org.kosta.model.vo.PagingBeanMain;
import org.kosta.model.vo.PickVO;
import org.kosta.model.vo.PostVO;

@Mapper
public interface PostMapper {
	
	//List<PostVO> showAll(@Param("pg") PagingBean pg);
	List<PostVO> showAll(PagingBeanMain pg);
	
	int showAllCount(PagingBeanMain pg);

	void registerProduct(PostVO pvo);
	
	PostVO viewDetailPost(String productNo);
	
	PickVO addCart(String productNo, String memberId);

	//PickVO addCart(HashMap<>());
	List<PostVO> searchByTitle(String title);
	
	PostVO randPost();
}
