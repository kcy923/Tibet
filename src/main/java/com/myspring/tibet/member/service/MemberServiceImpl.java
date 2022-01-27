package com.myspring.tibet.member.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myspring.tibet.member.dao.MemberDAO;
import com.myspring.tibet.member.vo.MemberVO;


@Service("memberService")
@Transactional(propagation=Propagation.REQUIRED)
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDAO memberDAO;
	
	@Override
	public MemberVO login(Map loginMap) throws Exception{
		return memberDAO.login(loginMap);
	}
	
	@Override
	public void addMember(MemberVO memberVO) throws Exception{
		memberDAO.insertNewMember(memberVO);
	}
	
	@Override
	public String overlapped(String id) throws Exception{
		return memberDAO.selectOverlappedID(id);
	}
	
	@Override
	public MemberVO findID(MemberVO memberVO) throws Exception {
		return memberDAO.findID(memberVO);
	}

	@Override
	public MemberVO findPW(MemberVO memberVO) throws Exception {
		return memberDAO.findPW(memberVO);
	}

	@Override
	public int updatePoint(HashMap<String, Object> map) throws Exception {
		return memberDAO.updatePoint(map);
	}
}
