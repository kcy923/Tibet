package com.myspring.tibet.board.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.tibet.board.service.BoardService;
import com.myspring.tibet.board.vo.NoticeVO;
import com.myspring.tibet.board.vo.QnaVO;
import com.myspring.tibet.product.service.ProductService;

@Controller("boardController")
public class BoardControllerImpl implements BoardController {
	private static final Logger logger = LoggerFactory.getLogger(BoardControllerImpl.class);
	private static final String ARTICLE_IMAGE_REPO = "C:\\tibet_board\\board_image";
	@Autowired
	private BoardService boardService;
	@Autowired
	private NoticeVO noticeVO;	
	@Autowired
	private ProductService productService;
	
	@Override
	@RequestMapping(value = "/notice.do", method = {RequestMethod.GET, RequestMethod.POST})  
	public ModelAndView listNotices(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String)request.getAttribute("viewName");
		List noticesList = boardService.listNotices();
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("noticesList", noticesList);
		return mav;
	}
	
	@Override
	@RequestMapping(value = "/qna.do", method = {RequestMethod.GET, RequestMethod.POST}) 
	public ModelAndView listQnas(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String)request.getAttribute("viewName");
		List qnasList = boardService.listQnas();
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("qnasList", qnasList);
		return mav;
	}
	
	@Override
	@RequestMapping(value = "/qnaWrt.do", method = RequestMethod.POST)
	public ResponseEntity insertQnaWritePage(@ModelAttribute("qnaVO") QnaVO _qnaVO, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			boardService.insertQnaWritePage(_qnaVO);
			message = "<script>";
			message += " alert('���� ��ϵǾ����ϴ�.');";
			message += " location.href='" + request.getContextPath() + "/qna.do';";
			message += " </script>";

		} catch (Exception e) {
			message = "<script>";
			message += " alert('�۾� �� ������ �߻��߽��ϴ�. �ٽ� �õ��� �ּ���.');";
			message += " location.href='" + request.getContextPath() + "/qnaWrite.do';";
			message += " </script>";
			e.printStackTrace();
		}
		resEntity = new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}

	@RequestMapping(value = "/prodQnaWrite{product_num}.do", method = RequestMethod.GET)
	public ModelAndView prodQnaWrite(@PathVariable("product_num") String product_num, ModelAndView mav)
			throws Exception {
		mav.setViewName("/prodQnaWrite");
		mav.addObject("vo", productService.productDetail(product_num));
		return mav;
	}

	@RequestMapping(value = "/qnaWrite.do", method = RequestMethod.GET)
	public ModelAndView qnaWrite(ModelAndView mav) throws Exception {
		mav.setViewName("/qnaWrite");
		return mav;
	}
}
