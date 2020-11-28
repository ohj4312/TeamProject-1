package com.mycompany.webapp.dao;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.mycompany.webapp.dto.Community;

@Repository
public class CommunityDao {
	@Resource
	private SqlSessionTemplate sst;

	public void communityInsert(Community community) {
		sst.insert("mybatis.mapper.community.communityInsert",community);
		
	}

}
