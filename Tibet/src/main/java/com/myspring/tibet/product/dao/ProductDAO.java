package com.myspring.tibet.product.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.myspring.tibet.product.vo.ProductVO;


public interface ProductDAO {
	public List<ProductVO> productlistNew() throws Exception;
	public ProductVO productDetail(String product_num);
	public List<ProductVO> productlistHighprice() throws Exception;
	public List<ProductVO> productlistLowprice() throws Exception;
	public List<ProductVO> productlistName() throws Exception;	
}
