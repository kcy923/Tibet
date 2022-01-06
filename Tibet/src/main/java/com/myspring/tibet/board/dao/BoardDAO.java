package com.myspring.tibet.board.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.myspring.tibet.board.vo.QnaVO;

public interface BoardDAO {
	public List selectAllNoticesList() throws DataAccessException;
	public List selectAllQnasList() throws DataAccessException;
	public List selectProdQnasList(String product_num) throws DataAccessException;
	public List selectProdReviewsList(String product_num) throws DataAccessException;
	public void insertQnaWritePage(QnaVO qnaVO) throws DataAccessException;
}
