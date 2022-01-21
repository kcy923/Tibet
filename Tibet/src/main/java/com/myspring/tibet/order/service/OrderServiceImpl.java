package com.myspring.tibet.order.service;

import java.util.ArrayList;
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
	public int addOrderList(ArrayList<OrderVO> addList) throws Exception {
		return orderDAO.addOrderList(addList);
	}

}
