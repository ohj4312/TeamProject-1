package com.mycompany.webapp.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.webapp.dto.Member;
import com.mycompany.webapp.dto.Post_bookmark;
import com.mycompany.webapp.dto.Register_photo;
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
	public void regBookMark(int pnumber,HttpServletResponse response, HttpSession session) throws Exception { 
		logger.info("실행");
		logger.info(String.valueOf(pnumber));
		
		
		Member member = (Member) session.getAttribute("member");
		String memail = member.getMemail();
		
		logger.info(memail);
		
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
	public void BookMarkCancel(int pnumber,HttpSession session,Register_photo ph, HttpServletResponse response) throws Exception {
		
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
		
		Member member = (Member) session.getAttribute("member");
		String memail= member.getMemail();
		logger.info(memail);
		Post_bookmark pb = new Post_bookmark();
		pb.setPnumber(pnumber);
		pb.setMemail(memail);
		
		int check = service.CheckBookMark(pb);
		
		JSONObject jsonObject = new JSONObject();
		logger.info(String.valueOf(check));
		if(check ==0) {
			//service.Register(pb);
			jsonObject.put("result", "success");
			
		}else {
			//service.CancelBookMark(pb);
			jsonObject.put("result", "failure");
		}
		
		String json = jsonObject.toString();
		// 응답보내기
		PrintWriter out = response.getWriter();
		response.setContentType("application/json;charset=utf-8");
		out.println(json);
		out.flush();
		out.close();
	}
	
	
	
	
	
	//조회를 위한 리스트.
	@GetMapping("/getBookMarkList")
	public String getBookMarkList(Model model,HttpSession session) throws Exception {
		//여기의 pnumber가  A_Photo의 register_number와  같다.
		//pnumber == register_number
		//Aphoto의 사진만 일단 먼저 출력해보자  

		Member member = (Member) session.getAttribute("member"); 
		String memail =	member.getMemail();
		
		//Post_bookmark pb = new Post_bookmark();
		//pb.setPnumber(pnumber);
		//pb.setMemail(memail);
		
		
		List<Register_photo> list = service.getBookMarkList(memail);
		
		
		
		model.addAttribute("list",list);
		
		return "member/bookmark"; 
		
		
		
		
	}
	 
	@GetMapping("/photodownload")
	public void download(String fileName,HttpServletRequest request,HttpServletResponse response) throws Exception {		//리턴 타입이 void이니까  jsp를 안 거친다.
		logger.info("fileName: "+fileName);
		
		
		//파일의 데이터를 읽기 위한 입력 스트림 얻기.
		String saveFilePath = "C:/Temp/upload/"+fileName;
		logger.info(saveFilePath);
		InputStream is = new FileInputStream(saveFilePath);
		
		
		 
		//응답 HTTP 헤더 구성				//여기 우리 프로젝트 할때 복사 하고 카피 !
		
		//1) Content - Type 헤더 구성	-	응답으로 보내는 파일의 종류가 뭐냐  어떤 종류의 파일이 다운로드 되고 있다. 이런 정보는 브라우저가 실행할 파일(워드? 그림판?)을 결정하기 위함임.
		ServletContext application = request.getServletContext();
		//String fileType= application.getMimeType(fileName);// 이 파일 네임의 확장명.
		response.setContentType(fileName);
		
		
		//2) Content-Disposition 헤더 구성. - 다운로드할 파일의 이름 지정.			//
		//String originalFileName = fileName.split("_")[1];							
		//originalFileName = new String(originalFileName.getBytes("UTF-8"),"ISO-8859-1"); 			//한글을 영어로 바꾸겠다. 한글1자를 3바이트로 표현
		response.setHeader("Content-Disposition", " filename=\""+fileName+"\"");		//  \" 여길 데이터로 보겠다.  \"
		//파일을 다운로드할때 파일이름을 헤더에다가 집어 넣는데 그때 이름이 Content-Disposition , 2번째는 값.
		//2번째는 originalFileName이 들어가면 되는데.								/ fileName= 숫자_파일.jpg  //split하게되면  {"숫자 ", "파일.jpg"}  
																													//0번	  1번index	
		//3) Content-Length 헤더 구성 	- 다운로드할 파일의 크기를 지정.
		int fileSize = (int)new File(saveFilePath).length();
		response.setContentLength(fileSize);
		
		//응답 HTTP의 바디(본문) 구성
		//문자가 아닌 파일이니 바이트스트림으로 해야한다.
		OutputStream os = response.getOutputStream();		//javaProject ch14 exam02_inputSTream copy와 같은 스프링 표현
		FileCopyUtils.copy(is, os);	//is에서 읽어서 os로 보낸다
		os.flush();
		os.close();
		is.close();
		
		//썸네일을 눌러서 그림을 다운로드 하고 싶다.  한부분문 고치면 되는데.. getFileList.jsp에서  ${fileName}
			
	}														

	
	
	
	
	
}


