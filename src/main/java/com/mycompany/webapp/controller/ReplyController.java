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
	
	
	
	@GetMapping("/detail")
	public String photoDetail() {
		return "photo/photo-detail";
	}
	
	@Resource
	private ReplyService service;
	
	@PostMapping("/replyWrite")
	public void replyWrite(Post_reply reply, String rcontent,int pnumber,HttpServletResponse response, HttpSession session, Model model) throws IOException {
		logger.info("실행");
		
		Member member = (Member) session.getAttribute("member");

		
		String rwriter = member.getMemail();
		String mnickname = member.getMnickname();
		logger.info("mnickname:"+mnickname);
		
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
	
	@GetMapping("/photodownload")		//뷰 이름 리턴 안하면 다이렉트로 응답//포워드하는이유:jsp를 재사용하기 위해
	public void download(String fileName, 
			HttpServletRequest request, 
			HttpServletResponse response) throws Exception {
		logger.info("fileName: " + fileName);
		
		//파일의 데이터를 읽기 위한 입력 스트림 얻기
		String saveFilePath = "D:/MyWorkSpace/photo/" + fileName;
		InputStream is = new FileInputStream(saveFilePath);
		
		//응답 HTTP 헤더 구성
		//1) Content-Type 헤더 구성(파일의 종류 지정)
		ServletContext application = request.getServletContext();
		String fileType = application.getMimeType(fileName);
		response.setContentType(fileType);
		//2) Content-Disposition 헤더 구성(다운로드할 파일의 이름 지정)
	
		
		response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\"");
		//3) Content-Length 헤더 구성(다운로드할 파일의 크기를 지정)
		int fileSize = (int)new File(saveFilePath).length();
		response.setContentLength(fileSize);
		
		//응답 HTTP의 바디(본문) 구성
		OutputStream os = response.getOutputStream();
		FileCopyUtils.copy(is, os);
		os.flush();
		os.close();
		is.close();
	}
	
	@GetMapping("/replyList")
	public String replyList(@RequestParam(defaultValue="1")int pageNo, Model model) {
		logger.info("replyList : 실행");
		int totalRows = service.getTotalRows();
		Pager pager = new Pager(5, 5, totalRows, pageNo);
		List<Post_reply> list = service.getReplyList(pager);
		model.addAttribute("list", list);
		model.addAttribute("pager", pager);
		return "replylist";
	}
	
	
	
}