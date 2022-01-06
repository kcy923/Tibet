package com.myspring.tibet.order.dao;

import java.util.List;

import com.myspring.tibet.order.vo.OrderVO;

public interface OrderDAO {
	public List<OrderVO> cartList(String user_id) throws Exception;	
	public int addCart(OrderVO orderVO);
	public int modifyCount(OrderVO orderVO);
	public int deleteCart(OrderVO orderVO);
	//public int checkCart(String product_num, String product_color, String product_size, String user_id);
	public int checkCart(OrderVO orderVO);
}
