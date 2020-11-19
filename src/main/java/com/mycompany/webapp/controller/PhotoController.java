package com.mycompany.webapp.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.webapp.dto.A_photo;
import com.mycompany.webapp.dto.Register_photo;

@Controller
@RequestMapping("/photo")
public class PhotoController {
	private static final Logger logger = LoggerFactory.getLogger(PhotoController.class);
	
	@GetMapping("/list")
	public String photoList() {
		return "photo/photolist";
	}
	
	@GetMapping("/detail")
	public String photoDetail() {
		return "photo/photo-detail";
	}
	
	@PostMapping("/writePhoto")
	public String writePhoto(A_photo photo, Register_photo rphoto) {
		logger.info(photo.getAlocation());
		logger.info(rphoto.getPsize());
		logger.info(rphoto.getPstyle());
		logger.info(rphoto.getPtype());
		
		
		
		
		return "";
	}
}
