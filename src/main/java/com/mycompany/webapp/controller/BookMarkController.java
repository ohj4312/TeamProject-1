package com.mycompany.webapp.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.webapp.dto.A_photo;
import com.mycompany.webapp.dto.Member;
import com.mycompany.webapp.dto.Post_bookmark;
import com.mycompany.webapp.service.BookMarkService;

@Controller
@RequestMapping("/BK")
public class BookMarkController {
	private static final Logger logger = LoggerFactory.getLogger(BookMarkController.class);
	
	@Resource
	private DataSource dataSource;
	
	@GetMapping("/connTest")
	public String connTest() {
		try {
			//연결 객체 요청
			Connection conn=dataSource.getConnection();		//connection tool에서 하나 가져와서 SQL에 전송 및 실행하겠다는것.
			
			//연결 객체 반납
			conn.close();
			
			//로그 출력
			logger.info("연결 객체를 성공적으로 대여후 반납");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "photo/photo-detail";
	}
	
	//서비스 주입 받음.
	@Resource
	private BookMarkService service;
	
	//photo-detail에서 요청 매핑을 받았을때  //여기가 photo-detail에서 북마크를 눌렀을때 요청매핑에 의해 컨트롤러로 넘어옴.
	@GetMapping("/regBookMark")
	public void regBookMark(int pnumber,HttpServletResponse response, HttpSession session,Member member) throws Exception { 
		logger.info("실행");
		
		String memail = (String) session.getAttribute("memail");
		if(memail == null) {
			memail = "test1@naver.com";
		}
		
		Post_bookmark pb = new Post_bookmark();
		pb.setMemail(memail);
		pb.setPnumber(pnumber);
		
		service.Register(pb);
		
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("result", "success");
		String json = jsonObject.toString();
		// 응답보내기
		PrintWriter out = response.getWriter();
		response.setContentType("application/json;charset=utf-8");
		out.println(json);
		out.flush();
		out.close();
		
		
	}
	//웹에 애초에 들어갈때 
	
	@GetMapping("/CancelBookMark")
	public void BookMarkCancel(int pnumber,HttpSession session, HttpServletResponse response) throws Exception {
		Member member = (Member) session.getAttribute("member");
		String memail = member.getMemail();
		
		Post_bookmark pb = new Post_bookmark();
		pb.setMemail(memail);
		pb.setPnumber(pnumber);
		
		service.CancelBookMark(pb);
		
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("result", "success");
		String json = jsonObject.toString();
		// 응답보내기
		PrintWriter out = response.getWriter();
		response.setContentType("application/json;charset=utf-8");
		out.println(json);
		out.flush();
		out.close();
	}
	
	
	@GetMapping("/CheckBookMark")
	public void CheckBookMark(int pnumber, HttpSession session, HttpServletResponse response ) throws Exception {
		//Post_bookmark pb = (Post_bookmark) session.getAttribute("memail");
		/*String memail = (String) session.getAttribute("memail");
		if(memail==null) {
			memail = "test1@naver.com";
		}*/
		Member member = (Member) session.getAttribute("member");
		String memail = "test1@naver.com";
		
		Post_bookmark pb = new Post_bookmark();
		pb.setPnumber(pnumber);
		pb.setMemail(memail);
		
		JSONObject jsonObject = new JSONObject();
		
		int check = service.CheckBookMark(pb);
		
		if(check ==0) {
			jsonObject.put("result", "success");
			String json = jsonObject.toString();
			// 응답보내기
			PrintWriter out = response.getWriter();
			response.setContentType("application/json;charset=utf-8");
			out.println(json);
			out.flush();
			out.close();
		}else {
			jsonObject.put("result", "failure");
			String json = jsonObject.toString();
			// 응답보내기
			PrintWriter out = response.getWriter();
			response.setContentType("application/json;charset=utf-8");
			out.println(json);
			out.flush();
			out.close();
		}
	}
	
	
	
	
	
	//조회를 위한 리스트.
	@GetMapping("/getBookMarkList")
	public String getBookMarkList(int pnumber,A_photo ap,Post_bookmark pb,Model model) {
		
		pb.setPnumber(pnumber);
		ap.setRegister_number(pnumber);
		List<Post_bookmark> list= service.Inquiry(pb);	
		
		for(int i=0; i<list.size(); i++) {
			logger.info("list:"+list.get(i).getPnumber());
			logger.info("list:"+list.get(i).getMemail());
			logger.info("list:"+list.get(i).getBnumber());
		}
		model.addAttribute("list",list);
		return "member/bookmark";
	}
	 
	

	
	
	//삭제
	@GetMapping("/delBookMark")
	public void delBookMark(int pnumber,HttpSession session,HttpServletResponse response) {
		logger.info("실행");
		Post_bookmark pb = new Post_bookmark();
		
		
		pb.setPnumber(pnumber);
		service.Delete(pb);
		
	}
	
	
	
	//조회
	@GetMapping("/detail")
	public String photoDetail() {
		
		
		return "photo/photo-detail";
	}
	
}


