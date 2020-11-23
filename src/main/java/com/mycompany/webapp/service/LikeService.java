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
		List<Post_like> likelist = likeDao.likePhotoAllSelect(memail);
		return likelist;
	}

	public void likepushphoto(Post_like post_like) {
		
		 likeDao.PhotolikeInsert(post_like);
			
	}

	public int likepushCheck(Post_like post_like) {
		int check= likeDao.likephotoCheck(post_like);
		
		
		return check;
	}

	public void likepushCancel(Post_like post_like) {
		likeDao.likePhotoDelete(post_like);
		
	}

}
