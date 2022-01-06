package com.myspring.tibet.order.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.tibet.order.vo.OrderVO;

public interface OrderController {
	public ModelAndView cartList(@PathVariable("user_id") String user_id, ModelAndView mav) throws Exception;
	public ResponseEntity addCart(OrderVO orderVO, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public String updateCart(OrderVO orderVO) throws Exception;
	public String deleteCart(OrderVO orderVO) throws Exception;
}
