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
import com.mycompany.webapp.dto.SelfGuide_reply;
import com.mycompany.webapp.service.SelfGuideReplyService;

@Controller
@RequestMapping("/selfguide")
public class SelfGuideReplyController {
	
	private static final Logger logger = LoggerFactory.getLogger(SelfGuideReplyController.class);
	
	@Resource
	private SelfGuideReplyService service;
	
	
	@PostMapping("/replyWrite")
	public void selfreplyWrite(SelfGuide_reply sg_reply, String rcontent,
			int snumber,HttpServletResponse response, HttpSession session) throws Exception
	{
		logger.info("실행");
		Member member = (Member) session.getAttribute("member");
		
		String rwriter = member.getMemail();
		String mnickname = member.getMnickname();
		logger.info(rwriter);
		logger.info(mnickname);
		
		sg_reply.setRwriter(rwriter);
		sg_reply.setSnumber(snumber);	//snumber는 selfguide의 snumber 참조.
		sg_reply.setRcontent(rcontent);
		sg_reply.setMnickname(mnickname);
		
		service.replyWrite(sg_reply);
		response.setContentType("application/json; charset=UTF-8");
		
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("result", "success");
		String json = jsonObject.toString();
		PrintWriter out = response.getWriter();
		out.println(json);
		out.flush(); 
		out.close();
	}
	


	@GetMapping("/replyList")
	public String selfreplyList(@RequestParam(defaultValue="1")int pageNo,Model model,int snumber,HttpSession session) {
		
		Member member = (Member) session.getAttribute("member");
		SelfGuide_reply sg_reply = new SelfGuide_reply();
		
		sg_reply.setSnumber(snumber);
		
		
		int replyCount = service.getReplyCount(sg_reply);
		
		Pager pager = new Pager(5, 5, replyCount, pageNo);
		sg_reply.setEndRowNo(pager.getEndRowNo());
		sg_reply.setStartRowNo(pager.getStartRowNo());
		
		
		
		List<SelfGuide_reply> list = service.getReplyList(sg_reply);
		
		for(SelfGuide_reply sg: list) {
			logger.info(sg.getMnickname());
			logger.info(sg.getRcontent());
			logger.info(sg.getRimage());
		}
		logger.info(String.valueOf(replyCount));
		model.addAttribute("list", list);
		model.addAttribute("pager", pager);
		model.addAttribute("snumber", snumber);
		model.addAttribute("count", replyCount);
		model.addAttribute("member",member);
		return "guide/selfguide-replylist";
	}
	
	@PostMapping("/replyDelete")
	public void selfreplyDelete(int snumber, int rnumber,HttpServletResponse response) throws Exception {
		logger.info("replyDelete 실행 되었을까");
		SelfGuide_reply sg_reply = new SelfGuide_reply();
		sg_reply.setSnumber(snumber);
		
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
	
	//사진 다운로드
	@GetMapping("/photodownload2")
	public void photodownload2(String fileName, HttpServletRequest request, HttpServletResponse response) throws Exception {
		logger.info(fileName);
			
		//파일 정보 얻기, 파일의 데이터를 읽기 위한 입력 스트림 얻기
		String saveFilePath = "C:/Temp/upload/selfguide/"+fileName;
		InputStream is = new FileInputStream(saveFilePath);
			
			 
		//응답 HTTP헤더 구성
		//1) Content Type 헤더 구성 ->어떤 파일의 타입으로 응답을 보낼 것 인가?
		ServletContext sc = request.getServletContext();
		//sc.getMimeType(fileName) -> 파일 확장명을 추출
		String fileType = sc.getMimeType(fileName);
		//헤더에 setting
		//추출한 파일 확장명을 통해 contentType 설정 
		response.setContentType(fileType); 

		//2)Content-Disposition 헤더 구성 -> 응답할 파일의 이름 설정, 다운 여부 설정
		//파일에 붙어 있는 숫자를 분리하고 오리지널 이름을 추출
		String originalFileName = fileName.split("_")[1];
		//파일 이름이 한글일 경우를 대비해 한글 변환
		originalFileName = new String(originalFileName.getBytes("UTF-8"), "ISO-8859-1");

		//헤더에 setting
		//attachment가 들어가면 무조건 다운 안 붙을 경우 보여줄 수 있는 파일(이미지파일)은 보여주고 아닌 파일(실행 파일)은 다운
		//filename은 응답할 파일의 이름 설정
		response.setHeader("Content-Disposition", "attachment; filename=\""+originalFileName+"\"");

		//3)ContentLegth 헤더 구성 -> 응답할 파일의 크기 설정
		//응답보낼 파일의 크기 추출
		int size = (int)new File(saveFilePath).length();
		//헤더에 크기 setting
		response.setContentLength(size);

		//4)응답HTTP바디(본문) 구성
		//실제 파일을 응답하는 과정
		OutputStream os = response.getOutputStream();
		//알아서 파일을 읽어서 보냄.
		FileCopyUtils.copy(is, os);
		os.flush();
		os.close();
		is.close();


	}
		
}










