package com.myspring.tibet.admin.member.dao;

import java.util.List;
import java.util.Map;

import com.myspring.tibet.utils.Criteria;

public interface AdminMemberDAO {
	// ȸ�� ��
		
	// ȸ������ ����¡
	public List<Map<String, Object>> selectAllmemberList(Criteria cri);
	// ȸ�� ���
	public int countMemberList();
	// ȸ�� ����Ż��
	public void memberDelete(String user_id);
}
