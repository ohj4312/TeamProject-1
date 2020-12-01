package com.mycompany.webapp.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.C_ReplyDao;
import com.mycompany.webapp.dao.CommunityDao;
import com.mycompany.webapp.dto.Community;
import com.mycompany.webapp.dto.Pager;

@Service
public class CommunityService {
	@Resource
	private CommunityDao communityDao;
	@Resource
	private C_ReplyDao c_replyDao;
	
	public void comm_write(Community community) {
		
		communityDao.communityInsert(community);
		
	}

	public List<Community> Comm_list(Pager pager) {
		List<Community> comm_list=communityDao.communityselctAll(pager);
		return comm_list;
	}

	public List<Community> Comm_search(Pager pager) {
		List<Community> comm_list=communityDao.communitySelctSearch(pager);
		return  comm_list;
	}

	public Community Comm_one(Community community){
		Community comm_list = communityDao.communitySelectOne(community);
		return comm_list;
	}

	public void Comm_hits(int cnumber){
		communityDao.communityUpdatehits(cnumber);
		
	}

	public List<Community> Comm_listHits() {
		List<Community> comm_listhits= communityDao.communityHitsSelectAll();
		return comm_listhits;
	}

	public int Comm_listLow() {
		int rows = communityDao.communityCountSelectAll();
		return rows;
	}
	public int Comm_listLow(String temp) {
		int rows = communityDao.communityCountSelectAll(temp);
		return rows;
	}
	
	
	
	
	

}
