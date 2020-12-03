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
			File dest = new File("D:/Myworkspace/photo/selfguide/"+saveName);
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
	public String selfphotoList(Model model,@RequestParam(defaultValue = "All")String filterString, @RequestParam(defaultValue = "0") int firstcount,@RequestParam(defaultValue = "1") int pageNo, HttpSession session) {
		Member member = (Member) session.getAttribute("member");
		List<SelfGuide> guidelist;
		logger.info(filterString);
		int rows = service.getRows(filterString);

		Pager pager = new Pager(3, 5, rows, pageNo); 		
		SelfGuide sg = new SelfGuide();
		sg.setStype(filterString);
		sg.setEndRowNo(pager.getEndRowNo());
		sg.setStartRowNo(pager.getStartRowNo());
		
		if(member == null) {
			guidelist = service.getselfguidephotoListFilter(sg);
		} else {
			
			sg.setSwriter(member.getMemail());
			sg.setEndRowNo(pager.getEndRowNo());
			sg.setStartRowNo(pager.getStartRowNo());
			
			guidelist = service.getselfguidephotoListFilter(sg);
		}
		
		model.addAttribute("guidelist",guidelist);
		model.addAttribute("pager",pager);
		model.addAttribute("stype",filterString);
		
		//3위까지 가져오기위한 것이올시다.
		List<SelfGuide> selforder=service.getOrder();
		model.addAttribute("order",selforder);
		if(firstcount == 0) {
			return "guide/selfguidelist";
		}else {
			return "guide/selfguide-photos";
		}
		
	}
	

	//셀프 가이드 리스트에서 한 게시물 선택시 상세 뷰.
	@GetMapping("/selfdetail")
	public String selfphotoDetail(int snumber,Model model,HttpSession session) {
		
		Member member = (Member) session.getAttribute("member");
		//logger.info("snumber:"+String.valueOf(snumber));

		SelfGuide sg = new SelfGuide();
		
		List<SelfGuide> list;
		if(member ==null) {
			return "member/login";
		}
		sg.setSnumber(snumber);
		sg.setSwriter(member.getMemail());
		logger.info(String.valueOf(sg.getHit_count()));	
		
		sg = service.selectSelfPhoto(sg);//self detail 부분
		
		
		service.updatehitcount(sg);
		
		logger.info("snumber:"+String.valueOf(sg.getSnumber()));
		logger.info(sg.getSwriter());
		logger.info(sg.getStitle());
		logger.info(sg.getStype());
		logger.info(sg.getScontent());
		//logger.info(String.valueOf(sg.getHit_count()));
		model.addAttribute("sg",sg);

		return "guide/selfguide-detail";
	}
	
	
	@GetMapping("/selfguideFilter")
	public String selfguideFilter(String filterString,Model model) {
		logger.info(filterString);
		SelfGuide sg = new SelfGuide();
		
		sg.setStype(filterString);
		//int rows = service.getFilterRows(sg.getStype());
		//logger.info(String.valueOf(rows));
		
		//Pager pager = new Pager(3, 5, rows, pageNo);
		List<SelfGuide> filterlist=service.getselfFilter(filterString);
		
		for(SelfGuide self:filterlist) {
			logger.info(self.getScontent());
			logger.info(self.getStitle());
		}
		
		model.addAttribute("guidelist",filterlist);
		
		return "guide/selfguide-photos";
	}
	

	@GetMapping("/deleteSelfguide")
	public String deleteSelfguide(int snumber) {
		service.deleteSelfguide(snumber);
		return "redirect:/selfguide/selflist";
	}
	
	@GetMapping("/updateSelfguide")
	public String updateSelfguide(int snumber,Model model) {
		logger.info(""+snumber);
		logger.info("update실행된다!!!!!!!!!!!!!!!!!!!!!!!!!");
		SelfGuide sg = new SelfGuide();
		sg.setSnumber(snumber);
		sg=service.selectSelfPhoto(sg);
		logger.info(sg.getStitle());
		logger.info(sg.getScontent());
		logger.info(sg.getSimage());
		logger.info(sg.getStype());
		model.addAttribute("sg",sg);
		return "guide/selfguide-update";
	}
	
	@PostMapping("/selfupdate")
	public String selfupdate(SelfGuide sg) throws IllegalStateException, IOException {
		logger.info(""+sg.getSnumber());
		logger.info(""+sg.getSimage());
		logger.info("update바뀐다???????????????????????????");
		if(!sg.getSimageAttach().isEmpty()) {
			String originalFileName=sg.getSimageAttach().getOriginalFilename();
			logger.info(originalFileName);
			String saveName=new Date().getTime()+"_"+sg.getSimageAttach().getOriginalFilename();
			sg.setSimage(saveName);
			logger.info(sg.getSimage());
			File dest = new File("D:/Myworkspace/photo/selfguide/"+saveName);
			sg.getSimageAttach().transferTo(dest);
			
		}
		
		service.changeSelfPhoto(sg);
		
		
		return "redirect:/selfguide/selflist";
	}
}
