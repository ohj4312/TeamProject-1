package com.mycompany.webapp.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.mycompany.webapp.dto.Follows;


@Repository
public class FollowDAO {
	private static final Logger logger = LoggerFactory.getLogger(FollowDAO.class);
	@Resource
	private SqlSessionTemplate sst;
	
	//follow 추가하기
	public int insertfollow(Follows follows) {
		int rows=sst.insert("mybatis.mapper.board.following", follows);
		logger.info("insert확인 : "+rows);
		return rows;
	}
	
	//following한 사람들 조회하기
	public List<Follows> selectByFollowing(String memail){
		List<Follows> list=sst.selectList("mybatis.mapper.board.selectByFollowing",memail);
		return list;
	}
	//follow한 사람들 조회하기
	public List<Follows> selectByfollow(String memail){
		List<Follows> list=sst.selectList("mybatis.mapper.board.selectByfollow",memail);
		return list;
	}
	
}
