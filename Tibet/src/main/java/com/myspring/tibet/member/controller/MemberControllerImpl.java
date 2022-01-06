package com.myspring.tibet.member.controller;

import java.util.List;
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
	
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public ModelAndView login(@RequestParam Map<String, String> loginMap, // loginMap이 아이디와 비번을 받음
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		memberVO = memberService.login(loginMap);
		HttpSession session = request.getSession();
		session = request.getSession();
		session.setAttribute("isLogOn", false);

		if (memberVO != null && memberVO.getUser_id() != null) { // 아이디가 존재하는경우 여부 검사			
			session.setAttribute("isLogOn", true); // 아이디가 존재하는경우 true인 경우 로그인해줌
			session.setAttribute("memberInfo", memberVO);
			
			mav.setViewName("redirect:/main.do");

			/*String action = (String) session.getAttribute("action"); // 주문도중에 로그인시 주문창으로

			if (action != null && action.equals("/order.do")) { // 오더 컨트롤러 만들고 수정해야됨
				mav.setViewName("forward:" + action);
			} else {
				mav.setViewName("redirect:/main.do");
			}*/

		} else {
			String message = "아이디 또는 비밀번호가 틀렸습니다. 다시 로그인 해주세요.";
			mav.addObject("message", message);
			mav.setViewName("/login");
		}
		return mav;
	}

	@Override
	@RequestMapping(value = "/logout.do", method = RequestMethod.GET) // 로그아웃시 main.do 메인페이지로 돌림
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		session.setAttribute("isLogOn", false);
		session.removeAttribute("memberInfo");
		mav.setViewName("redirect:/main.do");
		return mav;
	}
	
	@Override
	@RequestMapping(value="/signup.do", method = RequestMethod.POST)
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
		    message +=" alert('작업 중 오류가 발생했습니다. 다시 시도해 주세요.');";
		    message += " location.href='"+request.getContextPath()+"/signupForm.do';";
		    message += " </script>";
			e.printStackTrace();
		}
		resEntity = new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}
	
	@Override
	@RequestMapping(value="/overlapped.do", method = RequestMethod.POST) 
	public ResponseEntity overlapped(@RequestParam("id") String id,HttpServletRequest request, HttpServletResponse response) throws Exception{
		ResponseEntity resEntity = null;
		String result = memberService.overlapped(id);
		resEntity = new ResponseEntity(result, HttpStatus.OK);
		return resEntity;
	}

	@RequestMapping(value="/findID.do")
	public String findIDView() {
		return "/findID";
	}
	
	@Override
	@RequestMapping(value="/resultID.do", method = RequestMethod.POST) 
	public String findID(MemberVO memberVO, Model model) throws Exception {
		MemberVO member = memberService.findID(memberVO);
		
		if(member == null) { 
			model.addAttribute("check", 1);
		} else { 
			model.addAttribute("check", 0);
			model.addAttribute("user_id", member.getUser_id());
		}
		
		return "/resultID";
	}
	
	@RequestMapping(value="/findPW.do")
	public String findPWView() {
		return "/findPW";
	}

	@Override
	@RequestMapping(value="/resultPW.do", method = RequestMethod.POST) 
	public String findPW(MemberVO memberVO, Model model) throws Exception {
		MemberVO member = memberService.findPW(memberVO);

		if (member == null) {
			model.addAttribute("check", 1);
		} else {
			model.addAttribute("check", 0);
			model.addAttribute("user_pw", member.getUser_pw());
		}

		return "/resultPW";
	}
}
