package com.myspring.tibet.admin.board.service;

import java.util.List;
import java.util.Map;

import com.myspring.tibet.board.vo.NoticeVO;
import com.myspring.tibet.utils.Criteria;

public interface AdminBoardSerivce {
	// �������� �۾���
	public void insertNoticeWritePage(NoticeVO noticeVO) throws Exception;
	// �������� ��
	public NoticeVO adminnoticeDetail(Integer notice_num) throws Exception;
	// �������� ����
	public Integer noticeModify(Integer notice_num) throws Exception;
	// �������� ���û���
	public void noticedelete(String notice_num);
	// �������� ����
	 public int countNoticeListTotal(); 
	// �������� ����Ʈ
	public List<Map<String, Object>> selectNoticeList(Criteria cri);


	
}
