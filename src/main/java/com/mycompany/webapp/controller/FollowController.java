package com.mycompany.webapp.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.webapp.dto.Follows;
import com.mycompany.webapp.dto.Member;
import com.mycompany.webapp.service.FollowService;

@Controller
@RequestMapping("/practice")
public class FollowController {
	private static final Logger logger = LoggerFactory.getLogger(FollowController.class);
		
	@Resource
	private FollowService followService;
	
	//followList 조회
	@GetMapping("/followList")
	public String followList(String memail,Model model) {
		System.out.println(memail);
		List<Follows> follows=followService.getFollowList(memail);
		model.addAttribute("follows",follows);
		return "practice/followList";
	}
	
	//followingList 조회
	@GetMapping("/followingList")
	public String followingList(String memail,Model model) {
		List<Follows> follows=followService.getFollowList(memail);
		model.addAttribute("follows",follows);
		return "practice/followingList";
	}
	
	@GetMapping("/checkFollow")
	public void checkFollow(String followingEmail, HttpSession session) {
		System.out.println(followingEmail);
		Member member=(Member)session.getAttribute("member");
		String follower=member.getMemail();
		System.out.println(follower);
		Follows follows = new Follows();
		follows.setFollowing(followingEmail);
		follows.setFollower(follower);
		int followsnum=followService.checkFollow(follows);
		logger.info("컨트롤러의 팔로우수 : "+followsnum);
	}
	
	@GetMapping("/photo-detail")
	public String aaa() {
		return "practice/photo-detail";
	}
	
	@GetMapping("/mypage")
	public String bbb(Member member) {
		logger.info(member.getMemail());
		return "practice/mypage";
	}
	
}
