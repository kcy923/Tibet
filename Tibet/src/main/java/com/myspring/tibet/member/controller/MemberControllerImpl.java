package com.myspring.tibet.member.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.tibet.common.base.BaseController;
import com.myspring.tibet.member.service.MemberService;
import com.myspring.tibet.member.vo.MemberVO;


@Controller("memberController")

public class MemberControllerImpl extends BaseController implements MemberController{
	@Autowired
	private MemberService memberService;
	@Autowired
	private MemberVO memberVO;
	
	
	@RequestMapping(value="/login.do" , method = RequestMethod.POST)
	public ModelAndView login(@RequestParam Map<String, String> loginMap, //loginMap이 아이디와 비번을 받음
	   HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		
		
		
		 memberVO = memberService.login(loginMap);
		 
		if(memberVO!= null && memberVO.getUser_id()!=null){ //아이디가 존재하는경우 여부 검사
			HttpSession session=request.getSession();
			session=request.getSession();
			session.setAttribute("isLogOn", true); //아이디가 존재하는경우 true인 경우 로그인해줌
			session.setAttribute("memberInfo",memberVO);
			
			String action=(String)session.getAttribute("action"); // 주문도중에 로그인시 주문창으로
			
			if(action!=null && action.equals("/order/order.do")){ // 오더 컨트롤러 만들고 수정해야됨
				mav.setViewName("forward:"+action);
			}else{
				mav.setViewName("redirect:/main.do");	
			}
			
			
			
		}else{
			String message="아이디 또는 비밀번호가 틀렸습니다. 다시 로그인해주세요";
			mav.addObject("message", message);
			mav.setViewName("/login");
		}
		return mav;
	}
	
	@Override
	@RequestMapping(value="/logout.do" ,method = RequestMethod.GET) // 로그아웃시 main.do 메인페이지로 돌림
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		HttpSession session=request.getSession();
		session.setAttribute("isLogOn", false);
		session.removeAttribute("memberInfo");
		mav.setViewName("redirect:/main.do"); 
		return mav;
	}
	
	@Override
	@RequestMapping(value="/signup.do" ,method = RequestMethod.POST)
	public ResponseEntity addMember(@ModelAttribute("memberVO") MemberVO _memberVO,
			                HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			memberService.addMember(_memberVO);
		    
			
			
		    message  = "<script>";
		    message +=" alert('회원가입이 완료되었어요');";
		    message += " location.href='"+request.getContextPath()+"/login.do';";
		    message += " </script>";
		    
		}catch(Exception e) {
			message  = "<script>";
		    message +=" alert('회원가입 해주세요);";
		    message += " location.href='"+request.getContextPath()+"/signupForm.do';";
		    message += " </script>";
			e.printStackTrace();
		}
		resEntity = new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}
	


	@Override
	@RequestMapping(value="/overlapped.do" ,method = RequestMethod.POST) // 아이디 중복검사
	public ResponseEntity overlapped(@RequestParam("id") String id,HttpServletRequest request, HttpServletResponse response) throws Exception{
		ResponseEntity resEntity = null;
		String result = memberService.overlapped(id);
		resEntity = new ResponseEntity(result, HttpStatus.OK);
		return resEntity;
		
		
		
	}
}
