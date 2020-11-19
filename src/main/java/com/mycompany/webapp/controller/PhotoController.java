package com.mycompany.webapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/photo")
public class PhotoController {
	@GetMapping("/list")
	public String photoList() {
		return "photolist";
	}
	
	@GetMapping("/detail")
	public String photoDetail() {
		return "photo-detail";
	}
	
	
}
