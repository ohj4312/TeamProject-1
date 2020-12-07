package com.mycompany.webapp.controller;

import java.io.File;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.mycompany.webapp.dto.Member;
import com.mycompany.webapp.dto.SelfGuide;
import com.mycompany.webapp.service.FollowService;
import com.mycompany.webapp.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Resource
	private MemberService memberService;
	
	@Resource
	private FollowService followService;
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@RequestMapping("/login")
	public String loginForm(HttpServletRequest request) {
		return "member/login";
	}
	
	@GetMapping("/join")
	public String joinForm() {
		
		return "member/join";
	}
	
	@PostMapping("/join")
	public String join(Member member) {
		
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
		logger.info(String.valueOf(list.size()));
		
		if(list.size() != 0) {
			model.addAttribute("selfguide",list);
		}
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
		
		if(list.size() != 0) {
			model.addAttribute("selfguide",list);
		}

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
	
	@GetMapping("/memberUpdate")
	public String memberUpdate() {
		logger.info("실행");
		return "member/mypageUpdate";
	}
	
	@PostMapping("/updateImage")
	public String updateImage(MultipartFile aimageAttach, HttpSession session) {
		logger.info(aimageAttach.getOriginalFilename());

		Member member = (Member) session.getAttribute("member");
		
		//파일 이름 중복 방지를 위한 밀리세컨드 단위의 시간초를 파일 이름 앞에 붙여줌.
		String saveFilename = new Date().getTime()+"_"+aimageAttach.getOriginalFilename();
		member.setMimage(saveFilename);

		logger.info(saveFilename);
		try {
			//실제 사용자의 요청에 파일을 서버에 저장
			aimageAttach.transferTo(new File("D:/MyWorkSpace/photo/member/"+saveFilename));
		} catch (Exception e) {} 
		
		memberService.updateMimage(member);
		return "redirect:/member/mypage";
	}
	
	@GetMapping("/updatePassword")
	public String updatePasswordForm() {
		return "member/updatePassword";
	}
	
	@PostMapping("/updatePassword")
	public String updatePassword(String mpassword, String mpassword1, HttpSession session, HttpServletRequest request, HttpServletResponse response, Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		Member member = (Member) session.getAttribute("member");
		
		member.setMpassword(mpassword);
		logger.info(mpassword);
		logger.info(mpassword1);
		
		if(memberService.updatePassword(member, mpassword1)) {
			session.invalidate();
			new SecurityContextLogoutHandler().logout(request, response, auth);
			return "member/login";
		}else {
			model.addAttribute("fail", "fail");
			return "member/updatePassword";
		}
	}
	
	@GetMapping("/deleteMember")
	public String deleteMemberForm() {
		return "member/deleteMember";
	}
	
	@PostMapping("/deleteMember")
	public String deleteMember(HttpSession session) {
		Member member = (Member) session.getAttribute("member");
		memberService.delteMember(member);
		return "home";
	}
}
