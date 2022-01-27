package com.myspring.tibet.order.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.myspring.tibet.order.dao.OrderDAO;
import com.myspring.tibet.order.vo.OrderVO;

@Service("orderService")
public class OrderServiceImpl implements OrderService {
	@Inject
	private OrderDAO orderDAO;

	@Override
	public int addOrderList(List<OrderVO> orders) throws Exception {
		//List<OrderVO> result = new ArrayList<OrderVO>();
		
		for(OrderVO orderVO : orders) {
			System.out.println("service(orderVO) : " + orderVO);
			orderDAO.addOrderList(orderVO);
		}
		return 0;
	}

	@Override
	public List<OrderVO> selectOrderNum() throws Exception {
		return orderDAO.selectOrderNum();
	}
}
