package com.myspring.tibet.admin.member.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.myspring.tibet.utils.Criteria;
@Service("adminMemberService")
public interface AdminMemberService {
	// ȸ�� ��
	
	// ȸ������ ����¡
	public List<Map<String, Object>> selectAllmemberList(Criteria cri);
	// ȸ�� ���
	public int countMemberList();
	// ȸ�� ����Ż��
	public void memberDelete(String user_id);
}
