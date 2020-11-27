package com.mycompany.webapp.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.B_ReplyDao;
import com.mycompany.webapp.dao.BoardDao;

@Service
public class BoardService {
	@Resource
	private BoardDao boardDao;
	private B_ReplyDao b_replyDao;
	

}
