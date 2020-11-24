package com.mycompany.webapp.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.mycompany.webapp.dto.Pager;
import com.mycompany.webapp.dto.Post_reply;

@Repository
public class ReplyDAO {
	@Resource
	private SqlSessionTemplate sst;
		
	public List<Post_reply> selectAll(){
		List<Post_reply> list = sst.selectList("mybatis.mapper.reply.selectAll");
		return list;
	}
	public int insert(Post_reply reply) {
		int rows = sst.insert("mybatis.mapper.reply.insert", reply);
		return rows;
	}
	
	public List<Post_reply> selectByPage(Pager pager) {
		List<Post_reply> list = sst.selectList("mybatis.mapper.reply.selectByPage", pager);
		return list;
	}

	public int countAll() {
		int totalRows = sst.selectOne("mybatis.mapper.reply.countAll");
		return totalRows;
	}

	public Post_reply selectByBno(int bno) {
		Post_reply board = sst.selectOne("mybatis.mapper.reply.selectByBno", bno);
		return board;
	}
}
