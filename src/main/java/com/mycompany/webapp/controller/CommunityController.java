package com.mycompany.webapp.controller;

import java.io.File;
import java.util.Date;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.webapp.dto.A_photo;
import com.mycompany.webapp.service.CommunityService;

@Controller
@RequestMapping("/community")
public class CommunityController {

	@Resource
	private CommunityService service;

	@GetMapping("")
	public String board() {

		return "community/community";
	}

	@GetMapping("/comm_writeFrom")
	public String Comm_WriteFrom() {

		return "community/comm_write";
	}

	@PostMapping("/comm_write")
	public String Comm_Write() {
		
		/*for(A_photo photo: rphoto.getList()) {
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
		*/
		return "re:community/comm_write";
	}

}
