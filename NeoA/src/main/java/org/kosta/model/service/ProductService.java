package org.kosta.model.service;

import java.util.HashMap;
import java.util.List;

import org.kosta.model.vo.BidLogVO;
import org.kosta.model.vo.PostVO;
import org.kosta.model.vo.QnAVO;

public interface ProductService {

	List<PostVO> showAll(HashMap<String, Object> map);

	PostVO getproductDetails(String productNo);
	
	List<PostVO>  searchByTitle(String title);

	void registerProduct(PostVO pvo);

	void registerQuestion(String qnaContent, String memberId, String productNo);

	void registerAnswer(String qnaNo, String qnaContent, String memberId, String productNo);

	List<QnAVO> getQnAList(String productNo);
		
	String updatePick(HashMap<String, String> map);
	
	void bid(String id);
	
	void insertLog(BidLogVO bvo);

	List<BidLogVO> recentBids(String productNo);

	void updateState(String productNo);

	String getHighestBidMemberIdByProductNo(String productNo);

	void insertBidComplete(String productNo, String memberId);
	List<String> findPopular();
}
