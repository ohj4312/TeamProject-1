package com.mycompany.webapp.dao;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.mycompany.webapp.dto.Member;

@Repository
public class MemberDAO {

	@Resource
	private SqlSessionTemplate sst;
	
	public int insert(Member member) {
		return sst.insert("mybatis.mapper.member.insert", member);
	}

}
