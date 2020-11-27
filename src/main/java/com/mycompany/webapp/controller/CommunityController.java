package com.mycompany.webapp.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.webapp.service.CommunityService;

@Controller
@RequestMapping("/community")
public class CommunityController {

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
	public String Comm_Write() {

		return "community/comm_write";
	}

}
