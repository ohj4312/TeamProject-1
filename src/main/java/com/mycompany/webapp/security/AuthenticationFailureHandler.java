package com.mycompany.webapp.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.InternalAuthenticationServiceException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationFailureHandler;

public class AuthenticationFailureHandler extends SimpleUrlAuthenticationFailureHandler {
	private static final Logger logger = LoggerFactory.getLogger(AuthenticationFailureHandler.class);
	
	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response, AuthenticationException exception) throws IOException, ServletException {
		logger.info("실행");
		if(super.isUseForward()) {
			logger.info("포워드");
			request.setAttribute("failed", "아이디와 비밀번호를 다시 입력해주세요.");			
		} else {
			logger.info("리다이렉트");
			HttpSession session = request.getSession();
			session.setAttribute("mid", request.getParameter("mid"));
		}
		logger.info(exception.getMessage());
		super.onAuthenticationFailure(request, response, exception);
		
		/*if(exception instanceof BadCredentialsException) {
			
			logger.info(exception.getMessage());
		}else if(exception instanceof InternalAuthenticationServiceException) {
			logger.info(exception.getMessage());
		}*/

		
	}
}

