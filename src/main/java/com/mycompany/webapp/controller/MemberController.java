package com.mycompany.webapp.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.webapp.dto.Member;
import com.mycompany.webapp.dto.SelfGuide;
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
		
		PasswordEncoder passwordEncoder = PasswordEncoderFactories.createDelegatingPasswordEncoder();
		String encodedPassword = passwordEncoder.encode(member.getMpassword());
		member.setMpassword(encodedPassword);
		
		member.setMenabled(true);
		member.setMrole("ROLE_USER");
		member.setMgender(0);
		boolean result = memberService.memberJoin(member);
		if(result) {
			return "member/join_success";
		}else {
			return "member/join_false";
		}
	}
	
	@GetMapping("/mypage")
	public String mypage(Model model, HttpSession session) {
		Member memail = (Member)session.getAttribute("member");
		Member member;
		member = memberService.getYourHomeSearch(memail.getMemail());
		logger.info(String.valueOf(member.getFollowCheking()));
		model.addAttribute("member", member);
		List<SelfGuide> list=memberService.getSelfGuideList(memail.getMemail());
		model.addAttribute("selfguide",list);

		return "member/mypage";
	}
	
	@GetMapping("/returnMypage")
	public String returnMypage(Model model, HttpSession session) {
		Member memail = (Member)session.getAttribute("member");
		Member member;
		member = memberService.getYourHomeSearch(memail.getMemail());
		logger.info(String.valueOf(member.getFollowCheking()));
		model.addAttribute("member", member);
		List<SelfGuide> list=memberService.getSelfGuideList(memail.getMemail());
		model.addAttribute("selfguide",list);

		return "member/returnmypage";
	}
	
	@GetMapping("/yourhomesearch")
	public String yourhomesearch(String pwriter, Model model, HttpSession session) {
		logger.info(pwriter);
		Member memail = (Member)session.getAttribute("member");
		Member member;
		if(memail != null) {
			member = memberService.getYourHomeSearch(pwriter, memail.getMemail());
		}else {
			member = memberService.getYourHomeSearch(pwriter);
		}
		
		member.setMemail(pwriter);
		
		logger.info(String.valueOf(member.getFollowCheking()));
		model.addAttribute("member", member);
		logger.info(member.getMnickname());
		logger.info(member.getMimage());
		logger.info(String.valueOf(member.getFollowerCount()));
		logger.info(String.valueOf(member.getFollowingCount()));
		
		return "member/myHome";
	}
}
