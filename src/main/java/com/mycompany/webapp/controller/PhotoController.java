package com.mycompany.webapp.controller;


import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.json.JSONArray;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.mycompany.webapp.dto.Member;
import com.mycompany.webapp.dto.Register_photo;
import com.mycompany.webapp.service.PhotoService;

@Controller 
@RequestMapping("/photo")
public class PhotoController {
	private static final Logger logger = LoggerFactory.getLogger(PhotoController.class);
	
	@Resource
	PhotoService photoService;
	
	List<Register_photo> photolist;
	Register_photo photo;
	
	@RequestMapping("/list")
	public String photoList(Model model, @RequestParam(defaultValue = "1") int pageNo, @RequestParam(defaultValue = "default1") String filter, HttpSession session) {		

		photolist = photoService.getPhotoList(pageNo, filter, session, 12);

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
		
		photolist = photoService.getPhotoList(pageNo, filter, session, 9);
		
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
		photo = new Register_photo();
		photo.setPnumber(pnumber);
		
		if(member != null) {
			photo.setPwriter(member.getMemail());
			check = photoService.isWriter(photo);
		}

		photo = photoService.getRegisterPhoto(photo);
		
		

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
		try {
			photoService.writePhoto(rphoto, session);
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

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
		photo = new Register_photo();
	
		photo.setPnumber(pnumber);
		
		if(member != null) {
			photo.setPwriter(member.getMemail());
		}

		photo = photoService.getRegisterPhoto(photo);


		model.addAttribute("photo", photo);

		return "photo/updatePhoto";
	}
	
	@PostMapping("/update")
	public String update(Register_photo rphoto, HttpSession session) {
	
		try {
			photoService.updatePhoto(rphoto, session);
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:/photo/list";
	}
}
