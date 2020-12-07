package com.mycompany.webapp.service;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import com.mycompany.webapp.dao.PhotoDAO;
import com.mycompany.webapp.dto.A_photo;
import com.mycompany.webapp.dto.Member;
import com.mycompany.webapp.dto.Pager;
import com.mycompany.webapp.dto.Register_photo;

@Service
public class PhotoService {
	private static final Logger logger = LoggerFactory.getLogger(PhotoService.class);
	@Resource
	PhotoDAO photoDAO;
	
	Register_photo register_photo;
	
	public int getTotalRows() {
		return photoDAO.countAll();
	}

	public List<Register_photo> getPhotoList(int pageNo, String filter, HttpSession session, int rowsPerPage) {
		logger.info("클린코드를 위한 메소드");
		Member member = (Member) session.getAttribute("member");
		
		int totalRows = getTotalRows();
		
		Pager pager = new Pager(rowsPerPage, 5, totalRows, pageNo);
		
		logger.info(filter);

		if(member == null) {
			if(filter.equals("hit")) {
				return photoDAO.selectByPageHitCount(pager);
			}
			return photoDAO.selectByPage(pager);
		}else {
			Register_photo photo = new Register_photo();
			photo.setPwriter(member.getMemail());
			photo.setEndRowNo(pager.getEndRowNo());
			photo.setStartRowNo(pager.getStartRowNo());
			if(filter.equals("hit")) {
				return photoDAO.selectByPageHitCount(photo);
			}
			return photoDAO.selectByPage(photo);
		}
		
	}

	public void writePhoto(Register_photo rphoto, HttpSession session) throws IllegalStateException, IOException {
		logger.info("클린코드 작성");
		Member member = (Member) session.getAttribute("member");
		register_photo = rphoto;
		// 이메일 정보 set
		register_photo.setPwriter(member.getMemail());

		// 리스트로 받아온 aphoto에 이미지 업로드
		saveAphoto(register_photo.getList());
		
		photoDAO.insertRegPhoto(register_photo);
		
		for(A_photo photo: register_photo.getList()) {
			logger.info("insertAPhoto 실행");
			if(!photo.getAimageAttach().isEmpty()) {
				photo.setRegister_number(register_photo.getPnumber());
				logger.info("Aphoto에 들어있는 regnumber:"+String.valueOf(photo.getRegister_number()));
				photoDAO.insertAphoto(photo);
			}
		}
		
		
	}
		
	public void saveAphoto(List<A_photo> list) throws IllegalStateException, IOException {
		for (A_photo photo : list) {

			if (!photo.getAimageAttach().isEmpty()) {
				// 파일 오리지널 이름 aphot에 set
				logger.info(photo.getAimageAttach().getOriginalFilename());

				// 파일 이름 중복 방지를 위한 밀리세컨드 단위의 시간초를 파일 이름 앞에 붙여줌.
				String saveFilename = new Date().getTime() + "_" + photo.getAimageAttach().getOriginalFilename();
				photo.setAimage(saveFilename);
				
				logger.info(saveFilename);
				photo.getAimageAttach().transferTo(new File("D:/MyWorkSpace/photo/photo/" + saveFilename));
				
			}
		}
		register_photo.setFirst_content(list.get(0).getAcontent());
		register_photo.setFirst_image(list.get(0).getAimage());
		register_photo.setList(list);
	}
	
	public int isWriter(Register_photo photo) {
		int check = photoDAO.selectPwriterCount(photo);
		return check;
	}

	public Register_photo getRegisterPhoto(Register_photo photo) {
		List<A_photo> aphotos = photoDAO.selectAphotoList(photo.getPnumber());
		
		
		if(photo.getPwriter() == null) {
			photo = photoDAO.selectRegPhoto(photo.getPnumber());
		}else {
			photo = photoDAO.selectRegPhoto(photo);
		}
		int hitcount = photo.getPhit_count();
		photo.setPhit_count(hitcount+1);
		photoDAO.updateHitCount(photo);
		photo.setList(aphotos);
		
		return photo;
	}

	public void deltePhoto(int pnumber) {
		photoDAO.deletePhoto(pnumber);
		
	}

	public void updatePhoto(Register_photo rphoto, HttpSession session) throws IllegalStateException, IOException {
		Member member = (Member) session.getAttribute("member");
		
		register_photo = rphoto;
		//이메일 정보 set
		register_photo.setPwriter(member.getMemail());
		logger.info(String.valueOf(rphoto.getPnumber()));
		

		//리스트로 받아온 aphoto에 이미지 업로드 -> 새로 들어온 파일들은 업로드 
		saveAphoto(register_photo.getList());

		photoDAO.updateRegPhoto(register_photo);
		photoDAO.deleteAllAphoto(register_photo);
		
		for(A_photo photo: register_photo.getList()) {
			logger.info("insertAPhoto 실행");
			if(!photo.getAimage().isEmpty()) {
				photo.setRegister_number(register_photo.getPnumber());
				logger.info("Aphoto에 들어있는 regnumber:"+String.valueOf(photo.getRegister_number()));
				photoDAO.insertAphoto(photo);
			}
		}
		
	}

}
