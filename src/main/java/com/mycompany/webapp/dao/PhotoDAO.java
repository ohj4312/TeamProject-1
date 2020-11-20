package com.mycompany.webapp.dao;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.webapp.dto.Register_photo;

@Repository
public class PhotoDAO {
	@Resource
	private SqlSessionTemplate sst;

	public Register_photo insertRphoto(Register_photo rphoto) {
		//sst.insert
		return null;
	}
}
