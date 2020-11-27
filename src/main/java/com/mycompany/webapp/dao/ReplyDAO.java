package com.mycompany.webapp.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.mycompany.webapp.controller.ReplyController;
import com.mycompany.webapp.dto.Pager;
import com.mycompany.webapp.dto.Post_reply;

@Repository
public class ReplyDAO {
	@Resource
	private SqlSessionTemplate sst;
	private static final Logger logger = LoggerFactory.getLogger(ReplyDAO.class);

	public int insert(Post_reply reply) {
		int rows = sst.insert("mybatis.mapper.reply.insert", reply);
		return rows;
	}
	
	public int replyCount(Post_reply reply) {
		int count = sst.selectOne("mybatis.mapper.reply.replyCount", reply);
		logger.info("replyCount:"+count);
		return count;
	}


	public Post_reply selectByRno(int rnumber) {
		Post_reply reply = sst.selectOne("mybatis.mapper.reply.selectByRno", rnumber);
		return reply;
	}
	public int deleteByRnumber(int rnumber) {
		int rows = sst.delete("mybatis.mapper.reply.deleteByRnumber", rnumber);
		return rows;
	}

	public List<Post_reply> selectByPage(Post_reply reply) {
		List<Post_reply> list = sst.selectList("mybatis.mapper.reply.selectByPage", reply);
		//List<Post_reply> list = sst.selectList("mybatis.mapper.reply.selectAll", reply);
		return list;
	}
}
