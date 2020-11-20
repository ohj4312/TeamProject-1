package com.mycompany.webapp.view;

import java.io.File;
import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.view.AbstractView;

@Component
public class FileUploadView extends AbstractView {
	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		/*if(!board.getAttach().isEmpty()) {
			logger.info("attach file name:" + board.getAttach().getOriginalFilename());
			logger.info("attach file size:" + board.getAttach().getSize());
			logger.info("attach file type:" + board.getAttach().getContentType());
			//파일 이름 중복 방지를 위한 밀리세컨드 단위의 시간초를 파일 이름 앞에 붙여줌.
			String saveFilename = new Date().getTime()+"_"+board.getAttach().getOriginalFilename();
			try {
				//실제 사용자의 요청에 파일을 서버에 저장
				board.getAttach().transferTo(new File("C:/Temp/upload/"+saveFilename));
			} catch (Exception e) {} 
		}
		return "ch09/content";*/
		
	}
}
