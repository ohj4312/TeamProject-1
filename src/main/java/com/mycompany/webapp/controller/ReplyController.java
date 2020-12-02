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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mycompany.webapp.dto.Member;
import com.mycompany.webapp.dto.Pager;
import com.mycompany.webapp.dto.Post_reply;
import com.mycompany.webapp.dto.Register_photo;
import com.mycompany.webapp.service.ReplyService;

@Controller
@RequestMapping("/reply")
public class ReplyController {
	private static final Logger logger = LoggerFactory.getLogger(ReplyController.class);
	
	
	

	
	@Resource
	private ReplyService service;
	
	@PostMapping("/replyWrite")
	public void replyWrite(Post_reply reply, String rcontent,int pnumber,HttpServletResponse response, HttpSession session, Model model) throws IOException {
		logger.info("실행");
		
		Member member = (Member) session.getAttribute("member");
		String rwriter = member.getMemail();
		String mnickname = member.getMnickname();
		logger.info("mnickname:"+mnickname);
		logger.info("pnumber:"+pnumber);
		reply.setRwriter(rwriter);
		reply.setPnumber(pnumber);
		reply.setRcontent(rcontent);
		reply.setMnickname(mnickname);
		service.replyWrite(reply);
		response.setContentType("application/json; charset=utf-8");
		
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("result", "success");
		String json = jsonObject.toString();
		PrintWriter out = response.getWriter();
		out.println(json);
		out.flush();
		out.close();

	}
	
	
	@GetMapping("/replyList")
	public String replyList(@RequestParam(defaultValue="1")int pageNo, Model model, int pnumber) {
		logger.info("replyList : 실행");
		Post_reply reply = new Post_reply();
		reply.setPnumber(pnumber);
		int replyCount = service.getreplyCount(reply);
		
		Pager pager = new Pager(5, 5, replyCount, pageNo);
		reply.setEndRowNo(pager.getEndRowNo());
		reply.setStartRowNo(pager.getStartRowNo());

		List<Post_reply> list = service.getReplyList(reply);
		for(Post_reply r : list) {
			logger.info(r.getMnickname());
			logger.info(r.getRcontent());
			logger.info(r.getMimage());
		}
		model.addAttribute("list", list);
		model.addAttribute("pager", pager);
		model.addAttribute("pnumber", pnumber);
		model.addAttribute("count",replyCount);
		return "reply/replylist";
	}
	
	
	@PostMapping("/replyDelete")
	public void replyDelete(int rnumber, int pnumber,HttpServletResponse response) throws Exception{
		logger.info("replyDelete: 실행");
		Post_reply reply = new Post_reply();
		reply.setPnumber(pnumber);
		//서비스를 이용해서 게시물 삭제
		service.replyDelete(rnumber);
		response.setContentType("application/json; charset=utf-8");
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("result", "success");
		String json = jsonObject.toString();			//{"result", "success"}
		//응답 보내기
		PrintWriter out = response.getWriter();
		out.println(json);
		out.flush();
		out.close();
	}
	
	
	
}