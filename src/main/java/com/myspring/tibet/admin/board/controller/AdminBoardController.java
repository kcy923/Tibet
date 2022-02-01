package com.myspring.tibet.admin.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.tibet.board.vo.NoticeVO;
import com.myspring.tibet.utils.Criteria;

public interface AdminBoardController {

	// �������� �۾���
	public ResponseEntity insertNoticeWritePage(@ModelAttribute("noticeVO") NoticeVO _noticeVO, HttpServletRequest request, HttpServletResponse response)
			throws Exception;
	// �������� �۾��� ������
	ModelAndView noticeWrite(ModelAndView mav) throws Exception;
	// �������� ��
	public ModelAndView adminnoticeDetail(@PathVariable("notice_num") Integer notice_num, ModelAndView mav) throws Exception;
	// �������� ���
	public ModelAndView openNoticeList(Criteria cri, HttpServletRequest request) throws Exception;
	// �������� ����
	String noticedelete(String notice_num) throws Exception;
	// �������� ���û���
	String alldelete(HttpServletRequest request) throws Exception;
	// �������� ����
	public ResponseEntity modifynotice(NoticeVO _noticeVO, HttpServletRequest request, HttpServletResponse response) throws Exception;
	// �������� ���� ������
	public ModelAndView noticeModifyForm(Integer qna_num, ModelAndView mav) throws Exception;

	

	
	
	
	
	

	

	

}

