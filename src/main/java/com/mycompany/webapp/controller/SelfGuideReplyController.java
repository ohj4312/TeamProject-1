package com.mycompany.webapp.controller;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/selfguide")
public class SelfGuideReplyController {
	
	private static final Logger logger = LoggerFactory.getLogger(SelfGuideReplyController.class);
	
	@Resource
	private SelfGuideReplyController service;
	
	
	
	
	
	
}
