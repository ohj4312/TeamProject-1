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

import com.mycompany.webapp.dto.Community;
import com.mycompany.webapp.dto.Member;
import com.mycompany.webapp.dto.Pager;
import com.mycompany.webapp.service.CommunityService;

@Controller
@RequestMapping("/community")
public class CommunityController {
	private final Logger logger = LoggerFactory.getLogger(CommunityController.class);
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
	public String Comm_Write(Community community, HttpSession session) {

		Member member = (Member) session.getAttribute("member");
		community.setC_mnickname((member.getMnickname()));

		// 유저가 사진을 넣었을 경우
		if (!community.getCimage().isEmpty()) {

			// 파일 이름 중복 방지를 위한 밀리세컨드 단위의 시간초를 파일 이름 앞에 붙여줌.
			String saveFilename = new Date().getTime() + "_" + community.getCimage().getOriginalFilename();
			community.setC_image(saveFilename);

			try {
				// 실제 사용자의 요청에 파일을 서버에 저장
				community.getCimage().transferTo(new File("C:/Temp/upload/community/" + saveFilename));
			} catch (Exception e) {
			}

		}
		service.comm_write(community);

		return "redirect:/community";
	}

	@GetMapping("/comm_list")
	public String Comm_list(Model model, int check, String search,@RequestParam(defaultValue="1")int pageNo) {

		// 검색으로 컨트롤러를 호출한건지 확인!
		if (check == 1) {
			
			String temp = "%";
			temp += search + "%";
			int rows = service.Comm_listLow(temp);
			Pager pager = new Pager(5, 5,rows, pageNo);
			pager.setTemp(temp);
			List<Community> comm_list = service.Comm_search(pager);
			model.addAttribute("pager",pager);
			model.addAttribute("comm_list", comm_list);
			return "community/communitylist";
		}
		/*조회수 리스트*/
		if (check == 2) {
			List<Community> comm_listHits = service.Comm_listHits();// 조회수리스트
			model.addAttribute("comm_list", comm_listHits);
			return "community/communitylistHits";
		}
		int rows = service.Comm_listLow();
		Pager pager = new Pager(5, 5,rows, pageNo);
		List<Community> comm_list = service.Comm_list(pager);// 전체리스트		
		model.addAttribute("pager",pager);
		model.addAttribute("comm_list", comm_list);
		return "community/communitylist";

	}

	

	@GetMapping("/comm_detail")
	public String Comm_Detail(int cnumber, String cmnickname, Model model, HttpSession session) {
		Member member = (Member) session.getAttribute("member");

		service.Comm_hits(cnumber); // 조회수

		Community comm_list = new Community();
		comm_list.setC_number(cnumber);
		comm_list.setC_mnickname(cmnickname);
		comm_list = service.Comm_one(comm_list);
		logger.info("이미지출력해보자" + comm_list.getMimage());
		model.addAttribute("list", comm_list);
		return "community/comm_detail";
	}

}
