package com.mycompany.webapp.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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

		return "ahm/getLikePhotolist";
	}

	@GetMapping("/photodownload")
	public void download(String fileName, HttpServletRequest request, HttpServletResponse response) throws Exception {
		logger.info("fileName:" + fileName);

		// 파일의 데이터를 읽기 위한 입력 스트림 얻기
		String saveFilePath = "D:/MyWorkspace/potho/" + fileName;
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

}
