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

import com.mycompany.webapp.dto.A_photo;
import com.mycompany.webapp.dto.Member;
import com.mycompany.webapp.dto.Register_photo;
import com.mycompany.webapp.service.PhotoService;

@Controller
@RequestMapping("/photo")
public class PhotoController {
	private static final Logger logger = LoggerFactory.getLogger(PhotoController.class);
	
	@Resource
	PhotoService photoService;
	
	@GetMapping("/list")
	public String photoList() {
		return "photo/photolist";
	}
	
	@GetMapping("/detail")
	public String photoDetail() {
		
		return "photo/photo-detail";
	}
	
	@GetMapping("/write")
	public String writeForm() {
		
		return "photo/writePhoto";
	}
	
	@PostMapping("/write")
	public String writePhoto(Register_photo rphoto, HttpSession session) {
		
		//현재 로그인 이메일 가져오기
		Member member = (Member) session.getAttribute("member");
		
		//이메일 정보 set
		rphoto.setPwriter(member.getMemail());
		
		
		//리스트로 받아온 aphoto에 이미지 업로드
		for(A_photo photo: rphoto.getList()) {
			if(!photo.getAimageAttach().isEmpty()) {
				//파일 오리지널 이름 aphot에 set
				logger.info(photo.getAimageAttach().getOriginalFilename());
				photo.setAimage(photo.getAimageAttach().getOriginalFilename());
				
				//파일 이름 중복 방지를 위한 밀리세컨드 단위의 시간초를 파일 이름 앞에 붙여줌.
				String saveFilename = new Date().getTime()+"_"+photo.getAimageAttach().getOriginalFilename();
				logger.info(saveFilename);
				try {
					//실제 사용자의 요청에 파일을 서버에 저장
					photo.getAimageAttach().transferTo(new File("C:/Temp/upload/"+saveFilename));
				} catch (Exception e) {} 
				}
			}
		
		//두개의 테이블에 insert하기 위한 service 요청
		photoService.writePhoto(rphoto);
		
		
		
		

		return "redirect:/photo/list";

	}
}
