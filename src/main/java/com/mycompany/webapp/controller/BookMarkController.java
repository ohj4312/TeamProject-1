package com.mycompany.webapp.controller;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.mycompany.webapp.dto.Post_bookmark;
import com.mycompany.webapp.service.BookMarkService;

@Controller
public class BookMarkController {
	private static final Logger logger = LoggerFactory.getLogger(BookMarkController.class);
	
	//서비스 주입 받음.
	@Resource
	private BookMarkService service;
	
	//photo-detail에서 요청 매핑을 받았을때  //여기가 photo-detail에서 북마크를 눌렀을때 요청매핑에 의해 컨트롤러로 넘어옴.
	@GetMapping("/regBookMark")
	public String regBookMark(Post_bookmark bookmark) {
		
		service.Register(bookmark);
		return "redirect:/views/photo-detail";
	}
	
	
	//조회를 위한 리스트.
	@GetMapping("/getBookMarkList")
	public String getBookMarkList(Post_bookmark bookmark,Model model) {
		List<Post_bookmark> list= service.Inquiry(bookmark);	
		model.addAttribute("list",list);
		return "views/bookmark-detail";
	}
	 
	//삭제
	@GetMapping("/delBookMark")
	public String delBookMark(int bnumber) {
		String result =service.Delete(bnumber);
		return""; 
	}
	
	//업데이트
	/*@GetMapping("/upBookMark")
	public String upBookMark(int bnumber) {
		String result = service.Update(bnumber);
		
		return "";
	}*/
}








