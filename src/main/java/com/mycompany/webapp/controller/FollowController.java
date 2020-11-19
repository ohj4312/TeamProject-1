package com.mycompany.webapp.controller;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.mycompany.webapp.dto.Follows;
import com.mycompany.webapp.service.FollowService;

@Controller
public class FollowController {
	private static final Logger logger = LoggerFactory.getLogger(FollowController.class);
		
	@Resource
	private FollowService followService;
	
	//followList 조회
	@GetMapping("/followList")
	public String followList(String memail,Model model) {
		List<Follows> follows=followService.getFollowList(memail);
		model.addAttribute("follows",follows);
		return "followList.jsp";
	}
	
	//followingList 조회
	@GetMapping("/followingList")
	public String followingList(String memail,Model model) {
		List<Follows> follows=followService.getFollowList(memail);
		model.addAttribute("follows",follows);
		return "followingList.jsp";
	}
	
	@GetMapping("/checkFollow")
	public void checkFollow(Follows follows) {
		int followsnum=followService.checkFollow(follows);
		logger.info("followsnum : "+followsnum);
	}
	
}
