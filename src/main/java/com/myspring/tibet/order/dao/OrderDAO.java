package com.myspring.tibet.order.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.dao.DataAccessException;

import com.myspring.tibet.board.vo.ReviewVO;
import com.myspring.tibet.order.vo.OrderVO;

public interface OrderDAO {
	public int addOrderList(OrderVO orderVO) throws Exception;
	public List<OrderVO> selectOrderNum() throws Exception;
	
	public List<OrderVO> selectOrderList(String user_id) throws DataAccessException;
	public List<OrderVO> selectCancelList(String user_id) throws DataAccessException;
	public List<OrderVO> selectDateOrderList(HashMap<String, String> dateMap) throws DataAccessException;
	public List<OrderVO> selectDateCancelList(HashMap<String, String> dateMap) throws DataAccessException;
	public void reviewWrite(ReviewVO reviewVO) throws DataAccessException;
}
