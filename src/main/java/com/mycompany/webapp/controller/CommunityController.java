package com.mycompany.webapp.controller;

import java.io.File;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.webapp.dto.Community;
import com.mycompany.webapp.dto.Member;
import com.mycompany.webapp.service.CommunityService;

@Controller
@RequestMapping("/community")
public class CommunityController {
	private final Logger logger=LoggerFactory.getLogger(CommunityController.class);
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
	public String Comm_Write(Community community,HttpSession session) {
			
			
			Member member=(Member) session.getAttribute("member");
			community.setC_mnickname((member.getMnickname()));
			
			//유저가 사진을 넣었을 경우
			if(!community.getCimage().isEmpty()) {
										
				
				//파일 이름 중복 방지를 위한 밀리세컨드 단위의 시간초를 파일 이름 앞에 붙여줌.
				String saveFilename = new Date().getTime()+"_"+community.getCimage().getOriginalFilename();
				community.setC_image(saveFilename);
																				
				try {
					//실제 사용자의 요청에 파일을 서버에 저장
					community.getCimage().transferTo(new File("C:/Temp/upload/community/"+saveFilename));
				} catch (Exception e) {} 
				
			}
			service.comm_write(community);
			
		return "redirect:/community";
	}

}
