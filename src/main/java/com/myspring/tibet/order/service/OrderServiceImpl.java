package com.myspring.tibet.order.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.myspring.tibet.board.vo.ReviewVO;
import com.myspring.tibet.order.dao.OrderDAO;
import com.myspring.tibet.order.vo.OrderVO;

@Service("orderService")
public class OrderServiceImpl implements OrderService{
	@Autowired
	private OrderDAO orderDao;
	
	@Override
	public List<OrderVO> selectOrderList(String user_id) throws Exception {
		return orderDao.selectOrderList(user_id);
	}
	
	@Override
	public List<OrderVO> selectCancelList(String user_id) throws Exception {
		return orderDao.selectCancelList(user_id);
	}
	
	@Override
	public List<OrderVO> selectDateOrderList(HashMap<String, String> dateMap) throws DataAccessException {
		return orderDao.selectDateOrderList(dateMap);
	}
	
	@Override
	public List<OrderVO> selectDateCancelList(HashMap<String, String> dateMap) throws DataAccessException {
		return orderDao.selectDateCancelList(dateMap);
	}
	
	@Override
	public void insertReviewWrite(ReviewVO reviewVO) throws Exception{
		orderDao.reviewWrite(reviewVO);
	}

}
