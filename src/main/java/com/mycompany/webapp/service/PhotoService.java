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

	public Register_photo selectPhoto(int pnumber) {
		List<A_photo> aphotos = photoDAO.selectAphotoList(pnumber);
		for(A_photo photo: aphotos) {
			logger.info(photo.getAcontent());
			logger.info(photo.getAimage());
			logger.info(photo.getAlocation());
			logger.info(String.valueOf(photo.getAnumber()));
			logger.info(String.valueOf(photo.getRegister_number()));
			
		
		}
		Register_photo photo = photoDAO.selectRegPhoto(pnumber);
		photo.setList(aphotos);
		
		return photo;
	}

	public int getTotalRows() {
		return photoDAO.countAll();
	}

	public List<Register_photo> getPhotoList(Pager pager) {
		
		return photoDAO.selectByPage(pager);
	}


}
