package com.mycompany.webapp.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.SelfLikeDAO;
import com.mycompany.webapp.dto.Post_like;
import com.mycompany.webapp.dto.SelfGuide;

@Service
public class SelfLikeService {
	
	@Resource
	private SelfLikeDAO slDAO;
	//리스트 불러오기
	public List<SelfGuide> selfgetLikePhotoList(String memail) {
		List<SelfGuide> likelist = slDAO.selfgetLikeList(memail);
		return likelist;
	}
	
	//좋아요 등록
	public void selflikepush(Post_like post_like) {
		slDAO.selfLikeInsert(post_like);
		
	}
	
	//좋아요 취소
	public void selflikepushCancel(Post_like post_like) {
		slDAO.selfLikeDelete(post_like);
		
	}
	
	//좋아요 체크
	public int selflikepushCheck(Post_like post_like) {
		int check = slDAO.selfLikeCheck(post_like);
		return check;
	}

}
