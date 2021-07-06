package org.kosta.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.kosta.model.vo.PickVO;
import org.kosta.model.vo.PostVO;

@Mapper
public interface PostMapper {
	
	List<PostVO> showAll();

	void registerProduct(PostVO pvo);
	
	PostVO viewDetailPost(String productNo);
	
<<<<<<< HEAD
	PickVO addCart(String productNo, String memberId);
=======
	//PickVO addCart(HashMap<>());
>>>>>>> 46d3083121c3a6c9d4971ee798f881006c19c022
}
