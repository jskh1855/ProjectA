package org.kosta.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.kosta.model.mapper.MemberMapper;
import org.kosta.model.vo.Authority;
import org.kosta.model.vo.BidLogVO;
import org.kosta.model.vo.MemberVO;
import org.kosta.model.vo.PagingBean;
import org.kosta.model.vo.PostVO;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class MemberServiceImpl implements MemberService {
	@Resource
	private MemberMapper memberMapper;

	@Resource
	private BCryptPasswordEncoder passwordEncoder;

	@Transactional
	@Override
	public void registerMember(MemberVO memberVO) {
		System.out.println("register member");
		String encodedPwd = passwordEncoder.encode(memberVO.getPassword());
		memberVO.setPassword(encodedPwd);
		System.out.println("register member2");
		System.out.println(memberVO);
		memberMapper.registerMember(memberVO);
		System.out.println("register member3");
		Authority authority = new Authority(memberVO.getMemberId(), "ROLE_MEMBER");
		System.out.println("register member4");
		System.out.println(authority);
		memberMapper.registerRole(authority);
		System.out.println("register member5");
	}

	@Override
	public void updateMember(MemberVO memberVO) {
		String encodePassword = passwordEncoder.encode(memberVO.getPassword());
		memberVO.setPassword(encodePassword);
		memberMapper.updateMember(memberVO);
	}

	@Override
	public String idcheck(String id) {
		int count = memberMapper.idcheck(id);
		return (count == 0) ? "ok" : "fail";
	}

	@Override
	public List<Authority> selectAuthorityByUsername(String username) {
		return memberMapper.selectAuthorityByUsername(username);
	}

	@Override
	public MemberVO findMemberById(String id) {
		return memberMapper.findMemberById(id);
	}

	@Override
	public List<PostVO> getSellProductListById(String id, PagingBean pagingBean) {
		int startRowNumber = pagingBean.getStartRowNumber();
		int endRowNumber = pagingBean.getEndRowNumber();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("startRowNumber", startRowNumber);
		map.put("endRowNumber", endRowNumber);
		List<PostVO> postlist = memberMapper.getSellProductListById(map);
		for (int i = 0; i < postlist.size(); i++) {
			String productNo = postlist.get(i).getProductNo();
			List<BidLogVO> bidList = memberMapper.getBidCountByProductNo(productNo);
			postlist.get(i).setBidLogVOList(bidList);
		}
		return postlist;
	}

	@Override
	public int getTotalSellProductCountById(String id) {
		return memberMapper.getTotalSellProductCountById(id);
	}

	@Override
	public List<PostVO> getBidProductListById(String id, PagingBean pagingBean) {
		int startRowNumber = pagingBean.getStartRowNumber();
		int endRowNumber = pagingBean.getEndRowNumber();
		HashMap<String, Object> map = new HashMap<String, Object>();
		// List<String> myBidProductList= memberMapper.getMyBidProductList(id);
		// System.out.println(myBidProductList);
		map.put("id", id);
		map.put("startRowNumber", startRowNumber);
		map.put("endRowNumber", endRowNumber);
		List<PostVO> postList = memberMapper.getBidProductListById(map);
		for (int i = 0; i < postList.size(); i++) {
			String productNo = postList.get(i).getProductNo();
//			System.out.println("test1"+postList);
			List<BidLogVO> bidList = memberMapper.getBidCountByProductNo(productNo);
//			System.out.println("test2"+postList);
			postList.get(i).setBidLogVOList(bidList);
//			System.out.println("test3"+postList);
		}
		return postList;
	}

	@Override
	public int getTotalBidProductCountById(String id) {
		return memberMapper.getTotalBidProductCountById(id);
	}

	@Override
	public int getTotalPickProductCountById(String id) {
		return memberMapper.getTotalPickProductCountById(id);
	}

	@Override
	public void updateMemberWithoutPasswrod(MemberVO memberVO) {
		memberMapper.updateMemberWithoutPasswrod(memberVO);
	}

	@Override
	public List<PostVO> getPickProductListById(String id, PagingBean pagingBean) {
		int startRowNumber = pagingBean.getStartRowNumber();
		int endRowNumber = pagingBean.getEndRowNumber();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("startRowNumber", startRowNumber);
		map.put("endRowNumber", endRowNumber);
		List<PostVO> postList = memberMapper.getPickProductListById(map);
		for (int i = 0; i < postList.size(); i++) {
			String productNo = postList.get(i).getProductNo();
			List<BidLogVO> pickList = memberMapper.getBidCountByProductNo(productNo);
			postList.get(i).setBidLogVOList(pickList);
		}
		return postList;
	}

	@Override
	public void deleteMember(String memberId) {
		memberMapper.deleteMember(memberId);
	}

	@Override
	public List<PostVO> getMySellSuccessList(String memberId, PagingBean pagingBean) {
		int startRowNumber = pagingBean.getStartRowNumber();
		int endRowNumber = pagingBean.getEndRowNumber();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("id", memberId);
		map.put("startRowNumber", startRowNumber);
		map.put("endRowNumber", endRowNumber);
		List<PostVO> postlist = memberMapper.getMySellSuccessList(map);
		for (int i = 0; i < postlist.size(); i++) {
			String productNo = postlist.get(i).getProductNo();
			List<BidLogVO> bidList = memberMapper.getBidHighestByProductNo(productNo);
			postlist.get(i).setBidLogVOList(bidList);
		}
		return postlist;
	}

	@Override
	public int getMySellSucessCountById(String memberId) {
		return memberMapper.getMySellSucessCountById(memberId);
	}

	@Override
	public List<String> getMyBidSuccessList(String memberId) {
		List<String> list = memberMapper.getMyBidSuccessList(memberId);
		return list;
	}

}
