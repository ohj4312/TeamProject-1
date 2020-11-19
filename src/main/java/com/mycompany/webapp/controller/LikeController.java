package com.mycompany.webapp.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/photo2")
public class LikeController {
	private Logger logger = LoggerFactory.getLogger(LikeController.class);
	@GetMapping("/getLikePhotolist")
	public String getLikePhoto(Model model) {
		
	
		logger.info("실행");
		return "ahm/getLikePhtolist";	
	}
}
