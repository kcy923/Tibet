package com.myspring.tibet.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

public interface BoardController {
	public ModelAndView listNotices(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView listQnas(HttpServletRequest request, HttpServletResponse response) throws Exception;
}
