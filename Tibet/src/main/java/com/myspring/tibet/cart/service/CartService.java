package com.myspring.tibet.cart.service;

import java.util.List;
import java.util.Map;

import com.myspring.tibet.cart.vo.CartVO;

public interface CartService {
	public List<CartVO> cartList(String user_id) throws Exception;
//	public List<CartVO> cartNowBuyList(Map nowBuyMap) throws Exception;
	public List<CartVO> cartNowBuyList(String user_id) throws Exception;
	public int addCart(CartVO cartVO) throws Exception;
	public int modifyCount(CartVO cartVO) throws Exception;
	public int deleteCart(CartVO cartVO) throws Exception;
	public int checkCart(CartVO cartVO) throws Exception;
}
