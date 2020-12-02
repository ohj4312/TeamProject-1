package com.mycompany.webapp.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/customer")
public class CustomerCenterController {
	private static final Logger logger = LoggerFactory.getLogger(CustomerCenterController.class);
	@RequestMapping("/list")
	public String list() {
		return "customer/customercenter-list";
	}
}
