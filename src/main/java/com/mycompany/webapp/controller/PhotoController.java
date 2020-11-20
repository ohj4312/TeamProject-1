package com.mycompany.webapp.controller;

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
	public String writePhoto(A_photo photo, Register_photo rphoto, HttpSession session) {
		logger.info(photo.getAlocation());
		logger.info(rphoto.getPsize());
		logger.info(rphoto.getPstyle());
		logger.info(rphoto.getPtype());
		logger.info(photo.getAcontent());
		logger.info(photo.getAimageAttach().getOriginalFilename());
		Member member = (Member) session.getAttribute("member");
		rphoto.setPwriter(member.getMemail());
		//photoService.writePhoto(photo, rphoto);
		
		
		
		
		
		return "redirect:/photo/list";
	}
}
