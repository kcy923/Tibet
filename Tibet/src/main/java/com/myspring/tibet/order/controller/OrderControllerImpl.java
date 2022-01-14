package com.myspring.tibet.order.controller;

import java.util.Map;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.tibet.cart.service.CartService;
import com.myspring.tibet.cart.vo.CartVO;
import com.myspring.tibet.order.service.OrderService;
import com.myspring.tibet.order.vo.OrderVO;

@Controller("orderController")
public class OrderControllerImpl implements OrderController {
	@Autowired
	private CartService cartService;
	
//	@Override
//	@RequestMapping(value="/order{product_num}.do", method = RequestMethod.GET)
//	public ModelAndView nowBuyList(@RequestParam Map<String, String> nowBuyMap, ModelAndView mav) throws Exception {
//		mav.setViewName("/nowBuy");
//		mav.addObject("nowBuyList", cartService.cartNowBuyList(nowBuyMap));
//		return mav;
//	}
	
	/* 바로구매 */
	@Override
	@RequestMapping(value="/nowBuy{user_id}.do", method = RequestMethod.GET)
	public ModelAndView nowBuyList(@PathVariable("user_id") String user_id, ModelAndView mav) throws Exception {
//		user_id = cartVO.getUser_id();
		mav.setViewName("/nowBuy");
		mav.addObject("nowBuyList", cartService.cartNowBuyList(user_id));
		return mav;
	}
	
	@Override
	@RequestMapping(value="/nowBuy.do", method = RequestMethod.POST)
	public ResponseEntity nowBuy(CartVO cartVO, HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			int check = cartService.checkCart(cartVO);
			check = check == 0 ? 0 : check;
			
			if(check == 0) {
				cartService.addCart(cartVO);
				
				message  = "<script>";
			    message += " location.href='" +request.getContextPath() + "/nowBuy" + cartVO.getUser_id() + ".do';";
			    message += " </script>";
			} else {
				message  = "<script>";
			    message += " var result=confirm('동일상품이 장바구니에 있습니다. 장바구니로 이동하시겠습니까?');";
			    message += " if(result == true){";
			    message += " location.href='" +request.getContextPath() + "/cart" + cartVO.getUser_id() + ".do';";
			    message += " } else{";
			    message += " location.href='" +request.getContextPath() + "/productDetail" + cartVO.getProduct_num() + ".do';";
			    message += " }";
			    message += " </script>";
			}    
		}catch(Exception e) {
			message  = "<script>";
		    message += " alert('작업 중 오류가 발생했습니다. 다시 시도해 주세요.');";
		    message += " location.href='" +request.getContextPath() + "/productDetail" + cartVO.getProduct_num() + ".do';";
		    message += " </script>";
			e.printStackTrace();
		}
		resEntity = new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}
	
}
