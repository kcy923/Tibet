package com.myspring.tibet.order.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.tibet.cart.vo.CartVO;
import com.myspring.tibet.order.vo.OrderVO;

public interface OrderController {
//	public ModelAndView nowBuyList(@RequestParam Map<String, String> nowBuyMap, ModelAndView mav) throws Exception;
	public ModelAndView nowBuyList(@PathVariable("user_id") String user_id, ModelAndView mav) throws Exception;
	public ResponseEntity nowBuy(CartVO cartVO, HttpServletRequest request, HttpServletResponse response) throws Exception;
}
