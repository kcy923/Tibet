package com.myspring.tibet.order.service;

import java.util.ArrayList;
import java.util.List;

import com.myspring.tibet.order.vo.OrderVO;

public interface OrderService {
	public int addOrderList(ArrayList<OrderVO> addList) throws Exception;	
}
