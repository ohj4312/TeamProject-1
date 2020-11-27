package com.mycompany.webapp.dao;

import java.util.List;

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
import com.mycompany.webapp.dto.Pager;
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

	public List<Register_photo> getPhotoList() {
		// TODO Auto-generated method stub
		return sst.selectList("mybatis.mapper.photo.selectList");
	}

	public List<A_photo> selectAphotoList(int pnumber) {
		// TODO Auto-generated method stub
		return sst.selectList("mybatis.mapper.photo.selectAphotoList" , pnumber);
	}

	public Register_photo selectRegPhoto(int pnumber) {
		// TODO Auto-generated method stub
		return sst.selectOne("mybatis.mapper.photo.selectRegPhoto" , pnumber);
	}
	
	public Register_photo selectRegPhoto(Register_photo photo) {
		// TODO Auto-generated method stub
		return sst.selectOne("mybatis.mapper.photo.selectcheckRegPhoto" , photo);
	}

	public int countAll() {
		// TODO Auto-generated method stub
		return sst.selectOne("mybatis.mapper.photo.countAll");
	}

	public List<Register_photo> selectByPage(Pager pager) {
		
		return sst.selectList("mybatis.mapper.photo.selectByPage", pager);
	}

	public List<Register_photo> selectByPage(Register_photo photo) {
		// TODO Auto-generated method stub
		return sst.selectList("mybatis.mapper.photo.selectCheckByPageList", photo);
	}

	public void updateHitCount(Register_photo rphoto) {
		sst.update("mybatis.mapper.photo.updateHitCount",rphoto);
		
	}

	public int selectOneLike(String memail) {
		return sst.selectOne("mybatis.mapper.photo.likeCount", memail);
	}

	public int selectOneBookMark(String memail) {
		return sst.selectOne("mybatis.mapper.photo.bookmarkCount", memail);
	}

	

	
}
