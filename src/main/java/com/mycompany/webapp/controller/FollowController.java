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
	
	
	@GetMapping("/photodownload")
	public void download(String fileName, HttpServletRequest request, HttpServletResponse response) throws Exception {
		logger.info("fileName:" + fileName);

		// 파일의 데이터를 읽기 위한 입력 스트림 얻기
		String saveFilePath = "D:/MyWorkspace/photo/" + fileName;
		InputStream is = new FileInputStream(saveFilePath);
		// 응답 HTTP 헤더 구성
		// Content-Type 헤더 구성
		// 파일의 종류
		ServletContext application = request.getServletContext();
		String fileType = application.getMimeType(fileName);
		response.setContentType(fileName);
		// 2) Content-Disposition 헤더 구성
		// 다운로드할 파일의 이름지정 // 한글이 불가능
		response.setHeader("Content-Disposition", " filename=\"" + fileName + "\"");
		// 3) Content-Length 헤더구성
		// 다운로드할 파일의 크기를 지정
		// 파일 크기 없어도 괜찮지만 유저한태 크기를 알려주기 위해서 사용
		int fileSize = (int) new File(saveFilePath).length();// 파일사이즈 얻기
		response.setContentLength(fileSize);
		// 응답 HTTP의 바디(본문) 구성
		// 항상 바이트 스트림 으로 출력스트림 사용!!!!!
		OutputStream os = response.getOutputStream();
		FileCopyUtils.copy(is, os);
		os.flush();
		os.close();
		is.close();

	}
	
	//followList 조회
	@GetMapping("/followList")
	public String followList(Model model,HttpSession session) {
		Member member=(Member)session.getAttribute("member");
		String memail=member.getMemail();
		List<Follows> follows=followService.getFollowList(memail);
		model.addAttribute("follows",follows);
		return "practice/followList";
	}
	
	//followingList 조회
	@GetMapping("/followingList")
	public String followingList(Model model,HttpSession session) {
		Member member=(Member)session.getAttribute("member");
		String memail=member.getMemail();
		List<Follows> follows=followService.getFollowingList(memail);
		model.addAttribute("follows",follows);
		return "practice/followingList";
	}
	
	@GetMapping("/checkFollow")
	public void checkFollow(String pwirter, HttpSession session,HttpServletResponse response) throws IOException {
		System.out.println(pwirter);
		Member member=(Member)session.getAttribute("member");
		String follower=member.getMemail();
		Follows follows = new Follows();
		follows.setFollowing(pwirter);
		follows.setFollower(follower);
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
	public void cancelFollow(String pwirter,Model model,HttpSession session,HttpServletResponse response) throws IOException {
		Member member=(Member)session.getAttribute("member");
		String memail=member.getMemail();
		Follows follows=new Follows();
		follows.setFollower(memail);
		follows.setFollowing(pwirter);
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
	public void followCheck(String pwirter,HttpSession session,HttpServletResponse response) throws IOException {
		Member member=(Member)session.getAttribute("member");
		String memail=member.getMemail();
		Follows follow=new Follows();
		follow.setFollowing(pwirter);
		logger.info(pwirter);
		follow.setFollower(memail);
		int result=followService.followCheck(follow);
		JSONObject jsonObject = new JSONObject(); 
		if(result == 0) {
			 
			jsonObject.put("result", "fail");
			String json = jsonObject.toString();
			// 응답 보내기
			PrintWriter out = response.getWriter();
			response.setContentType("application/json;charset=utf-8");
			out.println(json);
			out.flush();
			out.close();
			

		}else {
 
			jsonObject.put("result", "success");
			String json = jsonObject.toString();
			// 응답 보내기
			PrintWriter out = response.getWriter();
			response.setContentType("application/json;charset=utf-8");
			out.println(json);
			out.flush();
			out.close();
		}
			
	}
}
