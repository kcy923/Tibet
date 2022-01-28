package com.myspring.tibet.order.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
import com.myspring.tibet.board.vo.ReviewVO;
import com.myspring.tibet.order.service.OrderService;
import com.myspring.tibet.order.vo.OrderVO;

@Controller("orderController")
public class OrderControllerImpl implements OrderController {
	@Autowired
	private OrderService orderService;
	@Autowired
	private BoardService boardService;
	/*
	 * @Override
	 * 
	 * @RequestMapping(value="/orderList{user_id}.do",method = RequestMethod.GET)
	 * public ModelAndView selectOrderList(@PathVariable("user_id") String user_id,
	 * ModelAndView mav) throws Exception { mav.setViewName("/orderList");
	 * mav.addObject("list", orderService.selectOrderList(user_id)); return mav; }
	 */

	@Override
	@RequestMapping(value = "/cancelList{user_id}.do")
	public ModelAndView selectCancelList(@PathVariable("user_id") String user_id, HttpServletRequest request, ModelAndView mav) throws Exception {
		String dateFrom = request.getParameter("dateFrom");
		String dateTo = request.getParameter("dateTo");
		Calendar cal = Calendar.getInstance();
		if (dateFrom != null || dateTo != null) {
			dateFrom = dateFrom.trim();
			dateTo = dateTo.trim();

			
			 SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
			 
			HashMap<String, String> dateMap = new HashMap<String, String>();
			dateMap.put("dateFrom", dateFrom);
			dateMap.put("dateTo", dateTo);
			dateMap.put("user_id", user_id);
			mav.addObject("date", dateMap);
			
			Date date2 = transFormat.parse(dateTo);
			 cal.setTime(date2);
			 cal.add(Calendar.DATE, -1);
			 
			dateTo = transFormat.format(cal.getTime());
			
			request.setAttribute("dateFrom", dateFrom);
			request.setAttribute("dateTo", dateTo);
			
			Date date1 = transFormat.parse(dateTo);
			 cal.setTime(date1);
			 cal.add(Calendar.DATE, 2);
			 
			dateTo = transFormat.format(cal.getTime());
		}


		if (dateFrom == null && dateTo == null) {
			mav.addObject("list", orderService.selectCancelList(user_id));
		} else {
			HashMap<String, String> dateMap = new HashMap<String, String>();
			dateMap.put("dateFrom", dateFrom);
			dateMap.put("dateTo", dateTo);
			dateMap.put("user_id", user_id);
			mav.addObject("list", orderService.selectDateCancelList(dateMap));
		}
		mav.setViewName("/cancelList");
		return mav;
	}

	/*
	 * @Override
	 * 
	 * @RequestMapping(value="",RequestMethod.GET) public ModelAndView
	 * selectCancelList(ModelAndView mav, String dateFrom,String DateTo) throws
	 * Exception { mav.setViewName("/orderList"); mav.addObject("list",
	 * orderService.selectOrderList(user_id,dateFrom,DateTo)); return mav; }
	 */

	@Override
	@RequestMapping(value = "/orderList{user_id}.do")
	public ModelAndView selectOrderLists(@PathVariable("user_id") String user_id, HttpServletRequest request,
			ModelAndView mav) throws Exception {

		String dateFrom = request.getParameter("dateFrom");
		String dateTo = request.getParameter("dateTo");
		String order_num = request.getParameter("order_num");
		String product_num = request.getParameter("product_num");
		Calendar cal = Calendar.getInstance();
		if (dateFrom != null || dateTo != null) {
			dateFrom = dateFrom.trim();
			dateTo = dateTo.trim();

			
			 SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
			 

			HashMap<String, String> dateMap = new HashMap<String, String>();
			dateMap.put("dateFrom", dateFrom);
			dateMap.put("dateTo", dateTo);
			dateMap.put("user_id", user_id);
			mav.addObject("date", dateMap);
			
			Date date2 = transFormat.parse(dateTo);

			 cal.setTime(date2);
			 cal.add(Calendar.DATE, -1);
			 
			dateTo = transFormat.format(cal.getTime());
			
			request.setAttribute("dateFrom", dateFrom);
			request.setAttribute("dateTo", dateTo);
			
			Date date1 = transFormat.parse(dateTo);

			 cal.setTime(date1);
			 cal.add(Calendar.DATE, 2);
			 
			dateTo = transFormat.format(cal.getTime());
		}

		if (dateFrom == null && dateTo == null) {
			mav.addObject("list", orderService.selectOrderList(user_id));
		} else {
			HashMap<String, String> dateMap = new HashMap<String, String>();
			dateMap.put("dateFrom", dateFrom);
			dateMap.put("dateTo", dateTo);
			dateMap.put("user_id", user_id);
			mav.addObject("list", orderService.selectDateOrderList(dateMap));
		}
		
		HashMap<String, String> reviewMap = new HashMap<String, String>();
		reviewMap.put("order_num", order_num);
		reviewMap.put("product_num", product_num);
		
		mav.setViewName("/orderList");
		return mav;
	}
	
	@Override
	@RequestMapping(value = "/reviewWrt.do", method = RequestMethod.POST)
	public ResponseEntity insertReviewWrite(@ModelAttribute("reviewVO") ReviewVO reviewVO, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			orderService.insertReviewWrite(reviewVO);
			message = "<script>";
			message += " alert('리뷰 작성이 완료되었습니다. 메인 화면으로 돌아갑니다.');";
			message += " location.href='" + request.getContextPath() + "/main.do';";
			message += " </script>";

		} catch (Exception e) {
			message = "<script>";
			message += " alert('작업 중 오류가 발생했습니다. 다시 시도해 주세요.');";
			message += " location.href='" + request.getContextPath() + "/orderList{user_id}.do';";
			message += " </script>";
			e.printStackTrace();
		}
		resEntity = new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}
	
}
