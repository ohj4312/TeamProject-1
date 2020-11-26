package com.mycompany.webapp.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.mycompany.webapp.dto.Follows;
import com.mycompany.webapp.dto.Member;


@Repository
public class FollowDAO {
	private static final Logger logger = LoggerFactory.getLogger(FollowDAO.class);
	@Resource
	private SqlSessionTemplate sst;
	
	//follow 추가하기
	public int insertfollow(Follows follows) {
		int rows=sst.insert("mybatis.mapper.follows.following", follows);
		return rows;
	}
	
	//following한 사람들 조회하기
	public List<Follows> selectByFollowing(String memail){
		List<Follows> list=sst.selectList("mybatis.mapper.follows.selectByFollowing",memail);
		return list;
	}
	//follow한 사람들 조회하기
	public List<Follows> selectByFollow(String memail){
		List<Follows> list=sst.selectList("mybatis.mapper.follows.selectByfollow",memail);
		return list;
	}
	
	public int deletefollow(Follows follows) {
		int row=sst.delete("mybatis.mapper.follows.deleteByFollow", follows);
		return row;
	}

	public int selectChecking(Follows follow) {
		logger.info("실행1111111111");
		int result=sst.selectOne("mybatis.mapper.follows.selectChecking",follow);
		logger.info(""+result);
		return result;
	}

	public Member selectFollowInfo(String memail) {
		Member member=sst.selectOne("mybatis.mapper.follows.selectFollowInfo",memail);
		return member;
	}
	
}
