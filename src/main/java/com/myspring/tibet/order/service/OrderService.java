package com.myspring.tibet.order.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.dao.DataAccessException;

import com.myspring.tibet.board.vo.ReviewVO;
import com.myspring.tibet.order.vo.OrderVO;

public interface OrderService {
	public int addOrderList(List<OrderVO> orders) throws Exception;	
	public List<OrderVO> selectOrderNum() throws Exception;
	
	public List<OrderVO> selectOrderList(String user_id) throws Exception;
	public List<OrderVO> selectCancelList(String user_id) throws Exception;
	public List<OrderVO> selectDateOrderList(HashMap<String, String> dateMap) throws DataAccessException;
	public List<OrderVO> selectDateCancelList(HashMap<String, String> dateMap) throws DataAccessException;
	public void insertReviewWrite(ReviewVO reviewVO) throws Exception;
}
