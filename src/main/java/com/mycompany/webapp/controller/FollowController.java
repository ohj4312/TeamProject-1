package com.mycompany.webapp.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.webapp.dto.Follows;
import com.mycompany.webapp.dto.Member;
import com.mycompany.webapp.service.FollowService;

@Controller
@RequestMapping("/follow")
public class FollowController {
	private static final Logger logger = LoggerFactory.getLogger(FollowController.class);
		
	@Resource
	private FollowService followService;
	
	
	
	//followList 조회
	@GetMapping("/followList")
	public String followList(Model model,HttpSession session) {
		Member member=(Member)session.getAttribute("member");
		String memail=member.getMemail();
		List<Follows> follows=followService.getFollowList(memail);
		model.addAttribute("follows",follows);
		return "member/followList";
	}
	

	//followingList 조회
	@GetMapping("/followingList")
	public String followingList(Model model,HttpSession session) {
		Member member=(Member)session.getAttribute("member");
		String memail=member.getMemail();
		List<Follows> follows=followService.getFollowingList(memail);
		model.addAttribute("follows",follows);
		return "member/followingList";
	}
	
	@GetMapping("/checkFollow")
	public void checkFollow(String pwriter, HttpSession session,HttpServletResponse response) throws IOException {

		Member member=(Member)session.getAttribute("member");
		String follower=member.getMemail();
		Follows follows = new Follows();
		if(pwriter.contentEquals(follower)) {
			follows.setFollowing(follower);
			follows.setFollower(pwriter);
		}else {
			follows.setFollowing(pwriter);
			follows.setFollower(follower);
		}
		int followsnum=followService.checkFollow(follows);
		logger.info("컨트롤러의 팔로우수 : "+followsnum);
		if(followsnum==1) {
			PrintWriter out = response.getWriter();
			response.setContentType("text/html;charset=utf-8");
			out.println(followsnum);
			out.flush();
			out.close();
		}

	}
	
	@GetMapping("/cancelFollow")
	public void cancelFollow(String pwriter,Model model,HttpSession session,HttpServletResponse response) throws IOException {
		Member member=(Member)session.getAttribute("member");
		String memail=member.getMemail();
		Follows follows=new Follows();
		follows.setFollower(memail);
		follows.setFollowing(pwriter);
		int row=followService.cancelfollow(follows);
		if(row==1) {
			PrintWriter out = response.getWriter();
			response.setContentType("text/html;charset=utf-8");
			out.println(row);
			out.flush();
			out.close();
		}
		
	}
	
	@GetMapping("/followCheck")
	public void followCheck(String pwriter,HttpSession session,HttpServletResponse response) throws IOException {
		logger.info(pwriter);
		
		Member member=(Member)session.getAttribute("member");
		
		Follows follow=new Follows();
		follow.setFollowing(pwriter);
		follow.setFollower(member.getMemail());
		int result=followService.followCheck(follow);
		
		JSONObject jsonObject = new JSONObject(); 
		if(result == 0) {
			jsonObject.put("result", "fail");
			followService.checkFollow(follow);
			
		
		}else {
			jsonObject.put("result", "success");
			followService.cancelfollow(follow);
		}
		
		String json = jsonObject.toString();
		// 응답 보내기
		PrintWriter out = response.getWriter();
		response.setContentType("application/json;charset=utf-8");
		out.println(json);
		out.flush();
		out.close();
			
	}
	
	@GetMapping("/followingmypage")
	public String redirectFollowingMypage(String memail,HttpSession session,HttpServletRequest request) {
		logger.info(""+memail);
		session.setAttribute("followingmemail", memail);
		return "redirect:/follow/member/followingmypage";
	}
	
	@GetMapping("/followmypage")
	public String redirectFollowMypage(String memail,HttpSession session,HttpServletRequest request) {
		logger.info(""+memail);
		session.setAttribute("followmemail", memail);
		return "redirect:/follow/member/followmypage";
	}
	
	
	
	
	@RequestMapping("/member/followingmypage")
	public String moveFollowfollowingPage(HttpSession session,Model model) {
		String memail=(String)session.getAttribute("followingmemail");
		logger.info(memail);
		Member followingmember=new Member();
		followingmember=followService.getFollowingInfo(memail);
		model.addAttribute("followingmember", followingmember);
		return "member/followingmypage";
	}
	
	@RequestMapping("/member/followmypage")
	public String moveFollowfollowPage(HttpSession session,Model model) {
		String memail=(String)session.getAttribute("followmemail");
		logger.info(memail);
		Member followmember=new Member();
		followmember=followService.getFollowInfo(memail);
		model.addAttribute("followmember", followmember);
		return "member/followmypage";
	}
}
