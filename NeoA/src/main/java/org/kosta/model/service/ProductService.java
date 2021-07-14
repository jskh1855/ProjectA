package org.kosta.model.service;

import java.util.List;

import org.kosta.model.vo.PagingBeanMain;
import org.kosta.model.vo.PostVO;

public interface ProductService {

	List<PostVO> showAll(PagingBeanMain pagingBean);

	PostVO showDetails(String productNo);
	
	List<PostVO>  searchByTitle(String title);

	void registerProduct(PostVO pvo);
}
