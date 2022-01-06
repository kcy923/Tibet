package com.myspring.tibet.order.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.myspring.tibet.order.dao.OrderDAO;
import com.myspring.tibet.order.vo.OrderVO;

@Service("orderService")
public class OrderServiceImpl implements OrderService {
	@Inject
	private OrderDAO orderDao;
	
	@Override
	public List<OrderVO> cartList(String user_id) throws Exception {
		return orderDao.cartList(user_id);
	}
	
	@Override
	public int addCart(OrderVO orderVO) throws Exception {
		return orderDao.addCart(orderVO);
	}
	
	@Override
	public int modifyCount(OrderVO orderVO) throws Exception {		
		return orderDao.modifyCount(orderVO);
	}

	@Override
	public int deleteCart(OrderVO orderVO) throws Exception {
		return orderDao.deleteCart(orderVO);
	}

	@Override
	public int checkCart(OrderVO orderVO) throws Exception {
		return orderDao.checkCart(orderVO);
	}
}
