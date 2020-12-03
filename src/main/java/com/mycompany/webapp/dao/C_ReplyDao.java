package com.mycompany.webapp.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.mycompany.webapp.dto.Community;
import com.mycompany.webapp.dto.Pager;

@Repository
public class C_ReplyDao {
	@Resource
	private SqlSessionTemplate sst;

	public int comm_replyselectRows(int c_number) {
		
		int rows=sst.selectOne("mybatis.mapper.community.communitySelectrow", c_number);
		return rows;
	}

	public List<Community> comm_rlplylistAll(Pager pager) {
		
		List<Community> list = sst.selectList("mybatis.mapper.community.communitylist", pager);
		return list;
	}


	
	
}
