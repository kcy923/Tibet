package com.myspring.tibet.member.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.tibet.member.vo.MemberVO;

public interface MemberService {
	public MemberVO login(Map loginMap) throws Exception;
	public void addMember(MemberVO memberVO) throws Exception;
	public String overlapped(String id) throws Exception;
	public MemberVO findID(MemberVO memberVO) throws Exception;
	public MemberVO findPW(MemberVO memberVO) throws Exception;
	public int updatePoint(Map<String, Object> update) throws Exception;
}
