package com.mycompany.webapp.dao;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;

public class LikeDAO {

	@Resource
	private SqlSessionTemplate sst;
	public int likePhotocountAll() {
		
		
		int getTotalRows = sst.selectOne("mybatis.mapper.likephoto.likePhotocountAll");
	
	return getTotalRows;
	}
}
