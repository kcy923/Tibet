package com.myspring.tibet.order.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.tibet.cart.service.CartService;
import com.myspring.tibet.cart.vo.CartVO;
import com.myspring.tibet.member.service.MemberService;
import com.myspring.tibet.member.vo.MemberVO;
import com.myspring.tibet.order.service.OrderService;
import com.myspring.tibet.order.vo.OrderPageVO;
import com.myspring.tibet.order.vo.OrderVO;

@Controller("orderController")
public class OrderControllerImpl implements OrderController {
	@Autowired
	private CartService cartService;
	@Autowired
	private CartVO cartVO;
	@Autowired
	private OrderService orderService;
	@Autowired
	private OrderVO orderVO;
	@Autowired
	private MemberService memberService;
	@Autowired
	private MemberVO memberVO;
	
	
	/* 바로구매 */
	@Override
	@RequestMapping(value="/nowBuy{user_id}.do", method = RequestMethod.GET)
	public ModelAndView nowBuyList(@PathVariable("user_id") String user_id, ModelAndView mav) throws Exception {
		mav.setViewName("/nowBuy");
		mav.addObject("buyList", cartService.cartNowBuyList(user_id));
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

	@Override
	@RequestMapping(value="/order{user_id}.do", method = RequestMethod.GET)
	public ModelAndView order(@PathVariable("user_id") String user_id, @RequestParam(value="hiddenValue") Integer[] cart_num,
			HttpServletRequest request, ModelAndView mav) throws Exception {
		System.out.println("controller = " + cart_num);
		mav.setViewName("/order");
		mav.addObject("buyList", cartService.cartOrderList(cart_num));
		mav.addObject("orderNumList", orderService.selectOrderNum());
		return mav;
	}

	@Override
	@RequestMapping(value="/addOrderList.do", method = RequestMethod.POST)
	public ResponseEntity addOrderList(OrderVO orderVO, OrderPageVO orderPage,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		System.out.println("orders : " + orderPage.getOrders());
		System.out.println("orderVO : " + orderVO.toString());
		
		String update_user_id = request.getParameter("update_user_id");
		int update_point = Integer.parseInt(request.getParameter("update_point"));
		System.out.println("유저 : " + update_user_id);
		System.out.println("포인트 : " + update_point);
		
		Map<String, Object> update = new HashMap<String, Object>();
		update.put("user_id", update_user_id);
		update.put("user_point", update_point);
		
//		memberVO = memberService.login(loginMap);
//		HttpSession session = request.getSession();
//		session.setAttribute("memberInfo", memberVO);
		
		try {
			orderService.addOrderList(orderPage.getOrders());
			memberService.updatePoint(update);
				
			message  = "<script>";
			message += " location.href='" + request.getContextPath() + "/orderResult.do';";
			message += " </script>";
		}catch(Exception e) {
			message  = "<script>";
		    message += " alert('작업 중 오류가 발생했습니다. 다시 시도해 주세요.');";
		    message += " location.href='" +request.getContextPath() + "/cart" + cartVO.getUser_id() + ".do';";
		    message += " </script>";
			e.printStackTrace();
		}

		resEntity = new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}

	@Override
	@RequestMapping(value="/orderResult.do", method = RequestMethod.GET)
	public ModelAndView resultOrder(CartVO cartVO, ModelAndView mav) throws Exception {
		mav.setViewName("/orderResult");
		return mav;
	}
}
