package com.mycompany.webapp.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.webapp.dto.Member;
import com.mycompany.webapp.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Resource
	MemberService memberService;
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	@RequestMapping("/login")
	public String loginForm(HttpServletRequest request) {
		logger.info(request.getParameter("failed"));
		return "member/login";
	}
	
	@GetMapping("/join")
	public String joinForm() {
		
		return "member/join";
	}
	
	@PostMapping("/join")
	public String join(Member member) {
		logger.info("실행");
		member.setMgender(0);
		boolean result = memberService.memberJoin(member);
		if(result) {
			return "member/login_success";
		}else {
			return "member/login_false";
		}
	}
	
	@GetMapping("/mypage")
	public String mypage() {
		return "member/mypage";
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
}
