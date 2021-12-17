package com.myspring.tibet.member.dao;

import org.springframework.dao.DataAccessException;

import com.myspring.tibet.member.vo.MemberVO;

public interface MemberDAO {
	public void insertNewMember(MemberVO memberVO) throws DataAccessException;
}
