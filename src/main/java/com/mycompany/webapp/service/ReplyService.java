package com.mycompany.webapp.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.ReplyDAO;
import com.mycompany.webapp.dto.Pager;
import com.mycompany.webapp.dto.Post_reply;

@Service
public class ReplyService {
	
	@Resource
	private ReplyDAO replyDao;
	
	

	
	public int replyWrite(Post_reply reply) {
		return replyDao.insert(reply);
	}

	public int getTotalRows() {
		int totalRows = replyDao.countAll();
		return totalRows;
	}
	
	public int getreplyCount(Post_reply reply) {
		int count = replyDao.replyCount(reply);
		return count;
	}

	public Post_reply getReply(int rnumber) {
		Post_reply reply = replyDao.selectByRno(rnumber);
		return reply;
	}
	
	public void replyDelete(int rnumber) {
		int rows = replyDao.deleteByRnumber(rnumber);
	}

	public List<Post_reply> getReplyList(Post_reply reply) {
		List<Post_reply> list = replyDao.selectByPage(reply);
		return list;
	}
}
