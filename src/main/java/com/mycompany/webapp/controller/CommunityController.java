package com.mycompany.webapp.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Date;
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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.webapp.dto.Community;
import com.mycompany.webapp.dto.Member;
import com.mycompany.webapp.dto.Post_reply;
import com.mycompany.webapp.service.CommunityService;

@Controller
@RequestMapping("/community")
public class CommunityController {
	private final Logger logger = LoggerFactory.getLogger(CommunityController.class);
	@Resource
	private CommunityService service;

	@GetMapping("")
	public String board() {

		return "community/community";
	}

	@GetMapping("/comm_writeFrom")
	public String Comm_WriteFrom() {

		return "community/comm_write";
	}

	@PostMapping("/comm_write")
	public String Comm_Write(Community community, HttpSession session) {

		Member member = (Member) session.getAttribute("member");
		community.setC_mnickname((member.getMnickname()));

		// 유저가 사진을 넣었을 경우
		if (!community.getCimage().isEmpty()) {

			// 파일 이름 중복 방지를 위한 밀리세컨드 단위의 시간초를 파일 이름 앞에 붙여줌.
			String saveFilename = new Date().getTime() + "_" + community.getCimage().getOriginalFilename();
			community.setC_image(saveFilename);

			try {
				// 실제 사용자의 요청에 파일을 서버에 저장
				community.getCimage().transferTo(new File("C:/Temp/upload/community/" + saveFilename));
			} catch (Exception e) {
			}

		}
		service.comm_write(community);

		return "redirect:/community";
	}

	@GetMapping("/comm_list")
	public String Comm_list(Model model,int check,String search)
	{
		//검색으로 컨트롤러를 호출한건지 확인!
		if(check==1) {
			
			String temp ="%"; 
			temp+=search+"%";
			logger.info("temp");
			List<Community> comm_list= service.Comm_search(temp);
			model.addAttribute("comm_list", comm_list);			
			return"community/communitylist";
			}
		
		List<Community> comm_list =service.Comm_list();
		model.addAttribute("comm_list", comm_list);
		
		return"community/communitylist";
	
	}		
	@GetMapping("/comm_listphoto")
	public void download(String fileName, HttpServletRequest request, HttpServletResponse response) throws Exception {
	
		// 파일의 데이터를 읽기 위한 입력 스트림 얻기
		String saveFilePath = "C:/Temp/upload/community/"+fileName;
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
	
	@GetMapping("/comm_detail")
	public String Comm_Detail(int cnumber, String cmnickname, Model model, HttpSession session) {
		Member member = (Member) session.getAttribute("member");
		Community comm_list = new Community();
		comm_list.setC_number(cnumber);
		comm_list.setC_mnickname(cmnickname);
		comm_list=service.Comm_one(comm_list);
		logger.info("이미지출력해보자"+comm_list.getMimage());
		model.addAttribute("list", comm_list);
		return "community/comm_detail";
	}

}
