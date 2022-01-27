package com.myspring.tibet.member.dao;

import java.util.HashMap;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.tibet.member.vo.MemberVO;


public interface MemberDAO {
	public MemberVO login(Map loginMap) throws DataAccessException;
	public void insertNewMember(MemberVO memberVO) throws DataAccessException;
	public String selectOverlappedID(String id) throws DataAccessException;
	public MemberVO findID(MemberVO memberVO) throws DataAccessException;
	public MemberVO findPW(MemberVO memberVO) throws DataAccessException;
	public int updatePoint(HashMap<String, Object> map) throws DataAccessException;
}
