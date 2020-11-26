package com.mycompany.webapp.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;

public class AuthenticationSuccessHandler extends SavedRequestAwareAuthenticationSuccessHandler {
	private static final Logger logger = LoggerFactory.getLogger(AuthenticationSuccessHandler.class);
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException, ServletException {
		logger.info("실행");
		HttpSession session =  request.getSession();

		session.setAttribute("sessionMid", authentication.getName());
		
		super.onAuthenticationSuccess(request, response, authentication);
		
	}
}

