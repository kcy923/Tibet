package com.myspring.tibet.member.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.tibet.member.vo.MemberVO;

@Repository("memberDAO")
public class MemberDAOImpl implements MemberDAO {
	@Autowired
	private SqlSession sqlSession;	
	
	@Override
	public void insertNewMember(MemberVO memberVO) throws DataAccessException{
		sqlSession.insert("mapper.member.insertNewMember", memberVO);
	}
}
