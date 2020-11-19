package com.mycompany.webapp.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.LikeDAO;

@Service
public class LikeService {

	@Resource
	private LikeDAO likeDao;
	@Resource
	
	public int getTotalRows() {
	int getTotalRows= likeDao.likePhotocountAll();
	
	return getTotalRows;
	}
}
