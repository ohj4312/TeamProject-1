package com.mycompany.webapp.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller 
@RequestMapping("/file")
public class FileController {
	private static final Logger logger = LoggerFactory.getLogger(FileController.class);
	
	@RequestMapping("/photo")
	public String photodownload(String fileName, HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
		logger.info(fileName);
		
		//파일 정보 얻기, 파일의 데이터를 읽기 위한 입력 스트림 얻기
		String saveFilePath = "D:/MyWorkSpace/photo/photo/"+fileName;
		model.addAttribute("saveFilePath", saveFilePath);
		model.addAttribute("fileName", fileName);
		
		
		return "fileDownloadView";
		
		
	}
	
	@RequestMapping("/community")
	public String communitydownload(String fileName, HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
		logger.info(fileName);
		
		//파일 정보 얻기, 파일의 데이터를 읽기 위한 입력 스트림 얻기
		String saveFilePath = "D:/MyWorkSpace/photo/community/"+fileName;
		model.addAttribute("saveFilePath", saveFilePath);
		model.addAttribute("fileName", fileName);
		return "fileDownloadView";

	}
	
	@RequestMapping("/selfguide")
	public String selfdownload(String fileName, HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
		logger.info(fileName);
		
		//파일 정보 얻기, 파일의 데이터를 읽기 위한 입력 스트림 얻기
		String saveFilePath = "D:/MyWorkSpace/photo/selfguide/"+fileName;
		model.addAttribute("saveFilePath", saveFilePath);
		model.addAttribute("fileName", fileName);
		return "fileDownloadView";

	}
	
	@RequestMapping("/member")
	public String memberdownload(String fileName, HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
		logger.info(fileName);
		
		//파일 정보 얻기, 파일의 데이터를 읽기 위한 입력 스트림 얻기
		String saveFilePath = "D:/MyWorkSpace/photo/member/"+fileName;
		model.addAttribute("saveFilePath", saveFilePath);
		model.addAttribute("fileName", fileName);
		return "fileDownloadView";

	}
	
	@RequestMapping("/qna")
	public String qnadownload(String fileName, HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
		logger.info(fileName);
		
		//파일 정보 얻기, 파일의 데이터를 읽기 위한 입력 스트림 얻기
		String saveFilePath = "D:/MyWorkSpace/photo/qna/"+fileName;
		model.addAttribute("saveFilePath", saveFilePath);
		model.addAttribute("fileName", fileName);
		return "fileDownloadView";

	}
	

}
