package com.myspring.tibet.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myspring.tibet.board.service.BoardService;
import com.myspring.tibet.board.dao.BoardDAO;
import com.myspring.tibet.board.vo.NoticeVO;
import com.myspring.tibet.board.vo.QnaVO;
import com.myspring.tibet.product.vo.ProductVO;

@Service("boardService")
@Transactional(propagation = Propagation.REQUIRED)
public class BoardServiceImpl implements BoardService {
	@Autowired
	BoardDAO boardDAO;
	
	@Override
	public List<NoticeVO> listNotices() throws Exception{
		List<NoticeVO> noticesList = boardDAO.selectAllNoticesList();
		return noticesList;
	}
	
	@Override
	public List<QnaVO> listQnas() throws Exception{
		List<QnaVO> qnasList = boardDAO.selectAllQnasList();
		return qnasList;
	}
	
	@Override
	public List<QnaVO> listProdQnas(String product_num) throws Exception{
		List<QnaVO> prodQnasList = boardDAO.selectProdQnasList(product_num);
		return prodQnasList;
	}
}
