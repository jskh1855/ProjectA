package org.kosta.model.service;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.model.mapper.PostMapper;
import org.kosta.model.vo.PostVO;
import org.springframework.stereotype.Service;

@Service
public class ProductServiceImpl implements ProductService {
	
	@Resource
	private PostMapper postMapper;
	
	@Override
	public List<PostVO> showAll(){
		return postMapper.showAll();
	}
	
	@Override
	public PostVO showDetails(String productNo) {
		return postMapper.viewDetailPost(productNo);
	}
}
