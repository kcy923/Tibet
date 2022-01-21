package com.myspring.tibet.order.dao;

import java.util.ArrayList;
import java.util.List;

import com.myspring.tibet.order.vo.OrderVO;

public interface OrderDAO {
	public int addOrderList(ArrayList<OrderVO> addList) throws Exception;	
}
