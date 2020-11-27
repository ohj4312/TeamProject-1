package com.mycompany.webapp.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mycompany.webapp.dto.A_photo;
import com.mycompany.webapp.dto.Member;
import com.mycompany.webapp.dto.Pager;
import com.mycompany.webapp.dto.Register_photo;
import com.mycompany.webapp.service.PhotoService;

@Controller
@RequestMapping("/photo")
public class PhotoController {
	private static final Logger logger = LoggerFactory.getLogger(PhotoController.class);
	
	@Resource
	PhotoService photoService;
	
	@GetMapping("/list")
	public String photoList(Model model, @RequestParam(defaultValue = "1") int pageNo) {
		int totalRows = photoService.getTotalRows();
		
		Pager pager = new Pager(12, 5, totalRows, pageNo);
		
		List<Register_photo> photolist =  photoService.getPhotoList(pager);
		
		model.addAttribute("list", photolist);
		
		
		return "photo/photolist";
		
	}
	
	@PostMapping("/list")
	public String photoListByPage(Model model, @RequestParam(defaultValue = "1") int pageNo) {
		int totalRows = photoService.getTotalRows();
		
		Pager pager = new Pager(9, 5, totalRows, pageNo);
		logger.info(String.valueOf(pager.getEndRowNo()));
		List<Register_photo> photolist =  photoService.getPhotoList(pager);
		for(Register_photo photo : photolist) {
			logger.info("list로 들어오는 파일명과 pnumber:"+ photo.getFirst_image() + "/"+photo.getPnumber());
			logger.info(photo.getPsize() + photo.getPstyle() + photo.getPtype());
		}
		model.addAttribute("list", photolist);
		
		return "include/photos";
		
	}
	
	
	
	@GetMapping("/detail")
	public String photoDetail(int pnumber, Model model) {
		logger.info(String.valueOf(pnumber));
		Register_photo photo = photoService.selectPhoto(pnumber);
		logger.info(photo.getPsize());
		logger.info(photo.getPstyle());
		logger.info(photo.getPtype());
		logger.info(photo.getPwriter());
		logger.info("대표이미지"+photo.getFirst_image());
		model.addAttribute("photo", photo);
		return "photo/photo-detail";
	}
	
	@GetMapping("/write")
	public String writeForm() {
		
		return "photo/writePhoto";
	}
	
	@PostMapping("/write")
	public String writePhoto(Register_photo rphoto, HttpSession session) {
		
		//현재 로그인 이메일 가져오기
		Member member = (Member) session.getAttribute("member");
		
		//이메일 정보 set
		rphoto.setPwriter(member.getMemail());
		
		
		//리스트로 받아온 aphoto에 이미지 업로드
		for(A_photo photo: rphoto.getList()) {
			int savefirst = 0;
			if(!photo.getAimageAttach().isEmpty()) {
				//파일 오리지널 이름 aphot에 set
				logger.info(photo.getAimageAttach().getOriginalFilename());
				
				
				//파일 이름 중복 방지를 위한 밀리세컨드 단위의 시간초를 파일 이름 앞에 붙여줌.
				String saveFilename = new Date().getTime()+"_"+photo.getAimageAttach().getOriginalFilename();
				photo.setAimage(saveFilename);
				if(savefirst == 0) {
					rphoto.setFirst_image(saveFilename);
					rphoto.setFirst_content(photo.getAcontent());
				}
				
				savefirst++;
				
				logger.info(saveFilename);
				try {
					//실제 사용자의 요청에 파일을 서버에 저장
					photo.getAimageAttach().transferTo(new File("C:/Temp/upload/"+saveFilename));
				} catch (Exception e) {} 
				}
			}
		
		//두개의 테이블에 insert하기 위한 service 요청
		
		photoService.writePhoto(rphoto);
		
		
		
		

		return "redirect:/photo/list";

	}
	
	@GetMapping("/photodownload")
	public void photodownload(String fileName, HttpServletRequest request, HttpServletResponse response) throws Exception {
		logger.info(fileName);
		
		//파일 정보 얻기, 파일의 데이터를 읽기 위한 입력 스트림 얻기
		String saveFilePath = "C:/Temp/upload/"+fileName;
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
	
	@GetMapping("/SelfGuide")
	public String SelfGuide() {
		return "photo/selfguidelist";
	}
}
