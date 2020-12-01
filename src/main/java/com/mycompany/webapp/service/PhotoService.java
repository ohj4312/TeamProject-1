package com.mycompany.webapp.service;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.webapp.controller.PhotoController;
import com.mycompany.webapp.dao.PhotoDAO;
import com.mycompany.webapp.dto.A_photo;
import com.mycompany.webapp.dto.Pager;
import com.mycompany.webapp.dto.Register_photo;

@Service
public class PhotoService {
	private static final Logger logger = LoggerFactory.getLogger(PhotoService.class);
	@Resource
	PhotoDAO photoDAO;

	public void writePhoto(Register_photo rphoto) {
		logger.info("insertRegPhoto 실행");
		photoDAO.insertRegPhoto(rphoto);
		
		for(A_photo photo: rphoto.getList()) {
			logger.info("insertAPhoto 실행");
			if(!photo.getAimageAttach().isEmpty()) {
				photo.setRegister_number(rphoto.getPnumber());
				logger.info("Aphoto에 들어있는 regnumber:"+String.valueOf(photo.getRegister_number()));
				photoDAO.insertAphoto(photo);
			}
		}	
		
	}

	public List<Register_photo> getPhotoList() {
		
		return photoDAO.getPhotoList();
	}

	public Register_photo selectPhoto(Register_photo photo) {
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
	
	

	public int getTotalRows() {
		return photoDAO.countAll();
	}

	public List<Register_photo> getPhotoList(Pager pager, String filter) {
		
		if(filter.equals("default1")) {
			return photoDAO.selectByPage(pager);
		}else if(filter.equals("recent")) {
			return photoDAO.selectByPage(pager);
		}
		else {
			return photoDAO.selectByPageHitCount(pager);
		}
	}

	public List<Register_photo> getPhotoList(Register_photo photo, String filter) {
		// TODO Auto-generated method stub
		if(filter.equals("default1")) {
			return photoDAO.selectByPage(photo);
		}else if(filter.equals("recent")) {
			return photoDAO.selectByPage(photo);
		}else {
			return photoDAO.selectByPageHitCount(photo);
		}
	
	}

	public int checkPwriter(Register_photo photo) {
		int check = photoDAO.selectPwriterCount(photo);
		return check;
	}

	public void deltePhoto(int pnumber) {
		photoDAO.deletePhoto(pnumber);
		
	}

	/*	public void updatePhoto(Register_photo rphoto) {
			logger.info("updateRegPhoto 실행");
			photoDAO.updateRegPhoto(rphoto);
			
			for(A_photo photo: rphoto.getList()) {
				logger.info("insertAPhoto 실행");
				if(!photo.getAimageAttach().isEmpty()) {
					photo.setRegister_number(rphoto.getPnumber());
					logger.info("Aphoto에 들어있는 regnumber:"+String.valueOf(photo.getRegister_number()));
					photoDAO.insertAphoto(photo);
					photoDAO.deleteAphoto(photo);
				}
			}	
			
		}*/
	//다 삭제하고 다시 입력하는 방법
	public void updatePhoto(Register_photo rphoto) {
		logger.info("updateRegPhoto 실행");
		photoDAO.updateRegPhoto(rphoto);
		photoDAO.deleteAllAphoto(rphoto);
		
		for(A_photo photo: rphoto.getList()) {
			logger.info("insertAPhoto 실행");
			if(!photo.getAimage().isEmpty()) {
				photo.setRegister_number(rphoto.getPnumber());
				logger.info("Aphoto에 들어있는 regnumber:"+String.valueOf(photo.getRegister_number()));
				photoDAO.insertAphoto(photo);
			}
		}	
		
	}

	


}
