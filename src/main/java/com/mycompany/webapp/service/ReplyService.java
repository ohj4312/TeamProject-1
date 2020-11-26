package com.mycompany.webapp.service;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.mycompany.webapp.controller.ReplyController;
import com.mycompany.webapp.dao.ReplyDAO;
import com.mycompany.webapp.dto.Pager;
import com.mycompany.webapp.dto.Post_reply;

@Service
public class ReplyService {
	private static final Logger logger = LoggerFactory.getLogger(ReplyService.class);
	
	@Resource
	private ReplyDAO replyDao;
	
	

	
	public int replyWrite(Post_reply reply) {
		return replyDao.insert(reply);
	}

	
	public int getreplyCount(Post_reply reply) {
		int count = replyDao.replyCount(reply);
		logger.info("getreplyCount : "+count);
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
