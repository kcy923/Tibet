package com.myspring.tibet.board.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.tibet.board.vo.NoticeVO;
import com.myspring.tibet.board.vo.QnaVO;
import com.myspring.tibet.board.vo.ReviewVO;

@Repository("boardDAO")
public class BoardDAOImpl implements BoardDAO {
	@Autowired
    private SqlSession sqlSession;

	@Override
	public List selectAllNoticesList() throws DataAccessException {
		List<NoticeVO> noticesList = sqlSession.selectList("mapper.board.selectAllNoticesList");
		return noticesList;
	}
	
	@Override
	public List selectAllQnasList() throws DataAccessException {
		List<QnaVO> qnasList = sqlSession.selectList("mapper.board.selectAllQnasList");
		return qnasList;
	}
	
	@Override
	public List selectProdQnasList(String product_num) throws DataAccessException {
		List<QnaVO> prodQnasList = sqlSession.selectList("mapper.board.selectAllQnasList", product_num);
		return prodQnasList;
	}
	
	@Override
	public List selectProdReviewsList(String product_num) throws DataAccessException {
		List<ReviewVO> prodReviewsList = sqlSession.selectList("mapper.board.selectProdReviewsList", product_num);
		return prodReviewsList;
	}
	
	@Override
	public void insertQnaWritePage(QnaVO qnaVO) throws DataAccessException{
		sqlSession.insert("mapper.board.insertQnaWritePage", qnaVO);
	}
}
