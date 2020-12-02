package com.mycompany.webapp.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.mycompany.webapp.dto.Community;

@Repository
public class C_ReplyDao {

	private SqlSessionTemplate sst;
	
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
	/*public Community communityReplyList(int c_number) {
		
	}*/
}
