package com.myspring.tibet.member.dao;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.tibet.member.vo.MemberVO;

@Repository("memberDAO")
public class MemberDAOImpl implements MemberDAO{
	@Autowired
	private SqlSession sqlSession;	
	
	@Override
	public MemberVO login(Map loginMap) throws DataAccessException{
		MemberVO member = (MemberVO)sqlSession.selectOne("mapper.member.login", loginMap);
	    return member;
	}
	
	@Override
	public void insertNewMember(MemberVO memberVO) throws DataAccessException{
		sqlSession.insert("mapper.member.insertNewMember", memberVO);
	}

	@Override
	public String selectOverlappedID(String id) throws DataAccessException {
		String result = sqlSession.selectOne("mapper.member.selectOverlappedID", id);
		return result;
	}

	@Override
	public MemberVO findID(MemberVO memberVO) throws DataAccessException {
		MemberVO member = sqlSession.selectOne("mapper.member.findID", memberVO);
		return member;
	}

	@Override
	public MemberVO findPW(MemberVO memberVO) throws DataAccessException {
		MemberVO member = sqlSession.selectOne("mapper.member.findPW", memberVO);
		return member;
	}

	@Override
	public int updatePoint(Map<String, Object> map) throws DataAccessException {
		return sqlSession.update("mapper.member.updatePoint", map);
	}
}
