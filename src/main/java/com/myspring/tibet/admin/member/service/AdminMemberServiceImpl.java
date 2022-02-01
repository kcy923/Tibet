package com.myspring.tibet.admin.member.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myspring.tibet.admin.member.dao.AdminMemberDAO;
import com.myspring.tibet.utils.Criteria;

@Service("adminMemberService")
public class AdminMemberServiceImpl implements AdminMemberService {
	@Autowired
	AdminMemberDAO adminMemberDAO;

	// ȸ������ ����¡
	@Override
	public List<Map<String, Object>> selectAllmemberList(Criteria cri) {
		return adminMemberDAO.selectAllmemberList(cri);
	}
	
	// ȸ�� ���
	@Override
	public int countMemberList() {
		return adminMemberDAO.countMemberList();
	}
	
	// ȸ�� ����Ż��
	@Override
	public void memberDelete(String user_id) {
		adminMemberDAO.memberDelete(user_id);

	}

}
