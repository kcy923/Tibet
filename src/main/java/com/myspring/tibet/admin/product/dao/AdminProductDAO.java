package com.myspring.tibet.admin.product.dao;

import java.util.List;

import com.myspring.tibet.product.vo.ProductVO;


public interface AdminProductDAO {
	// ��ǰ ��
	public ProductVO productDetail(String product_num);
	// ��ǰ ���
	public List<ProductVO> productlistName(int main_category_num) throws Exception;


}
