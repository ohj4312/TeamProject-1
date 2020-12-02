package com.mycompany.webapp.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.mycompany.webapp.dto.Community;
import com.mycompany.webapp.dto.Pager;

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
	
	public List<Community> communityselctAll(Pager pager) {
		
		List<Community> comm_list=sst.selectList("mybatis.mapper.community.communityselctAll",pager);
		return comm_list;
	}

	public List<Community> communitySelctSearch(Pager pager) {
		List<Community> comm_list=sst.selectList("mybatis.mapper.community.communityselctSerch",pager);
		
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
	
	

	public int communityCountSelectAll() {
		int rows = sst.selectOne("mybatis.mapper.community.communityselectAllcount");		
		return rows;
	}
	public int communityCountSelectAll(String temp) {
		int rows = sst.selectOne("mybatis.mapper.community.communityselectAllSearchcount",temp);		
		return rows;
	}
}
