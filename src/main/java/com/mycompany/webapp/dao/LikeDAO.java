package com.mycompany.webapp.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.mycompany.webapp.dto.Post_like;

@Repository
public class LikeDAO {
	private Logger logger = LoggerFactory.getLogger(LikeDAO.class);
	@Resource
	private SqlSessionTemplate sst;

	public List<Post_like> likePhotoAll(String memail) {
		
		List<Post_like> likelist = sst.selectList("mybatis.mapper.likephoto.likePhotoAll",memail);
		
		return likelist;
	}
}
