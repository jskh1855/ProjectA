package org.kosta.model.service;

import java.lang.reflect.Member;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.kosta.model.mapper.MemberMapper;
import org.kosta.model.mapper.PostMapper;
import org.kosta.model.vo.BidLogVO;
import org.kosta.model.vo.MemberVO;
import org.kosta.model.vo.PostVO;
import org.kosta.model.vo.QnAVO;
import org.springframework.stereotype.Service;

@Service
public class ProductServiceImpl implements ProductService {
	
	@Resource
	private PostMapper postMapper;
	
	@Resource 
	private MemberMapper memberMapper;
	
	@Override
	public List<PostVO> showAll(HashMap<String, Object> map){
		System.out.println("show All service");
		List<PostVO> postList = postMapper.showAll(map);
		for (int i = 0; i < postList.size(); i++) {
			String productNo = postList.get(i).getProductNo();
			List<BidLogVO> pickList = memberMapper.getBidCountByProductNo(productNo);
			postList.get(i).setBidLogVOList(pickList);
		}
		return postList;
	}

	
	@Override
	public PostVO getproductDetails(String productNo) {
		PostVO postVO = postMapper.getproductDetails(productNo);
		MemberVO memberVO = memberMapper.getMemberVOByProductNo(productNo);
		postVO.setMemberVO(memberVO);
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
	public void bid(String id){
		postMapper.bid(id);
	}
	
	@Override
	public void insertLog(BidLogVO bvo){
		postMapper.insertLog(bvo);
	}

	@Override
	public String updatePick(HashMap<String, String> map) {
		String checkPick=postMapper.selectPick(map);
		
		if(checkPick.equals("0")) { // 현재 0 : 찜X -> 찜O insert문 실행
			System.out.println("service update");
			postMapper.insertPickByPostNoAndMId(map);
		}else if(checkPick.equals("1")) { // 현재 1 : 찜O -> 찜X delete문 실행
			System.out.println("service delete");
			postMapper.deletePickByPostNoAndMId(map);
		}else { 
			System.out.println("오류");
			return null;
		}
		
		return postMapper.selectPick(map);
	}
	
	@Override
	public List<BidLogVO> recentBids(String productNo){
		return postMapper.recentBids(productNo);
	}


	@Override
	public void updateState(String productNo) {
		postMapper.updateState(productNo);		
	}


	@Override
	public String getHighestBidMemberIdByProductNo(String productNo) {
		String memberId = memberMapper.getHighestBidMemberIdByProductNo(productNo);
		return memberId;
	}


	@Override
	public void insertBidComplete(String productNo, String memberId) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("productNo", productNo);
		map.put("memberId", memberId);
		postMapper.insertBidComplete(map);
	}
}
