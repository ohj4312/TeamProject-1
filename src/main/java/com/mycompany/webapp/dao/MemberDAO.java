package com.mycompany.webapp.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.mycompany.webapp.controller.SelfGuideController;
import com.mycompany.webapp.dto.Member;
import com.mycompany.webapp.dto.Register_photo;
import com.mycompany.webapp.dto.SelfGuide;

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

	public List<SelfGuide> selectSelfGuideList(String memail) {
		List<SelfGuide> list=sst.selectList("mybatis.mapper.selfguide.selectSelfGuide", memail);
		return list;
	}

	public void updateMimage(Member member) {
		sst.update("mybatis.mapper.member.updateMimage",member);
		
	}

	public String selectPassword(Member member) {
		
		return sst.selectOne("mybatis.mapper.member.selectPassword",member);
	}

	public void updatePassword(Member member) {
		sst.update("mybatis.mapper.member.updatePassword",member);
		
	}

	public void deleteMember(Member member) {
		sst.delete("mybatis.mapper.member.deleteMember",member);
		
	}

}
