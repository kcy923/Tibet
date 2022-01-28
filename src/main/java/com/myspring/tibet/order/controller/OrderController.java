package com.myspring.tibet.order.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.tibet.board.vo.ReviewVO;

public interface OrderController {

	/*
	 * public ModelAndView selectOrderList(@PathVariable("user_id") String user_id,
	 * ModelAndView mav) throws Exception;
	 */

	public ModelAndView selectCancelList(@PathVariable("user_id") String user_id, HttpServletRequest request, ModelAndView mav) throws Exception;
	
	public ModelAndView selectOrderLists(@PathVariable("user_id") String user_id, HttpServletRequest request, ModelAndView mav) throws Exception;

	public ResponseEntity insertReviewWrite(ReviewVO reviewVO, HttpServletRequest request, HttpServletResponse response)
			throws Exception;

}
