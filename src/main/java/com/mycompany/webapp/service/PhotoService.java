package com.mycompany.webapp.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.webapp.dao.PhotoDAO;
import com.mycompany.webapp.dto.A_photo;
import com.mycompany.webapp.dto.Register_photo;

@Service
public class PhotoService {

	@Resource
	PhotoDAO photoDAO;
	
	public void writePhoto(A_photo photo, Register_photo rphoto) {
		/*rphoto = photoDAO.insertRphoto(rphoto);
		photo.setRegister_number(rphoto.getPnumber());
		photoDAO.insertAphoto(photo);*/
	}

}
