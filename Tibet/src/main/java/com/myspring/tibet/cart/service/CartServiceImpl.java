package com.myspring.tibet.cart.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.myspring.tibet.cart.dao.CartDAO;
import com.myspring.tibet.cart.vo.CartVO;

@Service("cartService")
public class CartServiceImpl implements CartService {
	@Inject
	private CartDAO cartDao;
	
	@Override
	public List<CartVO> cartList(String user_id) throws Exception {
		return cartDao.cartList(user_id);
	}
	
//	@Override
//	public List<CartVO> cartNowBuyList(Map nowBuyMap) throws Exception {
//		return cartDao.cartNowBuyList(nowBuyMap);
//	}
	
	@Override
	public List<CartVO> cartNowBuyList(String user_id) throws Exception {
		return cartDao.cartNowBuyList(user_id);
	}
	
	@Override
	public int addCart(CartVO cartVO) throws Exception {
		return cartDao.addCart(cartVO);
	}
	
	@Override
	public int modifyCount(CartVO cartVO) throws Exception {		
		return cartDao.modifyCount(cartVO);
	}

	@Override
	public int deleteCart(CartVO cartVO) throws Exception {
		return cartDao.deleteCart(cartVO);
	}

	@Override
	public int checkCart(CartVO cartVO) throws Exception {
		return cartDao.checkCart(cartVO);
	}
}
