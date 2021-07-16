package org.kosta.model.service;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.kosta.model.mapper.PostMapper;
import org.kosta.model.vo.BidLogVO;
import org.kosta.model.vo.PostVO;
import org.kosta.model.vo.QnAVO;
import org.springframework.stereotype.Service;

@Service
public class ProductServiceImpl implements ProductService {
	
	@Resource
	private PostMapper postMapper;
	
	@Override
	public List<PostVO> showAll(HashMap<String, Object> map){
		return postMapper.showAll(map);
	}
	
	@Override
	public PostVO getproductDetails(String productNo) {
		PostVO postVO = postMapper.getproductDetails(productNo);
		return postVO;
	}

	@Override
	public List<PostVO> searchByTitle(String title) {
		
		return postMapper.searchByTitle(title);
	}

	@Override
	public void registerProduct(PostVO pvo) {

		postMapper.registerProduct(pvo);
	}
	
	@Override
	public void registerQuestion(String qnaContent, String memberId, String productNo) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("qnaContent", qnaContent);
		map.put("memberId", memberId);
		map.put("productNo", productNo);
		postMapper.registerQuestion(map);
	}
	
	@Override
	public void registerAnswer(String qnaNo, String qnaContent, String memberId, String productNo) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("qnaNo", qnaNo);
		map.put("qnaContent", qnaContent);
		map.put("memberId", memberId);
		map.put("productNo", productNo);
		postMapper.registerAnswer(map);
	}
	
	@Override
	public List<QnAVO> getQnAList(String productNo){
		return postMapper.getQnAList(productNo);
	}

	@Override
	public void addPick(String memberId, String productNo) {
		HashMap<String, String> map = new HashMap<String,String>();
		map.put("memberId", memberId);
		map.put("productNo", productNo);
		postMapper.addPick(map);
		
	}
	
	@Override
	public void bid(PostVO pvo){
		postMapper.bid(pvo);
	}
	
	@Override
	public void insertLog(BidLogVO bvo){
		postMapper.insertLog(bvo);
	}
	
}
