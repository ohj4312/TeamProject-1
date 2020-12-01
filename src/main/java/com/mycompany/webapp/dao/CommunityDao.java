package com.mycompany.webapp.dao;

import java.util.List;

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
	
	public int comm_replyInsert(Community community) {
		int rows = sst.insert("mybatis.mapper.community.communityReplyInsert", community);
		return rows;
	}
	
	public List<Community> communityselctAll() {
		List<Community> comm_list=sst.selectList("mybatis.mapper.community.communityselctAll");
		return comm_list;
	}

	public List<Community> communitySelctSearch(String temp) {
		List<Community> comm_list=sst.selectList("mybatis.mapper.community.communityselctSerch",temp);
		
		return comm_list;
	}

	public Community communitySelectOne(Community community){
		Community comm_list = sst.selectOne("mybatis.mapper.community.communityselectOne", community);
		return comm_list;
	}

	public void communityUpdatehits(int cnumber) {
			sst.update("mybatis.mapper.community.communityUpdatehits", cnumber);
		
	}

	public List<Community> communityHitsSelectAll() {
		List<Community> comm_listHit=sst.selectList("mybatis.mapper.community.communityHitsselctAll");
		return comm_listHit;
	}
	
	
}
