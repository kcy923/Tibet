package com.myspring.tibet.board.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.tibet.board.controller.BoardController;
import com.myspring.tibet.board.service.BoardService;
import com.myspring.tibet.board.vo.NoticeVO;

@Controller("boardController")
public class BoardControllerImpl implements BoardController {
	private static final String ARTICLE_IMAGE_REPO = "C:\\tibet_board\\board_image";
	@Autowired
	private BoardService boardService;
	@Autowired
	private NoticeVO noticeVO;
	
	@Override
	@RequestMapping(value = "/notice.do", method = {RequestMethod.GET, RequestMethod.POST})    // 공지사항 내용 페이지 만들어야됨
	public ModelAndView listNotices(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String)request.getAttribute("viewName");
		List noticesList = boardService.listNotices();
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("noticesList", noticesList);
		return mav;
	}
	
	@Override
	@RequestMapping(value = "/qna.do", method = {RequestMethod.GET, RequestMethod.POST})    // 공지사항 내용 페이지 만들어야됨
	public ModelAndView listQnas(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String)request.getAttribute("viewName");
		List qnasList = boardService.listQnas();
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("qnasList", qnasList);
		return mav;
	}
}
