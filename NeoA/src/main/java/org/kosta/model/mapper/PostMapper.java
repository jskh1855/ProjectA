﻿package org.kosta.model.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.kosta.model.vo.BidLogVO;
import org.kosta.model.vo.PagingBeanMain;
import org.kosta.model.vo.PickVO;
import org.kosta.model.vo.PostVO;
import org.kosta.model.vo.QnAVO;

@Mapper
public interface PostMapper {
	
	//List<PostVO> showAll(@Param("pg") PagingBean pg);
	List<PostVO> showAll(HashMap<String, Object> map);
	
	int showAllCount(PagingBeanMain pg);
	
	String nowPriceCheck(String productNo);

	void registerProduct(PostVO pvo);
	
	PostVO getproductDetails(String productNo);
	
	String selectPick(HashMap<String, String> map);
	
	void addPick(HashMap<String, String> map);

	//PickVO addCart(HashMap<>());
	List<PostVO> searchByTitle(String title);
	
	PostVO randPost();
	
	void registerQuestion(HashMap<String, String> map);
	
	void registerAnswer(HashMap<String, String> map);
	
	List<QnAVO> getQnAList(String productNo);
	
	
	PickVO deletePick(String pickNo);
	
	void bid(HashMap<String, String> map);
	
	void insertLog(BidLogVO bvo);

	void deletePickByPostNoAndMId(HashMap<String, String> map);
	
	void insertPickByPostNoAndMId(HashMap<String, String> map);
	
	List<BidLogVO> recentBids(String productNo);

	void updateState(String productNo);

	void insertBidComplete(HashMap<String, String> map);
	
	List<PostVO> recentThree();
	

	List<String> findPopular();
}
