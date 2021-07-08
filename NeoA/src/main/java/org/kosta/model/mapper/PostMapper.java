package org.kosta.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.kosta.model.vo.PagingBean;
import org.kosta.model.vo.PickVO;
import org.kosta.model.vo.PostVO;

@Mapper
public interface PostMapper {
	
	List<PostVO> showAll(PagingBean pagingBean);

	void registerProduct(PostVO pvo);
	
	PostVO viewDetailPost(String productNo);
	

	PickVO addCart(String productNo, String memberId);

	//PickVO addCart(HashMap<>());
	PostVO searchByTitle(String title);
}
