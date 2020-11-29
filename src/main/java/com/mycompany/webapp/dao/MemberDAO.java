package com.mycompany.webapp.dao;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.mycompany.webapp.dto.Member;
import com.mycompany.webapp.dto.Register_photo;

@Repository
public class MemberDAO {

	@Resource
	private SqlSessionTemplate sst;
	
	public int insert(Member member) {
		return sst.insert("mybatis.mapper.member.insert", member);
	}

	public Member selectMember(String name) {
		// TODO Auto-generated method stub
		return sst.selectOne("mybatis.mapper.member.selectMember", name);
	}

	public Member getProfilInfo(String pwriter) {
		// TODO Auto-generated method stub
		return sst.selectOne("mybatis.mapper.member.selectnicnameNmimage", pwriter);
	}

}
