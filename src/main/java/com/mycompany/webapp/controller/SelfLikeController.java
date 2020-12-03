package com.mycompany.webapp.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.webapp.dto.Member;
import com.mycompany.webapp.dto.Post_like;
import com.mycompany.webapp.dto.SelfGuide;
import com.mycompany.webapp.service.SelfLikeService;

@Controller
@RequestMapping("/selflike")
public class SelfLikeController {
	private Logger logger = LoggerFactory.getLogger(LikeController.class);
	@Resource
	private SelfLikeService service;

	@GetMapping("/selfgetLikePhotolist")
	public String selfgetLikePhoto(Model model, HttpSession session) {

		Member member = (Member) session.getAttribute("member");
		String memail = member.getMemail();
		List<SelfGuide> likelist = service.selfgetLikePhotoList(memail);

		model.addAttribute("likelist", likelist);

		return "guide/selfgetLikePhotolist";
	}

	
	@GetMapping("/selflikePush")
	public void likePush(int snumber,HttpSession session, HttpServletResponse response) throws Exception {

		Member member = (Member) session.getAttribute("member");
		String memail = member.getMemail();
		
		Post_like post_like = new Post_like();
		post_like.setMemail(memail);
		post_like.setSnumber(snumber);

		service.selflikepush(post_like);

		JSONObject jsonObject = new JSONObject();
		jsonObject.put("result", "success");
		String json = jsonObject.toString();
		// 응답보내기
		PrintWriter out = response.getWriter();
		response.setContentType("application/json;charset=utf-8");
		out.println(json);
		out.flush();
		out.close();

	}
	@GetMapping("/selflikePushCancel")
	public void likePushCancel(int snumber,Model model, HttpSession session, HttpServletResponse response) throws Exception {
		
		Member member = (Member) session.getAttribute("member");
		String memail = member.getMemail();
		
		Post_like post_like = new Post_like();
		post_like.setMemail(memail);
		post_like.setSnumber(snumber);

		service.selflikepushCancel(post_like);
		
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("result", "success");
		String json = jsonObject.toString();
		// 응답보내기
		PrintWriter out = response.getWriter();
		response.setContentType("application/json;charset=utf-8");
		out.println(json);
		out.flush();
		out.close();
	}
	@GetMapping("/selflikePushCheck")
	public void likePushCheck(int snumber,Model model, HttpSession session, HttpServletResponse response) throws Exception {

		 
		Member member = (Member) session.getAttribute("member");
		String memail = member.getMemail();
		
		Post_like post_like = new Post_like();
		post_like.setMemail(memail);
		post_like.setSnumber(snumber);

		JSONObject jsonObject = new JSONObject();

		int check = service.selflikepushCheck(post_like);
		if (check == 0) {
			service.selflikepush(post_like);
			jsonObject.put("result", "likesuccess");
			
		} else {
			service.selflikepushCancel(post_like);
			jsonObject.put("result", "likefailure");
		

		}
		
		String json = jsonObject.toString();
		// 응답보내기
		PrintWriter out = response.getWriter();
		response.setContentType("application/json;charset=utf-8");
		out.println(json);
		out.flush();
		out.close();
	}

	
}
