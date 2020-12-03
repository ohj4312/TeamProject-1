
package com.mycompany.webapp.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
	
	//글작성 , 파일데이터 전송
	@PostMapping("/qnaWrite")
	public String qnaWrite(Qna qna) {//json응답을 직접 여기서 만들어서 void라고 줌
		//받은 파일을 저장하고 저장된 이름을 Qna 객체에 저장
		if(!qna.getAttach().isEmpty()) {
			String saveFileName = new Date().getTime() + "_" + qna.getAttach().getOriginalFilename();//같은 그림이어도 시간함수여서 사진이 저장될때 중복이 안된다.
			try {
				qna.getAttach().transferTo(new File("D:/MyWorkspace/photo/qna/" + saveFileName));
			} catch (Exception e) {}
			qna.setQphoto(saveFileName);
		} else {
			qna.setQphoto("1_noimage.png");
		}
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
	
	//게시글 수정 전송//update는 write와 다르게 저장을 안해도 기존내용이 저장되게끔 하기 위해 else를 사용안한다.qhpto에 기본값이 null이 들어가는지 확인하기 위해서 dao에서 확인함
	@PostMapping("/qnaUpdate")
	public String qnaUpdate(Qna qna) {
		//받은 파일을 저장하고 저장된 이름을 Qna 객체에 저장
		if(!qna.getAttach().isEmpty()) {
			String saveFileName = new Date().getTime() + "_" + qna.getAttach().getOriginalFilename();//같은 그림이어도 시간함수여서 사진이 저장될때 중복이 안된다.
			try {
				qna.getAttach().transferTo(new File("D:/MyWorkspace/photo/qna/" + saveFileName));
			} catch (Exception e) {}
			
			qna.setQphoto(saveFileName);
		} 
		
		service.qnaUpdate(qna);
		return "redirect:/qna/qnaindex";
	}
	
	
	@GetMapping("/qnaAnswer")
	public String qnaAnswer(int qnumber, Model model) {
		Qna qna = service.getQna(qnumber);
		model.addAttribute("qna", qna);
		return "qna/qnaAnswerForm";
	}
	
	@PostMapping("/qnaAnswer")
	public String qnaAnswer(Qna qna) {
		//서비스를 이용해서 게시물 쓰기
		service.qnaUpdateAnswer(qna);
		return "redirect:/qna/qnaindex";
	}
	
}

