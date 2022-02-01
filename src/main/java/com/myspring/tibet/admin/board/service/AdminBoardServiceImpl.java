package com.myspring.tibet.admin.board.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myspring.tibet.admin.board.dao.AdminBoardDAO;
import com.myspring.tibet.board.vo.NoticeVO;
import com.myspring.tibet.utils.Criteria;
@Service("adminBoardService")
	@Transactional(propagation = Propagation.REQUIRED)
public class AdminBoardServiceImpl implements AdminBoardSerivce {
	@Autowired
	AdminBoardDAO adminBoardDAO;
	// �������� �۾���
	public void insertNoticeWritePage(NoticeVO noticeVO) throws Exception{
	  adminBoardDAO.insertNoticeWritePage(noticeVO);
	}
	// �������� ��
	@Override
	public NoticeVO adminnoticeDetail(Integer notice_num) throws Exception {
		return adminBoardDAO.adminnoticeDetail(notice_num);
	}
	// �������� ����
	@Override
	public Integer noticeModify(Integer notice_num) throws Exception {
		return adminBoardDAO.modifynotice(notice_num);
	}
	// �������� ���û���
	@Override
	public void noticedelete(String notice_num) {
		 adminBoardDAO.noticedelete(notice_num);
	}
	// �������� ����¡
	@Override
	public List<Map<String, Object>> selectNoticeList(Criteria cri) {
	    return adminBoardDAO.selectNoticeList(cri);
	}
	// �������� ���
	@Override
	public int countNoticeListTotal() {
	    return adminBoardDAO.countNoticeList();
	}
	
}
