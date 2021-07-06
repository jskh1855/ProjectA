package org.kosta.model.service;

import java.util.List;

import org.kosta.model.vo.PostVO;

public interface ProductService {

	List<PostVO> showAll();

	PostVO showDetails(String productNo);

}
