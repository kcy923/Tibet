package com.myspring.tibet.order.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
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
		mav.setViewName("/orderList");
		return mav;
	}
}
