package com.mycompany.webapp.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.C_ReplyDao;
import com.mycompany.webapp.dao.CommunityDao;
import com.mycompany.webapp.dto.Community;

@Service
public class CommunityService {
	@Resource
	private CommunityDao communityDao;
	@Resource
	private C_ReplyDao c_replyDao;
	
	public void comm_write(Community community) {
		
		communityDao.communityInsert(community);
		
	}

	public List<Community> Comm_list() {
		List<Community> comm_list=communityDao.communityselctAll();
		return comm_list;
	}

	public List<Community> Comm_search(String temp) {
		List<Community> comm_list=communityDao.communitySelctSearch(temp);
		return  comm_list;
	}

	public Community Comm_one(int cnumber){
		Community comm_list = communityDao.communitySelectOne(cnumber);
		return comm_list;
	}

	public void Comm_hits(int cnumber){
		communityDao.communityUpdatehits(cnumber);
		
	}
	
	
	
	

}
