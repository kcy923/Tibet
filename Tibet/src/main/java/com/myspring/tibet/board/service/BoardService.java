package com.myspring.tibet.board.service;

import java.util.List;

import com.myspring.tibet.board.vo.NoticeVO;
import com.myspring.tibet.board.vo.QnaVO;

public interface BoardService {
	public List<NoticeVO> listNotices() throws Exception;
	public List<QnaVO> listQnas() throws Exception;
	//public QnaVO listProdQnas(String product_num) throws Exception;
	public List<QnaVO> listProdQnas(String product_num) throws Exception;
}
