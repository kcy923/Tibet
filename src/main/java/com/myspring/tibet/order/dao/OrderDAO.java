package com.myspring.tibet.order.dao;

import java.util.ArrayList;
import java.util.List;

import com.myspring.tibet.order.vo.OrderPageVO;
import com.myspring.tibet.order.vo.OrderVO;

public interface OrderDAO {
	public int addOrderList(OrderVO orderVO) throws Exception;
	public List<OrderVO> selectOrderNum() throws Exception;
}
