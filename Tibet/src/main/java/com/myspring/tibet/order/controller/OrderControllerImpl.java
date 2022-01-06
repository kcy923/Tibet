package com.myspring.tibet.order.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.tibet.order.service.OrderService;
import com.myspring.tibet.order.vo.OrderVO;

@Controller("orderController")
public class OrderControllerImpl implements OrderController {
	@Autowired
	private OrderService orderService;

	@Override
	@RequestMapping(value="/cart{user_id}.do", method = RequestMethod.GET)
	public ModelAndView cartList(@PathVariable("user_id") String user_id, ModelAndView mav)
			throws Exception {
		mav.setViewName("/cart");
		mav.addObject("cartsList", orderService.cartList(user_id));
		return mav;
	}
	
	/* 장바구니 추가 */
	@Override
	@RequestMapping(value="/addCart.do", method = RequestMethod.POST)
	public ResponseEntity addCart(OrderVO orderVO, HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			int check = orderService.checkCart(orderVO);
			check = check == 0 ? 0 : check;
			
			if(check == 0) {
				orderService.addCart(orderVO);
				
				message  = "<script>";
			    message += " location.href='" +request.getContextPath() + "/cart" + orderVO.getUser_id() + ".do';";
			    message += " </script>";
			} else {
				message  = "<script>";
			    message +=" alert('이미 담긴 상품입니다.');";
			    message += " location.href='" +request.getContextPath() + "/productdetail" + orderVO.getProduct_num() + "';";
			    message += " </script>";
			}    
		}catch(Exception e) {
			message  = "<script>";
		    message +=" alert('작업 중 오류가 발생했습니다. 다시 시도해 주세요.');";
		    message += " location.href='" +request.getContextPath() + "/productdetail" + orderVO.getProduct_num() + "';";
		    message += " </script>";
			e.printStackTrace();
		}
		resEntity = new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}
//	@Override
//	@RequestMapping(value="/addCart.do", method = RequestMethod.POST)
//	public String addCart(OrderVO orderVO, Model model) throws Exception {
//		/*String product_num = orderVO.getProduct_num();
//		String product_color = orderVO.getProduct_color();
//		String product_size = orderVO.getProduct_size();
//		String user_id = orderVO.getUser_id();*/
//		
//		String msg = "이미 담긴 상품입니다.";
//		//int check = orderService.checkCart(product_num, product_color, product_size, user_id);
//		int check = orderService.checkCart(orderVO);
//		check = check == 0 ? 0 : check;
//		
//		if(check == 0) {
//			orderService.addCart(orderVO);
//		} else {
////			model.addAttribute("msg", "메시지");
////			model.addAttribute("url", "/cart.do");
//		}
//		
//		return "redirect:/cart" + orderVO.getUser_id() + ".do";	
//	}
	
	/* 장바구니 수량 수정 */
	@Override
	@RequestMapping(value="/updateCart.do", method = RequestMethod.POST)
	public String updateCart(OrderVO orderVO) throws Exception {
		orderService.modifyCount(orderVO);		
		return "redirect:/cart" + orderVO.getUser_id() + ".do";		
	}
	
	/* 장바구니 삭제 */
	@Override
	@RequestMapping(value="/deleteCart.do", method = RequestMethod.POST)
	public String deleteCart(OrderVO orderVO) throws Exception {
		orderService.deleteCart(orderVO);		
		return "redirect:/cart" + orderVO.getUser_id() + ".do";	
	}
}
