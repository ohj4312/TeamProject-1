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
	
	public int comm_replyWrite(Community community) {
		return c_replyDao.comm_replyInsert(community);
	}
	
	public int getCount(Community community) {
			int count = c_replyDao.communityReplyCount(community);
			return count;
		}
	
	public Community comm_replyList(int cnumber) {
			Community community = c_replyDao.communityReplyList(cnumber);
			return community;
		}
	
	public List<Community> comm_ReplyList(Community community) {
		List<Community> list = c_replyDao.ReplyPage(community);
		return list;
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
		Community comm_list = c_replyDao.communitySelectOne(community);
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

	public void comm_delete(int c_number) {
		communityDao.communityDelete(c_number);
		
	}

	public int Comm_replyrows(int c_number) {
		int rows = c_replyDao.comm_replyselectRows(c_number);
		return rows;
	}

	public List<Community> Comm_replylist(Pager pager) {
		List<Community> list = c_replyDao.comm_rlplylistAll(pager);
		return list;
	}
	
	
	
	
	

}
