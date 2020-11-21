package com.mycompany.webapp.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.LikeDAO;
import com.mycompany.webapp.dto.Post_like;

@Service
public class LikeService {

	@Resource
	private LikeDAO likeDao;

	public List<Post_like> getLikePhotoList(String memail) {
		List<Post_like> likelist = likeDao.likePhotoAll(memail);
		return likelist;
	}

}
