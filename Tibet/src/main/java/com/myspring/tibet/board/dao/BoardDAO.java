package com.myspring.tibet.board.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

public interface BoardDAO {
	public List selectAllNoticesList() throws DataAccessException;
	public List selectAllQnasList() throws DataAccessException;
}
