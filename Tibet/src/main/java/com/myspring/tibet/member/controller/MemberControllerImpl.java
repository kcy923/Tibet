package com.myspring.tibet.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.myspring.tibet.common.base.BaseController;
import com.myspring.tibet.member.service.MemberService;
import com.myspring.tibet.member.vo.MemberVO;


@Controller("memberController")
public class MemberControllerImpl extends BaseController implements MemberController{
	@Autowired
	private MemberService memberService;
	
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
		    message +=" alert('회원 가입을 마쳤습니다. 로그인창으로 이동합니다.');";
		    message += " location.href='"+request.getContextPath()+"/login.do';";
		    message += " </script>";
		    
		}catch(Exception e) {
			message  = "<script>";
		    message +=" alert('작업 중 오류가 발생했습니다. 다시 시도해 주세요');";
		    message += " location.href='"+request.getContextPath()+"/signupForm.do';";
		    message += " </script>";
			e.printStackTrace();
		}
		resEntity = new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}
	
}
