package com.myspring.tibet.cart.dao;

import java.util.List;
import java.util.Map;

import com.myspring.tibet.cart.vo.CartVO;

public interface CartDAO {
	public List<CartVO> cartList(String user_id) throws Exception;	
//	public List<CartVO> cartNowBuyList(Map nowBuyMap) throws Exception;	
	public List<CartVO> cartNowBuyList(String user_id) throws Exception;	
	public int addCart(CartVO cartVO);
	public int modifyCount(CartVO cartVO);
	public int deleteCart(CartVO cartVO);
	public int checkCart(CartVO cartVO);
}
