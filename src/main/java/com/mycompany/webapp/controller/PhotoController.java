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
	
	@RequestMapping("/list")
	public String photoList(Model model, @RequestParam(defaultValue = "1") int pageNo, @RequestParam(defaultValue = "default1") String filter, HttpSession session) {
		
		Member member = (Member) session.getAttribute("member");
		List<Register_photo> photolist;
		int totalRows = photoService.getTotalRows();
		Pager pager = new Pager(12, 5, totalRows, pageNo);
		logger.info(filter);
		if(member == null) {
			photolist =  photoService.getPhotoList(pager, filter);
		}else {
			Register_photo photo = new Register_photo();
			photo.setPwriter(member.getMemail());
			photo.setEndRowNo(pager.getEndRowNo());
			photo.setStartRowNo(pager.getStartRowNo());
			photolist =  photoService.getPhotoList(photo, filter);
		}

		model.addAttribute("list", photolist);
		model.addAttribute("initcount", 2);
		if(filter.equals("default1")) {
			return "photo/photolist";
		}else {
			return "include/photos";
		}
	
		
	}
	
	@RequestMapping("/listjson")
	public void photoListjson(Model model, @RequestParam(defaultValue = "1") int pageNo, @RequestParam(defaultValue = "default1") String filter,HttpSession session, HttpServletResponse response) throws IOException {
		
		Member member = (Member) session.getAttribute("member");
		List<Register_photo> photolist;
		int totalRows = photoService.getTotalRows();
		Pager pager = new Pager(9, 5, totalRows, pageNo);
		logger.info(filter);
		if(member == null) {
			photolist =  photoService.getPhotoList(pager, filter);
		}else {
			Register_photo photo = new Register_photo();
			photo.setPwriter(member.getMemail());
			photo.setEndRowNo(pager.getEndRowNo());
			photo.setStartRowNo(pager.getStartRowNo());
			photolist =  photoService.getPhotoList(photo, filter);
		}

		JSONArray jarry = new JSONArray();
		
		for(Register_photo photo : photolist) {
			JSONObject jsonObject = new JSONObject();
			String pwritersubstring = photo.getPwriter().substring(0, photo.getPwriter().indexOf('@'));
			logger.info(pwritersubstring);
			jsonObject.put("ptype", photo.getPtype());
			jsonObject.put("psize", photo.getPsize());
			jsonObject.put("pstyle", photo.getPstyle());
			jsonObject.put("pwriter", photo.getPwriter());
			jsonObject.put("mimage", photo.getMimage());
			jsonObject.put("mnickname", photo.getMnickname());
			jsonObject.put("following", photo.getFollowing());
			jsonObject.put("pwritersubstring", pwritersubstring);
			jsonObject.put("pnumber", photo.getPnumber());
			jsonObject.put("first_image", photo.getFirst_image());
			jsonObject.put("phit_count", photo.getPhit_count());
			jsonObject.put("bnumber", photo.getBnumber());
			jsonObject.put("likenumber", photo.getLikenumber());
			jsonObject.put("first_content", photo.getFirst_content());
			logger.info(String.valueOf(photo.getLikenumber()));
			jarry.put(jsonObject);
		}
		
		response.setHeader("Content-Type", "application/xml"); 
		response.setContentType("application/json;charset=UTF-8"); 
		response.setCharacterEncoding("utf-8");
		String json = jarry.toString();
		// 응답보내기
		PrintWriter out = response.getWriter();
		//response.setContentType("application/json;charset=utf-8");
		out.println(json);
		out.flush();
		out.close();
		
	
		
	}
	
	
	
	
	@GetMapping("/detail")
	public String photoDetail(int pnumber, Model model, HttpSession session) {
		Member member = (Member) session.getAttribute("member");
		int check = 0;
		logger.info(String.valueOf(pnumber));
		Register_photo photo = new Register_photo();
	
		photo.setPnumber(pnumber);
		
		if(member != null) {
			photo.setPwriter(member.getMemail());
			check = photoService.checkPwriter(photo);
		}

		photo = photoService.selectPhoto(photo);


		model.addAttribute("photo", photo);
		model.addAttribute("updatecheck", check);

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
					photo.getAimageAttach().transferTo(new File("D:/MyWorkSpace/photo/photo/"+saveFilename));
				} catch (Exception e) {} 
				}
			}
		
		//두개의 테이블에 insert하기 위한 service 요청
		
		//테스트용 insert
		/*for(int i = 0; i < 10; i++) {
			photoService.writePhoto(rphoto);
		}*/
		photoService.writePhoto(rphoto);
		
		
		
		

		return "redirect:/photo/list";

	}
	
	@GetMapping("/delete")
	public String delete(int pnumber) {
		photoService.deltePhoto(pnumber);
		return "redirect:/photo/list";
	}
	
	@GetMapping("/update")
	public String updateForm(int pnumber, HttpSession session, Model model) {
		Member member = (Member) session.getAttribute("member");
		logger.info(String.valueOf(pnumber));
		Register_photo photo = new Register_photo();
	
		photo.setPnumber(pnumber);
		
		if(member != null) {
			photo.setPwriter(member.getMemail());
		}

		photo = photoService.selectPhoto(photo);


		model.addAttribute("photo", photo);

		return "photo/updatePhoto";
	}
	
	@PostMapping("/update")
	public String update(Register_photo rphoto, HttpSession session) {
		//현재 로그인 이메일 가져오기
		Member member = (Member) session.getAttribute("member");
		
		//이메일 정보 set
		rphoto.setPwriter(member.getMemail());
		logger.info(String.valueOf(rphoto.getPnumber()));
		

		//리스트로 받아온 aphoto에 이미지 업로드 -> 새로 들어온 파일들은 업로드 
		for(A_photo photo: rphoto.getList()) {
			if(!photo.getAimage().isEmpty()) {
				logger.info(photo.getAimage());
			}
			if(!photo.getAimageAttach().isEmpty()) {
				//파일 오리지널 이름 aphot에 set
				logger.info(photo.getAimageAttach().getOriginalFilename());
				
				//파일 이름 중복 방지를 위한 밀리세컨드 단위의 시간초를 파일 이름 앞에 붙여줌.
				String saveFilename = new Date().getTime()+"_"+photo.getAimageAttach().getOriginalFilename();
				photo.setAimage(saveFilename);
				logger.info(saveFilename);
				try {
					//실제 사용자의 요청에 파일을 서버에 저장
					photo.getAimageAttach().transferTo(new File("D:/MyWorkSpace/photo/photo/"+saveFilename));
				} catch (Exception e) {}
				}
			}
		
		//첫번째값 가져오기
		rphoto.setFirst_content(rphoto.getList().get(0).getAcontent());
		rphoto.setFirst_image(rphoto.getList().get(0).getAimage());
		logger.info(rphoto.getFirst_content());
		logger.info(rphoto.getFirst_image());

		photoService.updatePhoto(rphoto);
		
		
				
		return "redirect:/photo/list";
	}

}
