package com.mycompany.webapp.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.C_ReplyDao;
import com.mycompany.webapp.dao.CommunityDao;

@Service
public class CommunityService {
	@Resource
	private CommunityDao communityDao;
	@Resource
	private C_ReplyDao c_replyDao;
	
	
	

}
