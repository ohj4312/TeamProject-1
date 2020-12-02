package com.mycompany.webapp.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.mycompany.webapp.dto.Community;

@Repository
public class C_ReplyDao {
	@Resource
	private SqlSessionTemplate sst;
	
	private static final Logger logger = LoggerFactory.getLogger(C_ReplyDao.class);
	
	//댓글 입력하기
	public int comm_replyInsert(Community community) {
		int rows = sst.insert("mybatis.mapper.community.communityReplyInsert", community);
		return rows;
	}
	
	//Detail로 가기
	public Community communitySelectOne(Community community){
		Community comm_list = sst.selectOne("mybatis.mapper.community.communityselectOne", community);
		return comm_list;
	}
	
	//댓글 리스트 출력하기
	public Community communityReplyList(int cnumber) {
		Community comm_list = sst.selectOne("mybatis.mapper.community.communityReplyInsert", cnumber);
		return comm_list;
	}
	
	//댓글 갯수
	public int communityReplyCount(Community community) {
		int count = sst.selectOne("mybatis.mapper.community.communityreplyCount", community);
		logger.info("Count"+count);
		return count;
	}
	
	//댓글 페이지 처리
	public List<Community> ReplyPage(Community community){
		List<Community> list = sst.selectList("mybatis.mapper.community.communityReplyByPage", community);
		return list;
	}
}
