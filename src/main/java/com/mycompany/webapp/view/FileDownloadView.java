package com.mycompany.webapp.view;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

@Component
public class FileDownloadView extends AbstractView {
	private static final Logger logger = LoggerFactory.getLogger(FileDownloadView.class);
	
	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
				logger.info("실행");
				String saveFilePath = (String)model.get("saveFilePath");
				String fileName = (String)model.get("fileName");
				
				logger.info(saveFilePath);
				logger.info(fileName);
				InputStream is = new FileInputStream(saveFilePath);
				//응답 HTTP헤더 구성
				//1) Content Type 헤더 구성 ->어떤 파일의 타입으로 응답을 보낼 것 인가?
				ServletContext sc = request.getServletContext();
				//sc.getMimeType(fileName) -> 파일 확장명을 추출
				String fileType = sc.getMimeType(fileName);
				//헤더에 setting
				//추출한 파일 확장명을 통해 contentType 설정
				response.setContentType(fileType);
				
				//2)Content-Disposition 헤더 구성 -> 응답할 파일의 이름 설정, 다운 여부 설정
				//파일에 붙어 있는 숫자를 분리하고 오리지널 이름을 추출
				String originalFileName = fileName.split("_")[1];
				//파일 이름이 한글일 경우를 대비해 한글 변환
				originalFileName = new String(originalFileName.getBytes("UTF-8"), "ISO-8859-1");
				
				//헤더에 setting
				//attachment가 들어가면 무조건 다운 안 붙을 경우 보여줄 수 있는 파일(이미지파일)은 보여주고 아닌 파일(실행 파일)은 다운
				//filename은 응답할 파일의 이름 설정
				response.setHeader("Content-Disposition", "attachment; filename=\""+originalFileName+"\"");
				
				//3)ContentLegth 헤더 구성 -> 응답할 파일의 크기 설정
				//응답보낼 파일의 크기 추출
				int size = (int)new File(saveFilePath).length();
				//헤더에 크기 setting
				response.setContentLength(size);
				
				//4)응답HTTP바디(본문) 구성
				//실제 파일을 응답하는 과정
				OutputStream os = response.getOutputStream();
				//알아서 파일을 읽어서 보냄.
				FileCopyUtils.copy(is, os);
				os.flush();
				os.close();
				is.close();
		
	}
	

}
