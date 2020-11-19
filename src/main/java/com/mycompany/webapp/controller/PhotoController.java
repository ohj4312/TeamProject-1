package com.mycompany.webapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/photo")
public class PhotoController {
	@GetMapping("/list")
	public String photoList() {
		return "photo/photolist";
	}
	
	@GetMapping("/detail")
	public String photoDetail() {
		return "photo/photo-detail";
	}
	
	@GetMapping("/write")
	public String write() {
		return "photo/writePhoto";
	}
}
