package org.kosta.model.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.kosta.model.mapper.PostMapper;
import org.kosta.model.vo.PagingBean;
import org.kosta.model.vo.PostVO;
import org.springframework.stereotype.Service;

@Service
public class ProductServiceImpl implements ProductService {
	
	@Resource
	private PostMapper postMapper;
	
	@Override
	public List<PostVO> showAll(PagingBean pagingBean){
		System.out.println("2 test  "+pagingBean.getEndRowNumber());
		 
		return postMapper.showAll(pagingBean);
	}
	
	@Override
	public PostVO showDetails(String productNo) {
		return postMapper.viewDetailPost(productNo);
	}

	@Override
	public List<PostVO> searchByTitle(String title) {
		
		return postMapper.searchByTitle(title);
	}

	@Override
	public void registerProduct(PostVO pvo) {

		postMapper.registerProduct(pvo);
	}
	
	
	
}
