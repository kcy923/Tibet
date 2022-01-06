package com.myspring.tibet.order.dao;

import java.util.List;

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
	public List<OrderVO> cartList(String user_id) throws Exception {
		return sqlSession.selectList(namespace + ".cartList", user_id);
	}
	
	@Override
	public int addCart(OrderVO orderVO) {
		return sqlSession.insert(namespace + ".addCart", orderVO);
	}
	
	@Override
	public int modifyCount(OrderVO orderVO) {
		return sqlSession.update(namespace + ".modifyCnt", orderVO);
	}

	@Override
	public int deleteCart(OrderVO orderVO) {
		return sqlSession.delete(namespace + ".deleteCart", orderVO);
	}

	@Override
	public int checkCart(OrderVO orderVO) {
		/*Map<String, Object> map = new HashMap<String, Object>();
		map.put("product_num", product_num);
		map.put("product_color", product_color);
		map.put("product_size", product_size);
		map.put("user_id", user_id);
		
		System.out.println("Result: " + map);*/	
		
		System.out.println("num: " + orderVO.getProduct_num());
		System.out.println("color: " + orderVO.getProduct_color());
		System.out.println("size: " + orderVO.getProduct_size());
		System.out.println("id: " + orderVO.getUser_id());
		
		return sqlSession.selectOne(namespace + ".checkCart", orderVO);
	}
}
