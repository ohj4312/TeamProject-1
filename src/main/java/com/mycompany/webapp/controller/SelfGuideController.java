package com.mycompany.webapp.controller;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/selfguide")
public class SelfGuideController {
	
	private static final Logger logger = LoggerFactory.getLogger(SelfGuideController.class);
	
	@Resource
	private SelfGuideController service;
	
	@GetMapping("/selfguide-write")
	public String selfguideWrite() {
		return "guide/selfguide-write";
	}
	
	@GetMapping("/selfguidelist")
	public String selfguidelist() {
		return "guide/selfguidelist";
	}
}
