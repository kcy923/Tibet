package com.myspring.tibet.order.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.myspring.tibet.order.vo.OrderPageVO;
import com.myspring.tibet.order.vo.OrderVO;

@Repository("orderDAO")
public class OrderDAOImpl implements OrderDAO {
	@Inject
	private SqlSession sqlSession;
	
	private static String namespace = "mappers.order";
	
	@Override
	public int addOrderList(OrderVO orderVO) throws Exception {
		System.out.println("dao : " + orderVO);
		System.out.println("order_name" + orderVO.getOrder_name());
		return sqlSession.insert(namespace + ".addOrder", orderVO);
	}

	@Override
	public List<OrderVO> selectOrderNum() throws Exception {
		return sqlSession.selectList(namespace + ".selectOrderNum");
	}
}
