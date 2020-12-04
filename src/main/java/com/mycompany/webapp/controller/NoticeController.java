package com.mycompany.webapp.controller;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mycompany.webapp.dto.Notice;
import com.mycompany.webapp.dto.Pager;
import com.mycompany.webapp.service.NoticeService;

@Controller
@RequestMapping("/Notice")
public class NoticeController {
	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);
	
	@Resource
	private NoticeService service;
	
	@RequestMapping("/list")
	public String list(@RequestParam(defaultValue="1") int pageNo, Model model) {
		logger.info("실행");
		int totalRows = service.getTotalRows();
		Pager pager = new Pager(5, 5, totalRows, pageNo);
		List<Notice> list = service.getnoticeList(pager);
		model.addAttribute("list", list);
		model.addAttribute("pager", pager);
		return "Notice/Notice-list";
	}
	
	//글작성 가져오기
	@GetMapping("/noticeWrite")
	public String noticeWriteForm() {
		logger.info("dd");
		return "Notice/noticeWriteForm";
	}
	
	@PostMapping("/noticeWrite")
	public String noticeWrite(Notice notice) {
		service.noticeWrite(notice);
		return "redirect:/Notice/list";
	}
	
	@GetMapping("/noticeDetail")
	public String noticeDetail(int nnumber, Model model) {
		Notice notice = service.getnotice(nnumber);
		model.addAttribute("notice", notice);
		return "Notice/noticeDetail";
	}
	
	@PostMapping("/noticeDelete")
	public String noticeDelete(int nnumber) {
		service.noticeDelete(nnumber);
		return "redirect:/Notice/list";
	}
	
	@GetMapping("/noticeUpdate")
	public String noticeUpdate(int nnumber, Model model) {
		Notice notice = service.getnotice(nnumber);
		model.addAttribute("notice", notice);
		return "Notice/noticeUpdateForm";
	}
	
	@PostMapping("/noticeUpdate")
	public String noticeUpdate(Notice notice) {
		service.noticeUpdate(notice);
		return "redirect:/Notice/list";
	}
	
}
