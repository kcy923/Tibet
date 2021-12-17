package com.myspring.tibet.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.myspring.tibet.member.vo.MemberVO;

public interface MemberController {
	public ResponseEntity  addMember(@ModelAttribute("member") MemberVO member,
            HttpServletRequest request, HttpServletResponse response) throws Exception;
}
