package com.mycompany.webapp.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/member")
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	@GetMapping("/login")
	public String loginForm() {
		return "login";
	}
	
	@PostMapping("/login")
	public String login(HttpSession session) {
		logger.info("실행");
		session.setAttribute("user", "userid");
		return "redirect:/";
	}
	
	@GetMapping("/join")
	public String joinForm() {
		return "join";
	}
}
