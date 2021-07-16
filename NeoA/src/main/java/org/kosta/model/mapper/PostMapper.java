package org.kosta.model.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.kosta.model.vo.PagingBean;
import org.kosta.model.vo.PagingBeanMain;
import org.kosta.model.vo.PickVO;
import org.kosta.model.vo.PostVO;
import org.kosta.model.vo.QnAVO;

@Mapper
public interface PostMapper {
	
	//List<PostVO> showAll(@Param("pg") PagingBean pg);
	List<PostVO> showAll(PagingBeanMain pg);
	
	int showAllCount(PagingBeanMain pg);

	void registerProduct(PostVO pvo);
	
	PostVO getproductDetails(String productNo);
	
	void addPick(HashMap<String, String> map);

	//PickVO addCart(HashMap<>());
	List<PostVO> searchByTitle(String title);
	
	PostVO randPost();
	
	void registerQuestion(HashMap<String, String> map);
	
	void registerAnswer(HashMap<String, String> map);
	
	List<QnAVO> getQnAList(String productNo);
	
	PickVO deletePick(String pickNo);
}
