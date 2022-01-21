package com.myspring.tibet.order.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.myspring.tibet.order.vo.OrderVO;

@Repository("orderDAO")
public class OrderDAOImpl implements OrderDAO {
	@Inject
	private SqlSession sqlSession;
	
	private static String namespace = "mappers.order";

	@Override
	public int addOrderList(ArrayList<OrderVO> addList) throws Exception {
//		int count = 0;
		Map<String, Object> map = new HashMap<>();
		map.put("addList", addList);
		    
		// 실행 결과 row 갯수를 리턴합니다.
//		count += orderDAO.addOrderList(map);
//		return count;
		return sqlSession.insert(namespace + ".addOrder", map);
	}
}
