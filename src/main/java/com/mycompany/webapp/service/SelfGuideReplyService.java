package com.mycompany.webapp.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.ReplyDAO;
import com.mycompany.webapp.dao.SelfGuideReplyDAO;
import com.mycompany.webapp.dto.SelfGuide_reply;

@Service
public class SelfGuideReplyService {
	
	@Resource
	private SelfGuideReplyDAO selfreplyDAO;
	
	
	public void replyWrite(SelfGuide_reply sg_reply) {
		
		selfreplyDAO.replyWirte(sg_reply);
		
	}


	public int getReplyCount(SelfGuide_reply sg_reply) {
		int count = selfreplyDAO.getReplyCount(sg_reply);
		return count;
	}


	public List<SelfGuide_reply> getReplyList(SelfGuide_reply sg_reply) {
		List<SelfGuide_reply> list=selfreplyDAO.getReplyList(sg_reply);
		return list;
	}


	public void replyDelete(int snumber) {
		selfreplyDAO.replyDelete(snumber);
	}
}
