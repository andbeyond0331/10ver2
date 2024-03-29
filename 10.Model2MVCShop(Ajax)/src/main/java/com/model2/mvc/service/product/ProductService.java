package com.model2.mvc.service.product;

import java.util.Map;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;


/*
 * 상품관리를 추상화 캡슐화한 ProductService Interface
 */

public interface ProductService {
	
	// 상품 등록
	public void addProduct(Product product) throws Exception;
	
	// 상품 조회
	public Product findProduct(int prodNo) throws Exception;
	
	// 상품 목록 조회
	public Map<String,Object> getProductList(Search search) throws Exception;
	
	// 상품 수정
	public void updateProduct(Product product) throws Exception;
	
}