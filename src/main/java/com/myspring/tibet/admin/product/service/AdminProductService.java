package com.myspring.tibet.admin.product.service;

import java.util.List;

import com.myspring.tibet.product.vo.ProductVO;


public interface AdminProductService {
	// ��ǰ ��
	public ProductVO productDetail(String product_num) throws Exception ;
	// ��ǰ ���
	public List<ProductVO> productListName(int main_category_num) throws Exception;
	
}
