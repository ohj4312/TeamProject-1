package com.mycompany.webapp.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
		//클래스 위에 작성을 해놓고. /content를 지워주면   /ch01만 남겨놓아서  중복된 ch01을 위로 올려준것.
								//이렇게 하면 서버경로에 따라 요청하는 메소드가 달라진다. 
public class HomeController {		//이것을 관리객체로
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping("/")				//  http://localhost:8080/teamproject/
	public String content() {
		logger.info("실행");
		return "home";			
	
	}
	
}
