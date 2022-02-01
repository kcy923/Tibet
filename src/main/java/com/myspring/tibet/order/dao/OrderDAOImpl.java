package com.myspring.tibet.order.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.tibet.board.vo.ReviewVO;
import com.myspring.tibet.order.vo.OrderVO;

@Repository("orderDAO")
public class OrderDAOImpl implements OrderDAO {
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public int addOrderList(OrderVO orderVO) throws Exception {
		System.out.println("dao : " + orderVO);
		System.out.println("order_name" + orderVO.getOrder_name());
		return sqlSession.insert("mappers.order.addOrder", orderVO);
	}

	@Override
	public List<OrderVO> selectOrderNum() throws Exception {
		return sqlSession.selectList("mappers.order.selectOrderNum");
	}
	
	@Override
	public List<OrderVO> selectOrderList(String user_id) throws DataAccessException {
		return sqlSession.selectList("mapper.order.selectOrderList", user_id);
	}
	
	@Override
	public List<OrderVO> selectCancelList(String user_id) throws DataAccessException {
		return sqlSession.selectList("mapper.order.selectCancelList", user_id);
	}
	
	@Override
	public List<OrderVO> selectDateOrderList(HashMap<String, String> dateMap) throws DataAccessException {
		System.out.println("DAO : " + dateMap);
		return sqlSession.selectList("mapper.order.selectDateOrderList", dateMap);
	}
	
	@Override
	public List<OrderVO> selectDateCancelList(HashMap<String, String> dateMap) throws DataAccessException {
		System.out.println("DAO : " + dateMap);
		return sqlSession.selectList("mapper.order.selectDateCancelList", dateMap);
	}
	
	@Override
	public void reviewWrite(ReviewVO reviewVO) throws DataAccessException {
		sqlSession.insert("mapper.order.reviewWrite",reviewVO);
	}
}
