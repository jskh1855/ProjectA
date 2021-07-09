package org.kosta.model.service;

import java.util.List;

import org.kosta.model.vo.PagingBean;
import org.kosta.model.vo.PostVO;

public interface ProductService {

	List<PostVO> showAll(PagingBean pagingBean);

	PostVO showDetails(String productNo);
	
	List<PostVO>  searchByTitle(String title);

}
