package com.mycompany.webapp.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.List;
import java.util.Set;

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

import com.mycompany.webapp.dto.Member;
import com.mycompany.webapp.dto.Post_like;
import com.mycompany.webapp.service.LikeService;

@Controller
@RequestMapping("/like")
public class LikeController {
	private Logger logger = LoggerFactory.getLogger(LikeController.class);
	@Resource
	private LikeService service;

	@GetMapping("/getLikePhotolist")
	public String getLikePhoto(Model model, HttpSession session) {

		Member member = (Member) session.getAttribute("member");
		String memail = member.getMemail();
		List<Post_like> likelist = service.getLikePhotoList(memail);

		model.addAttribute("likelist", likelist);

		return "like/getLikePhotolist";
	}

	
	@GetMapping("/likePush")
	public void likePush(int pnumber,HttpSession session, HttpServletResponse response) throws Exception {

		Member member = (Member) session.getAttribute("member");
		String memail = member.getMemail();
		
		Post_like post_like = new Post_like();
		post_like.setMemail(memail);
		post_like.setPnumber(pnumber);

		service.likepushphoto(post_like);

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
	@GetMapping("/likePushCancel")
	public void likePushCancel(int pnumber,Model model, HttpSession session, HttpServletResponse response) throws Exception {
		
		Member member = (Member) session.getAttribute("member");
		String memail = member.getMemail();
		
		Post_like post_like = new Post_like();
		post_like.setMemail(memail);
		post_like.setPnumber(pnumber);

		service.likepushCancel(post_like);
		
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
	@GetMapping("/likePushCheck")
	public void likePushCheck(int pnumber,Model model, HttpSession session, HttpServletResponse response) throws Exception {

		 
		Member member = (Member) session.getAttribute("member");
		String memail = member.getMemail();
		
		Post_like post_like = new Post_like();
		post_like.setMemail(memail);
		post_like.setPnumber(pnumber);

		JSONObject jsonObject = new JSONObject();

		int check = service.likepushCheck(post_like);
		if (check == 0) {
			service.likepushphoto(post_like);
			jsonObject.put("result", "likesuccess");
			
		} else {
			service.likepushCancel(post_like);
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
