package com.mycompany.webapp.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.mycompany.webapp.dto.SelfGuide_reply;

@Repository
public class SelfGuideReplyDAO {
	
	@Resource
	private SqlSessionTemplate sst;
	
	private static final Logger logger = LoggerFactory.getLogger(ReplyDAO.class);

	public void replyWirte(SelfGuide_reply sg_reply) {
		
		sst.insert("mybatis.mapper.selfreply.insert",sg_reply);
	}

	public int getReplyCount(SelfGuide_reply sg_reply) {
		return sst.selectOne("mybatis.mapper.selfreply.selectOne",sg_reply);
		
	}

	public List<SelfGuide_reply> getReplyList(SelfGuide_reply sg_reply) {
		return sst.selectList("mybatis.mapper.selfreply.selectList",sg_reply);
	}

	public void replyDelete(int snumber) {
		sst.selectOne("mybatis.mapper.selfreply.delete",snumber);
		
	}
}
