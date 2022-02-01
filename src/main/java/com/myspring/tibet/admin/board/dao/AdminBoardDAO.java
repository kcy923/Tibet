package com.myspring.tibet.admin.board.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.tibet.board.vo.NoticeVO;
import com.myspring.tibet.utils.Criteria;

public interface AdminBoardDAO {

	// �������� �۾���
	public void insertNoticeWritePage(NoticeVO noticeVO) throws DataAccessException;
	// �������� ��
	public NoticeVO adminnoticeDetail(Integer notice_num);
	// �������� ����
	public Integer modifynotice(Integer notice_num);
	// �������� ����
    public void noticedelete(String notice_num); 
	// �������� ����¡
	public List<Map<String, Object>> selectNoticeList(Criteria cri);
	// �������� ���
	public int countNoticeList();
}
