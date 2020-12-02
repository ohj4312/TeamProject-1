package com.mycompany.webapp.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
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

import com.mycompany.webapp.dto.Member;
import com.mycompany.webapp.dto.Pager;
import com.mycompany.webapp.dto.Register_photo;
import com.mycompany.webapp.dto.SelfGuide;
import com.mycompany.webapp.service.SelfGuideService;

@Controller
@RequestMapping("/selfguide")
public class SelfGuideController {
	
	private static final Logger logger = LoggerFactory.getLogger(SelfGuideController.class);
	
	@Resource
	private SelfGuideService service;
	
	

	

	//셀프 가이드에 사진 올리기
	@RequestMapping("/selfguide-write")
	public String selfwriteForm() {
		return "guide/selfguide-write";
	}
	
	
	@RequestMapping("/selfwrite")
	public String selfwritePhoto(SelfGuide sg,HttpSession session,Model model,HttpServletResponse response) throws IOException {
		logger.info(sg.getScontent());
		logger.info(sg.getStitle());
		Member member = (Member) session.getAttribute("member");
		String swriter = member.getMemail();
		logger.info(swriter);
		sg.setSwriter(swriter);
		if(!sg.getSimageAttach().isEmpty()) {
			String originalFileName=sg.getSimageAttach().getOriginalFilename();
			logger.info(originalFileName);
			String saveName=new Date().getTime()+"_"+sg.getSimageAttach().getOriginalFilename();
			sg.setSimage(saveName);
			logger.info(sg.getSimage());
			File dest = new File("C:/Temp/upload/selfguide/"+saveName);
			sg.getSimageAttach().transferTo(dest);
			int row=service.setSelfWrite(sg);
			logger.info(""+row);
		}else {
			return "selfguide/selfwrite";
		}
		
		return "redirect:/selfguide/selflist";


	}

	
	//  /selfguide/selflist
	//셀프 가이드 리스트 페이징 해서 보이도록
	@RequestMapping("/selflist")
	public String selfphotoList(Model model,@RequestParam(defaultValue = "1") int pageNo, HttpSession session) {
		Member member = (Member) session.getAttribute("member");
		List<SelfGuide> guidelist;
		
		int rows = service.getRows();
		logger.info(String.valueOf(rows));
		
		
		
		Pager pager = new Pager(5, 5, rows, pageNo);
		guidelist = service.getselfguideList(pager);
		
		
		/* if(member == null) { 
			 guidelist = service.getselfguideList(pager); 
		 	}else{//로그인 한 상태 
			  SelfGuide sg = new SelfGuide();
			  sg.setSwriter(member.getMemail()); 
			  sg.setEndRowNo(pager.getEndRowNo());
			  sg.setStartRowNo(pager.getStartRowNo()); 
			  //guidelist =  service.getselfguidephotoList(sg); 
			  //sg = service.getselfguidephotoList(sg);
			  logger.info(sg.getSwriter());
			  logger.info(String.valueOf(sg.getEndRowNo()));
			  logger.info(String.valueOf(sg.getStartRowNo())); 
			  guidelist =  service.getselfguideList(pager); for(SelfGuide sg2 : guidelist) {
				  logger.info(String.valueOf(sg2.getHit_count())); 
		  } 
		  }*/
		SelfGuide sg = new SelfGuide();
		
		
		guidelist = service.getselfguidephotoList(sg);
		for(SelfGuide sge : guidelist) {
			logger.info(sge.getSwriter());
			logger.info(sge.getStype());
			logger.info(String.valueOf(sge.getSnumber()));
			//logger.info(String.valueOf(sge.getHit_count()));
			logger.info(sge.getStitle());
		}
		
		
		
		
		model.addAttribute("guidelist",guidelist);
		model.addAttribute("pager",pager);
		return "guide/selfguidelist";
		
	}
	

	//셀프 가이드 리스트에서 한 게시물 선택시 상세 뷰.
	@GetMapping("/selfdetail")
	public String selfphotoDetail(int snumber,String swriter,String scontent,Model model,HttpSession session) {
		
		Member member = (Member) session.getAttribute("member");
		//logger.info("snumber:"+String.valueOf(snumber));

		SelfGuide sg = new SelfGuide();
		
		List<SelfGuide> list;
		
		sg.setSnumber(snumber);
		sg.setSwriter(swriter);
		sg.setScontent(scontent);
		//sg.setHit_count(hit_count);
		logger.info("swriter:"+swriter);
				
		//logger.info(String.valueOf(sg.getHit_count()));
		 
		
		list=service.selectSelfPhotoList(swriter);
		
		sg = service.selectSelfPhoto(sg);
		service.updatehitcount(sg);
		
		logger.info("snumber:"+String.valueOf(sg.getSnumber()));
		logger.info(sg.getSwriter());
		logger.info(sg.getStitle());
		logger.info(sg.getStype());
		logger.info(sg.getScontent());
		//logger.info(String.valueOf(sg.getHit_count()));
		
		
		
		
		model.addAttribute("sg",sg);
		model.addAttribute("list",list);
		
		 
		return "guide/selfguide-detail";
	}
	
	
	@GetMapping("/selfguideFilter")
	public String selfguideFilter(String filterString,Model model) {
		logger.info(filterString);
		SelfGuide sg = new SelfGuide();
		List<SelfGuide> filterlist=service.getselfFilter(filterString);
		//SelfGuide sg = new SelfGuide();
		for(SelfGuide self:filterlist) {
			logger.info(self.getScontent());
			logger.info(self.getStitle());
		}
		
		
		model.addAttribute("guidelist",filterlist);
		
		return "guide/selfguide-photos";
	}
	
	
	//사진 다운로드
	@GetMapping("/photodownload")
	public void photodownload(String fileName, HttpServletRequest request, HttpServletResponse response) throws Exception {
		logger.info(fileName);
		
		//파일 정보 얻기, 파일의 데이터를 읽기 위한 입력 스트림 얻기
		String saveFilePath = "C:/Temp/upload/selfguide/"+fileName;
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
