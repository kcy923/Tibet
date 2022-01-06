package com.myspring.tibet.order.service;

import java.util.List;

import com.myspring.tibet.order.vo.OrderVO;

public interface OrderService {
	public List<OrderVO> cartList(String user_id) throws Exception;
	public int addCart(OrderVO orderVO) throws Exception;
	public int modifyCount(OrderVO orderVO) throws Exception;
	public int deleteCart(OrderVO orderVO) throws Exception;
	//public int checkCart(String product_num, String product_color, String product_size, String user_id) throws Exception;
	public int checkCart(OrderVO orderVO) throws Exception;
}
