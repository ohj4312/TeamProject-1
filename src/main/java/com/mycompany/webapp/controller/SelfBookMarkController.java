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
import com.mycompany.webapp.dto.Post_bookmark;

import com.mycompany.webapp.dto.SelfGuide;
import com.mycompany.webapp.service.SelfBookMarkService;

@Controller
@RequestMapping("/selfbookmark")
public class SelfBookMarkController {
	private static final Logger logger = LoggerFactory.getLogger(SelfBookMarkController.class);

	@Resource
	private SelfBookMarkService service;
	
	@GetMapping("/selfregBookMark")
	public void regBookMark(int snumber,HttpServletResponse response, HttpSession session) throws Exception { 
		logger.info("self reg bm실행");
		logger.info(String.valueOf(snumber));
		
		
		Member member = (Member) session.getAttribute("member");
		String memail = member.getMemail();
		
		logger.info(memail);
		
		Post_bookmark pb = new Post_bookmark();
		pb.setMemail(memail);
		pb.setSnumber(snumber);
		
		//-------------------서비스--------//
		service.selfRegister(pb);
		
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
	//웹에 애초에 들어갈때 
	
	@GetMapping("/selfcancelBookMark")
	public void cancelBookMark(int snumber,HttpSession session, HttpServletResponse response) throws Exception {
		
		Member member = (Member) session.getAttribute("member");
		String memail = member.getMemail();
		
		Post_bookmark pb = new Post_bookmark();
		pb.setMemail(memail);
		pb.setSnumber(snumber);
		
		//-------------------서비스--------//
		service.selfcancelBookMark(pb);
		
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
	
	
	
	@GetMapping("/selfcheckBookMark")
	public void CheckBookMark(int snumber, HttpSession session, HttpServletResponse response ) throws Exception {
		
		Member member = (Member) session.getAttribute("member");
		String memail= member.getMemail();
		logger.info(memail);
		Post_bookmark pb = new Post_bookmark();
		pb.setSnumber(snumber);
		pb.setMemail(memail);
		
		JSONObject jsonObject = new JSONObject();
		
		//-------------------서비스--------//
		int check = service.selfcheckBookMark(pb);
		logger.info(String.valueOf(check));
		//logger.info(msg);
		if(check ==0) {
			service.selfRegister(pb);
			jsonObject.put("result", "bookmarksuccess");
		}else {
			service.selfcancelBookMark(pb);
			jsonObject.put("result", "bookmarkfailure");
		}
		
		String json = jsonObject.toString();
		// 응답보내기
		PrintWriter out = response.getWriter();
		response.setContentType("application/json;charset=utf-8");
		out.println(json);
		out.flush();
		out.close();
	}
	
	//조회를 위한 리스트.
	@GetMapping("/selfgetBookMarkList")
	public String getBookMarkList(Model model,HttpSession session) throws Exception {
		//여기의 pnumber가  A_Photo의 register_number와  같다.
		//pnumber == register_number
		//Aphoto의 사진만 일단 먼저 출력해보자  
		
		Member member = (Member) session.getAttribute("member"); 
		String memail =	member.getMemail();
		
		
		//-------------------서비스--------//
		List<SelfGuide> list = service.selfgetBookMarkList(memail);
		
		
		
		model.addAttribute("list",list);
		
		return "guide/selfguidebookmark"; 
		
		
		
		
	}
	
}
