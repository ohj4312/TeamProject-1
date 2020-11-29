package com.mycompany.webapp.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	
	
	
	@GetMapping("/qnaWrite")
	public String qnaWriteForm() {
		return "qna/qnaWriteForm";
	}
	
	@PostMapping("/qnaWrite")
	public String qnaWrite(Qna qna) {//json응답을 직접 여기서 만들어서 void라고 줌
		/*logger.info(qna.getQtitle());
		logger.info(qna.getQcontent());
		logger.info(qna.getMnickname());*/
		//서비스를 이용해서 게시물 쓰기
		service.qnaWrite(qna);//클라이언트가 전송한 내용을 넣어준다.내용을 받기 위해서Ch14Board board써주고 (board)써준다.
		return "redirect:/qna/qnaindex";
	}
}
