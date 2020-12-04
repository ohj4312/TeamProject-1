package com.mycompany.webapp.controller;

import java.io.File;
import java.io.FileInputStream;
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

import com.mycompany.webapp.dao.C_ReplyDao;
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
				community.getCimage().transferTo(new File("D:/MyWorkspace/photo/community/" + saveFilename));
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
		for(Community r : comm_list) {
		
			int replyCount= service.Comm_replyrows(r.getC_number());
			
			r.setReplyCount(replyCount);
			
		}
		
		model.addAttribute("pager",pager);
		model.addAttribute("comm_list", comm_list);
		return "community/communitylist";

	}		
	@GetMapping("/comm_detail")
	public String Comm_Detail(int cnumber, String cmnickname,Model model, HttpSession session) {	
		service.Comm_hits(cnumber);	//조회수		
		
		Community comm_list = new Community();
		comm_list.setC_number(cnumber);
		comm_list.setC_mnickname(cmnickname);
		comm_list=service.Comm_one(comm_list);
		logger.info("이미지출력해보자"+comm_list.getMimage());
		model.addAttribute("list", comm_list);
		return "community/comm_detail";
	}
	
	@GetMapping("/comm_delete")
	public String comm_delete(int c_number){
		service.comm_delete(c_number);
		
		return "redirect:/community";
		
	}
	
	@PostMapping("/comm_replyWrite")
	public void comm_replyWrite(Community comm_list, String rcontent,int c_number,HttpServletResponse response, HttpSession session, Model model) throws Exception {
		logger.info("실행");
		
		Member member = (Member) session.getAttribute("member");
		String mnickname = member.getMnickname();
		
		comm_list.setCr_rmnickname(mnickname);
		comm_list.setCr_cnumber(c_number);
		comm_list.setCr_rcontent(rcontent);
		service.comm_replyWrite(comm_list);
		
		response.setContentType("application/json; charset=utf-8");
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("result", "success");
		String json = jsonObject.toString();
		PrintWriter out = response.getWriter();
		out.println(json);
		out.flush();
		out.close();
	}
	
	@GetMapping("/comm_replyList")
	public String comm_replyList(@RequestParam(defaultValue="1")int pageNo, Model model, int c_number,String c_mnickname) {
		logger.info("실행");
		
		int rows = service.Comm_replyrows(c_number);
		Pager pager = new Pager(5, 5, rows, pageNo);
		pager.setC_number(c_number);
		List<Community> comm_replylist =service.Comm_replylist(pager);
		model.addAttribute("comm_replylist",comm_replylist);
		model.addAttribute("pager",pager);
		model.addAttribute("c_mnickname",c_mnickname);
		
		
		return "community/communityreplylist";
	}
	
	@GetMapping("/comm_replyListRe")
	public String comm_replyListRe(Model model, int cr_rnumber) {
		logger.info("리플실행");
		
		logger.info(""+cr_rnumber);			
		List<Community> comm_replylistRe =service.Comm_replylistre(cr_rnumber);
		for(Community r : comm_replylistRe) {
			
			logger.info("asdasdasd"+r.getCr_rmnickname());
			
			
			
		}		
		model.addAttribute("comm_replylistRe",comm_replylistRe);
			
		
		return "community/communityreplylist-lp";
	}
	@PostMapping("/comm_replyListReWrite")
	public String comm_replyListReWrite(HttpSession session,String rcontent,int cr_rnumber,int c_number,String c_mnickname){			
		Community community = new Community();
		Member member=(Member)session.getAttribute("member");
		community.setCr_rmnickname(member.getMnickname());
		community.setCr_rcontent(rcontent);
		community.setCr_rnumber(cr_rnumber);
		logger.info(community.getCr_rcontent());
		logger.info("맞아 ?"+community.getCr_rnumber());
		
		service.comm_replyWriteRe(community);		
		return "redirect:/community/comm_detail?cnumber="+c_number+"&cmnickname="+c_mnickname;	
	} 


}
