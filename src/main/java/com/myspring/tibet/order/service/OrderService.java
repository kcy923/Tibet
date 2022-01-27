package com.myspring.tibet.order.service;

import java.util.List;

import com.myspring.tibet.order.vo.OrderVO;

public interface OrderService {
	public int addOrderList(List<OrderVO> orders) throws Exception;	
	public List<OrderVO> selectOrderNum() throws Exception;
}
