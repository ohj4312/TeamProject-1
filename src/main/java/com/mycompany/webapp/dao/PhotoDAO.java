package com.mycompany.webapp.dao;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.webapp.controller.PhotoController;
import com.mycompany.webapp.dto.A_photo;
import com.mycompany.webapp.dto.Register_photo;

@Repository
public class PhotoDAO {
	@Resource
	private SqlSessionTemplate sst;
	
	private static final Logger logger = LoggerFactory.getLogger(PhotoDAO.class);

	

	public void insertRegPhoto(Register_photo rphoto) {
		sst.insert("mybatis.mapper.photo.insertRegPhoto", rphoto);
		logger.info("입력한 pnumber:"+ String.valueOf(rphoto.getPnumber()));
		
	}

	public void insertAphoto(A_photo photo) {
		sst.insert("mybatis.mapper.photo.insertAPhoto", photo);
		
	}
}
