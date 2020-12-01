
package com.mycompany.webapp.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mycompany.webapp.dto.Pager;
import com.mycompany.webapp.dto.Qna;
import com.mycompany.webapp.service.QnaService;

@Controller
@RequestMapping("/qna")
public class QNAController {
	private static final Logger logger = LoggerFactory.getLogger(QNAController.class);
	

	@Resource
	private QnaService service;
	
	//index페이지
	@GetMapping("/qnaindex")
	public String qnaindex(@RequestParam(defaultValue="1") int pageNo, Model model) {
		logger.info("실행");
		int totalRows = service.getTotalRows();
		Pager pager = new Pager(5, 5, totalRows, pageNo);
		List<Qna> list = service.getqnaList(pager);
		model.addAttribute("list",list);
		model.addAttribute("pager",pager);
		return "qna/qna";
	}
	
	
	//글작성 가져오기
	@GetMapping("/qnaWrite")
	public String qnaWriteForm() {
		return "qna/qnaWriteForm";
	}
	
	//글작성 데이터 전송
	@PostMapping("/qnaWrite")
	public String qnaWrite(Qna qna) {//json응답을 직접 여기서 만들어서 void라고 줌
		/*logger.info(qna.getQtitle());
		logger.info(qna.getQcontent());
		logger.info(qna.getMnickname());*/
		//서비스를 이용해서 게시물 쓰기
		service.qnaWrite(qna);//클라이언트가 전송한 내용을 넣어준다.내용을 받기 위해서Ch14Board board써주고 (board)써준다.
		return "redirect:/qna/qnaindex";
	}
	
	//게시글 상세조회
	@GetMapping("/qnaDetail")
	public String qnaDetail(int qnumber, Model model) {
		
		Qna qna = service.getQna(qnumber);
		model.addAttribute("qna", qna);
		return "qna/qnaDetail";
	}
	
	//게시글 삭제
	@PostMapping("/qnaDelete")
	public String qnaDelete(int qnumber) {
		service.qnaDelete(qnumber);
		return "redirect:/qna/qnaindex";
	}
	
	//게시글 수정 폼 가져오기
	@GetMapping("/qnaUpdate")
	public String qnaUpdateForm(int qnumber, Model model) {
		Qna qna = service.getQna(qnumber);
		model.addAttribute("qna", qna);
		return "qna/qnaUpdateForm";
	}
	
	//게시글 수정 전송
	@PostMapping("/qnaUpdate")
	public String qnaUpdate(Qna qna) {
		service.qnaUpdate(qna);
		return "redirect:/qna/qnaindex";
	}
	
	@GetMapping("/photodownload")
	public void photodownload(String fileName, 
			HttpServletRequest request, 
			HttpServletResponse response) throws Exception {
		logger.info("fileName: " + fileName);
		
		//파일의 데이터를 읽기 위한 입력 스트림 얻기
		String saveFilePath = "C:/Temp/upload/qna/" + fileName;
		InputStream is = new FileInputStream(saveFilePath);
		
		//응답 HTTP 헤더 구성
		//1) Content-Type 헤더 구성(파일의 종류 지정)
		ServletContext application = request.getServletContext();
		String fileType = application.getMimeType(fileName);
		response.setContentType(fileType);
		//2) Content-Disposition 헤더 구성(다운로드할 파일의 이름 지정)
		
		
		response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\"");
		//3) Content-Length 헤더 구성(다운로드할 파일의 크기를 지정)
		int fileSize = (int)new File(saveFilePath).length();
		response.setContentLength(fileSize);
		
		//응답 HTTP의 바디(본문) 구성
		OutputStream os = response.getOutputStream();
		FileCopyUtils.copy(is, os);
		os.flush();
		os.close();
		is.close();
	}
	

	
}

